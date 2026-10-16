import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ml_service.g.dart';

/// Data class holding extracted CCCD QR details matching landlord_app standard.
class CccdQrResult {
  final String? idNumber;
  final String? fullName;
  final DateTime? birthDate;
  final String? gender;
  final String? permanentAddress;
  final DateTime? issueDate;
  final String rawData;

  const CccdQrResult({
    this.idNumber,
    this.fullName,
    this.birthDate,
    this.gender,
    this.permanentAddress,
    this.issueDate,
    required this.rawData,
  });

  int get detectedFieldCount {
    int count = 0;
    if (idNumber != null) count++;
    if (fullName != null) count++;
    if (birthDate != null) count++;
    if (gender != null) count++;
    if (permanentAddress != null) count++;
    if (issueDate != null) count++;
    return count;
  }
}

/// Parses raw QR string from Vietnamese CCCD into [CccdQrResult].
/// Pipe-delimited format:
/// `idNumber|oldIdNumber|fullName|birthDate(DDMMYYYY)|gender|permanentAddress|issueDate(DDMMYYYY)`
CccdQrResult parseCccdQr(String rawData) {
  final parts = rawData.split('|');

  if (parts.length < 7) {
    return CccdQrResult(rawData: rawData);
  }

  return CccdQrResult(
    idNumber: _nonEmpty(parts[0]),
    fullName: _nonEmpty(parts[2]),
    birthDate: _parseCccdDate(parts[3]),
    gender: _normalizeGender(parts[4]),
    permanentAddress: _nonEmpty(parts[5]),
    issueDate: _parseCccdDate(parts[6]),
    rawData: rawData,
  );
}

String? _nonEmpty(String? value) {
  if (value == null || value.trim().isEmpty) return null;
  return value.trim();
}

DateTime? _parseCccdDate(String? value) {
  if (value == null || value.trim().isEmpty) return null;
  final clean = value.trim();
  if (clean.length != 8) return null;
  try {
    final day = int.parse(clean.substring(0, 2));
    final month = int.parse(clean.substring(2, 4));
    final year = int.parse(clean.substring(4, 8));
    return DateTime(year, month, day);
  } catch (_) {
    return null;
  }
}

String? _normalizeGender(String? value) {
  if (value == null || value.trim().isEmpty) return null;
  final lower = value.trim().toLowerCase();
  if (lower == 'nam' || lower == 'male') return 'Nam';
  if (lower == 'nữ' || lower == 'nu' || lower == 'female') return 'Nữ';
  return value.trim();
}

/// The result of running OCR or QR scanning over an identity document:
/// best-effort extracted fields plus raw text.
class DocumentOcr {
  const DocumentOcr({
    required this.rawText,
    this.number,
    this.fullName,
    this.dateOfBirth,
    this.expiryDate,
    this.address,
    this.gender,
    this.nationality,
    this.isQrScanned = false,
  });

  final String rawText;
  final String? number;
  final String? fullName;
  final String? dateOfBirth; // YYYY-MM-DD
  final String? expiryDate; // YYYY-MM-DD
  final String? address;
  final String? gender;
  final String? nationality;
  final bool isQrScanned;
}

/// On-device ML Kit helpers (OCR + QR scanning + face detection).
@riverpod
MlService mlService(Ref ref) => MlService();

class MlService {
  /// Runs text recognition on [imagePath].
  Future<String> recognizeText(String imagePath) async {
    try {
      final recognizer = TextRecognizer(script: TextRecognitionScript.latin);
      final result = await recognizer.processImage(InputImage.fromFilePath(imagePath));
      await recognizer.close();
      return result.text;
    } catch (_) {
      return '';
    }
  }

  /// Process an identity document image using QR scanning first, then falling back to OCR.
  Future<DocumentOcr> recognizeDocument(String imagePath) async {
    // 1. Attempt QR code scanning first
    final qrResult = await _scanQrCode(imagePath);
    if (qrResult != null) {
      return qrResult;
    }

    // 2. Fallback to OCR text recognition
    final raw = await recognizeText(imagePath);
    return DocumentOcr(
      rawText: raw,
      number: _extractDocumentNumber(raw),
      fullName: _extractFullName(raw),
      dateOfBirth: _extractDateOfBirth(raw),
      expiryDate: _extractExpiryDate(raw),
      isQrScanned: false,
    );
  }

  Future<DocumentOcr?> _scanQrCode(String imagePath) async {
    try {
      final inputImage = InputImage.fromFilePath(imagePath);
      final barcodeScanner = BarcodeScanner(formats: [BarcodeFormat.qrCode, BarcodeFormat.all]);
      final barcodes = await barcodeScanner.processImage(inputImage);
      await barcodeScanner.close();

      if (barcodes.isEmpty) return null;

      for (final barcode in barcodes) {
        final rawValue = barcode.rawValue;
        if (rawValue != null && rawValue.isNotEmpty) {
          final parsed = _parseQrContent(rawValue);
          if (parsed != null) return parsed;
        }
      }
    } catch (_) {}
    return null;
  }

  DocumentOcr? _parseQrContent(String raw) {
    if (raw.contains('|')) {
      final cccd = parseCccdQr(raw);
      if (cccd.idNumber != null || cccd.fullName != null) {
        final dobStr = cccd.birthDate != null
            ? '${cccd.birthDate!.year.toString().padLeft(4, '0')}-${cccd.birthDate!.month.toString().padLeft(2, '0')}-${cccd.birthDate!.day.toString().padLeft(2, '0')}'
            : null;

        // Calculate Vietnamese CCCD expiry date based on citizen's age milestones (25, 40, 60)
        final calculatedExpiryStr =
            _calculateCccdExpiryDate(cccd.birthDate, cccd.issueDate);

        return DocumentOcr(
          rawText: raw,
          number: cccd.idNumber,
          fullName: cccd.fullName,
          dateOfBirth: dobStr,
          expiryDate: calculatedExpiryStr,
          address: cccd.permanentAddress,
          gender: cccd.gender,
          nationality: 'Vietnamese',
          isQrScanned: true,
        );
      }
    }

    return DocumentOcr(
      rawText: raw,
      number: _extractDocumentNumber(raw),
      fullName: _extractFullName(raw),
      dateOfBirth: _extractDateOfBirth(raw),
      expiryDate: _extractExpiryDate(raw),
      isQrScanned: true,
    );
  }

  /// Calculates the official Vietnamese CCCD expiry date based on the citizen's
  /// birth date and issue date (Milestones: 25, 40, and 60 years of age).
  static String? _calculateCccdExpiryDate(DateTime? birthDate, DateTime? issueDate) {
    if (birthDate == null) return null;

    final birthYear = birthDate.year;
    final issueYear = issueDate?.year ?? DateTime.now().year;
    final ageAtIssue = issueYear - birthYear;

    int? expiryAge;
    if (ageAtIssue < 23) {
      expiryAge = 25;
    } else if (ageAtIssue < 38) {
      expiryAge = 40;
    } else if (ageAtIssue < 60) {
      expiryAge = 60;
    } else {
      // Over 60: Valid indefinitely
      return null;
    }

    final expiryDate = DateTime(
      birthYear + expiryAge,
      birthDate.month,
      birthDate.day,
    );

    return '${expiryDate.year.toString().padLeft(4, '0')}-${expiryDate.month.toString().padLeft(2, '0')}-${expiryDate.day.toString().padLeft(2, '0')}';
  }

  String? _extractDocumentNumber(String text) {
    final tokens = text
        .split(RegExp(r'\s+'))
        .where((t) => RegExp(r'^[A-Za-z0-9]{5,20}$').hasMatch(t))
        .toList()
      ..sort((a, b) => b.length.compareTo(a.length));
    return tokens.isEmpty ? null : tokens.first;
  }

  String? _extractFullName(String text) {
    final lines = text.split('\n');
    for (int i = 0; i < lines.length; i++) {
      final line = lines[i].trim();
      final lower = line.toLowerCase();
      if (lower.contains('name') || lower.contains('họ và tên') || lower.contains('ho va ten')) {
        final nextLine = (i + 1 < lines.length) ? lines[i + 1].trim() : '';
        if (nextLine.isNotEmpty && RegExp(r'^[A-Z\s]{3,40}$').hasMatch(nextLine)) {
          return nextLine;
        }
      }
      if (RegExp(r'^[A-Z\s]{5,35}$').hasMatch(line) && line.contains(' ')) {
        if (!line.contains('REPUBLIC') && !line.contains('IDENTITY') && !line.contains('PASSPORT')) {
          return line;
        }
      }
    }
    return null;
  }

  String? _extractDateOfBirth(String text) {
    final match = RegExp(
      r'(?:dob|birth|sinh)[:\s]*(\d{2}[/.-]\d{2}[/.-]\d{4}|\d{4}[/.-]\d{2}[/.-]\d{2})',
      caseSensitive: false,
    ).firstMatch(text);
    if (match != null) {
      return _normalizeDate(match.group(1)!);
    }
    return null;
  }

  String? _extractExpiryDate(String text) {
    final match = RegExp(
      r'(?:exp|expiry|hạn)[:\s]*(\d{2}[/.-]\d{2}[/.-]\d{4}|\d{4}[/.-]\d{2}[/.-]\d{2})',
      caseSensitive: false,
    ).firstMatch(text);
    if (match != null) {
      return _normalizeDate(match.group(1)!);
    }
    return null;
  }

  String? _normalizeDate(String dateStr) {
    final clean = dateStr.replaceAll('.', '/').replaceAll('-', '/');
    return _formatSlashDate(clean);
  }

  static String? _formatSlashDate(String d) {
    final parts = d.split('/');
    if (parts.length == 3) {
      return '${parts[2]}-${parts[1].padLeft(2, '0')}-${parts[0].padLeft(2, '0')}';
    }
    return null;
  }

  /// Liveness check helper.
  Future<bool> detectFaceWithEyesOpen(String imagePath) async {
    try {
      final detector = FaceDetector(
        options: FaceDetectorOptions(enableClassification: true, minFaceSize: 0.15),
      );
      final faces = await detector.processImage(InputImage.fromFilePath(imagePath));
      await detector.close();

      if (faces.length != 1) return false;
      final face = faces.first;
      final left = face.leftEyeOpenProbability ?? 0;
      final right = face.rightEyeOpenProbability ?? 0;
      return left > 0.5 && right > 0.5;
    } catch (_) {
      return false;
    }
  }
}
