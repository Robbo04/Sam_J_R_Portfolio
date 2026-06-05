import 'dart:ui';
import 'package:flutter/material.dart';
import '../../Classes/app_colors.dart';
import '../../Widgets/buttons.dart';
import '../../Widgets/hover_builder.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
    required this.onHome,
    required this.onProjects,
    required this.onSkills,
    required this.onEducation,
    required this.onContact,
  });

  final VoidCallback onHome;
  final VoidCallback onProjects;
  final VoidCallback onSkills;
  final VoidCallback onEducation;
  final VoidCallback onContact;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
          child: Container(
            color: AppColors.navBg,
            padding:
                const EdgeInsets.symmetric(horizontal: 64, vertical: 18),
            child: Row(
              children: [
                GestureDetector(
                  onTap: onHome,
                  child: const Text(
                    'Sam',
                    style: TextStyle(
                      color: AppColors.accent,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 2,
                    ),
                  ),
                ),
                const Spacer(),
                _NavLink(label: 'Projects', onTap: onProjects),
                _NavLink(label: 'Skills', onTap: onSkills),
                _NavLink(label: 'Education', onTap: onEducation),
                _NavLink(label: 'Contact', onTap: onContact),
                const SizedBox(width: 20),
                BorderButton(
                  label: 'Resume',
                  icon: Icons.download_rounded,
                  onTap: () {
                    // TODO: launch resume PDF URL
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavLink extends StatelessWidget {
  const _NavLink({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return HoverBuilder(
      builder: (_, hovered) => GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 150),
            style: TextStyle(
              color: hovered ? AppColors.accent : AppColors.textMuted,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            child: Text(label),
          ),
        ),
      ),
    );
  }
}
