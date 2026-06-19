import 'package:flutter/material.dart';
import '../../Classes/app_colors.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.surface,
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 28),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            '© 2026 Sam Robertson.',
            style: TextStyle(color: AppColors.textMuted, fontSize: 13),
          ),
          Row(
            children: [
              const Icon(
                Icons.favorite_rounded,
                color: AppColors.accent,
                size: 14,
              ),
              const SizedBox(width: 6),
              const Text(
                'Made from scratch with Flutter',
                style: TextStyle(color: AppColors.textMuted, fontSize: 13),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
