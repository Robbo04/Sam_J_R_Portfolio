import 'package:flutter/material.dart';
import '../../Classes/app_colors.dart';
import '../../Widgets/buttons.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key, required this.onViewProjects});

  final VoidCallback onViewProjects;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.sizeOf(context).height;
    return Container(
      height: h,
      color: AppColors.bg,
      padding: const EdgeInsets.symmetric(horizontal: 80),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'SOFTWARE  ·  GAMES  ·  APPS',
                  style: TextStyle(
                    color: AppColors.accent,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 4,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Hi, I'm Sam.",
                  style: TextStyle(
                    color: AppColors.text,
                    fontSize: 72,
                    fontWeight: FontWeight.w800,
                    height: 1.1,
                    letterSpacing: -1.5,
                  ),
                ),
                const SizedBox(height: 22),
                const Text(
                  'I\'m a UWE Bristol University Games Technology graduate, and I build software, games, and apps that\nare fast, polished, and built to last.',
                  style: TextStyle(
                    color: AppColors.textMuted,
                    fontSize: 19,
                    height: 1.65,
                  ),
                ),
                const SizedBox(height: 44),
                Row(
                  children: [
                    PrimaryButton(
                      label: 'View Projects',
                      onTap: onViewProjects,
                    ),
                    const SizedBox(width: 18),
                    BorderButton(
                      label: 'Download Resume',
                      icon: Icons.download_rounded,
                      onTap: () {
                        // TODO: launch resume PDF URL
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          const _HeroOrb(),
        ],
      ),
    );
  }
}

class _HeroOrb extends StatelessWidget {
  const _HeroOrb();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 420,
      height: 420,
      child: Stack(
        alignment: Alignment.center,
        children: [
          _ring(380, 0.10),
          _ring(290, 0.20),
          Container(
            width: 210,
            height: 210,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  AppColors.accent.withOpacity(0.25),
                  AppColors.accent.withOpacity(0.0),
                ],
              ),
            ),
          ),
          Container(
            width: 170,
            height: 170,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.card,
              border: Border.all(color: AppColors.accent, width: 2),
            ),
            child: const Icon(
              Icons.person_rounded,
              color: AppColors.textMuted,
              size: 84,
            ),
          ),
        ],
      ),
    );
  }

  Widget _ring(double size, double opacity) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.accent.withOpacity(opacity),
          width: 1,
        ),
      ),
    );
  }
}
