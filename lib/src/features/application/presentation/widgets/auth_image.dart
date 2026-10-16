import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_client.dart';

/// Displays a media asset by `publicId` through the authenticated backend
/// `/api/media` endpoint (owner- or admin-authorized, signed/redirected).
class AuthImage extends ConsumerStatefulWidget {
  const AuthImage({super.key, required this.publicId, this.fit = BoxFit.cover});

  final String publicId;
  final BoxFit fit;

  @override
  ConsumerState<AuthImage> createState() => _AuthImageState();
}

class _AuthImageState extends ConsumerState<AuthImage> {
  Uint8List? _bytes;
  Object? _error;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final dio = ref.read(dioClientProvider);
      final res = await dio.get<List<int>>(
        '/api/media/${Uri.encodeComponent(widget.publicId)}',
        options: Options(responseType: ResponseType.bytes),
      );
      if (!mounted) return;
      setState(() => _bytes = Uint8List.fromList(res.data!));
    } catch (e) {
      if (!mounted) return;
      setState(() => _error = e);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_bytes != null) return Image.memory(_bytes!, fit: widget.fit);
    if (_error != null) {
      return const Center(child: Icon(Icons.broken_image_outlined));
    }
    return const Center(child: CircularProgressIndicator());
  }
}
