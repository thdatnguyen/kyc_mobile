import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/theme/app_theme.dart';
import '../../core/widgets/ppac_logo.dart';
import '../../features/auth/presentation/adapter/auth.adapter.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  static const path = '/splash';

  @override
  ConsumerState<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animController;
  late final Animation<double> _fadeAnim;
  late final Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();

    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _fadeAnim = CurvedAnimation(
      parent: _animController,
      curve: Curves.easeOut,
    );

    _scaleAnim = Tween<double>(begin: 0.9, end: 1.0).animate(
      CurvedAnimation(
        parent: _animController,
        curve: Curves.easeOutBack,
      ),
    );

    _animController.forward();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(authControllerProvider.notifier).checkSession();
    });
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.primary,
      body: SafeArea(
        child: Stack(
          children: [
            // Background ambient lighting glow
            Positioned(
              top: -80,
              right: -80,
              child: Container(
                width: 280,
                height: 280,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colours.brandNeon.withAlpha(20),
                ),
              ),
            ),
            Positioned(
              bottom: -100,
              left: -60,
              child: Container(
                width: 320,
                height: 320,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colours.brandLight.withAlpha(15),
                ),
              ),
            ),

            // Center branding hero
            Center(
              child: FadeTransition(
                opacity: _fadeAnim,
                child: ScaleTransition(
                  scale: _scaleAnim,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 36),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Logo Card Container
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 28,
                            vertical: 22,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(28),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withAlpha(40),
                                blurRadius: 24,
                                offset: const Offset(0, 12),
                              ),
                            ],
                          ),
                          child: const PpacLogo(
                            variant: PpacLogoVariant.darkGreen,
                            height: 60,
                          ),
                        ),
                        const SizedBox(height: 32),

                        // Title
                        Text(
                          'PPAC',
                          style: GoogleFonts.unbounded(
                            fontSize: 32,
                            fontWeight: FontWeight.w800,
                            color: Colours.brandNeon,
                            letterSpacing: 2.5,
                          ),
                        ),
                        const SizedBox(height: 10),

                        // Tagline
                        Text(
                          'Trusted by Construction.\nCompliance made simple.',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colours.brandBeige.withAlpha(230),
                            height: 1.45,
                          ),
                        ),
                        const SizedBox(height: 48),

                        // Progress Indicator
                        const SizedBox(
                          width: 32,
                          height: 32,
                          child: CircularProgressIndicator(
                            strokeWidth: 3.0,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colours.brandNeon),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Footer Company Ownership
            Positioned(
              left: 0,
              right: 0,
              bottom: 24,
              child: Text(
                'PPAC Solutions Limited',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colours.brandBeige.withAlpha(150),
                  letterSpacing: 1.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
