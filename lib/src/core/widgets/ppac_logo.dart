import 'package:flutter/material.dart';

enum PpacLogoVariant {
  /// Green logo suitable for light backgrounds
  green('assets/images/ppac_logo_green.png'),

  /// Dark green logo suitable for dark/light contrast backgrounds
  darkGreen('assets/images/ppac_logo_dark_green.png');

  final String assetPath;
  const PpacLogoVariant(this.assetPath);
}

class PpacLogo extends StatelessWidget {
  const PpacLogo({
    super.key,
    this.variant = PpacLogoVariant.green,
    this.height,
    this.width,
    this.fit = BoxFit.contain,
  });

  final PpacLogoVariant variant;
  final double? height;
  final double? width;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      variant.assetPath,
      height: height,
      width: width,
      fit: fit,
      errorBuilder: (context, error, stackTrace) {
        // High quality fallback logo icon if asset loading fails
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFF164400),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'PPAC',
                style: TextStyle(
                  color: Color(0xFFD0FF55),
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
