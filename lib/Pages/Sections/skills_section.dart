import 'package:flutter/material.dart';
import '../../Classes/app_colors.dart';
import '../../Classes/models.dart';
import '../../Widgets/hover_builder.dart';
import '../../Widgets/section_widgets.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      color: AppColors.bg,
      title: 'Skills',
      subtitle: 'Technologies and tools I work with.',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: portfolioSkills
            .map(
              (group) => Padding(
                padding: const EdgeInsets.only(bottom: 36),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      group.category,
                      style: const TextStyle(
                        color: AppColors.textMuted,
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 2.5,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: group.skills
                          .map((s) => _SkillChip(label: s))
                          .toList(),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _SkillChip extends StatelessWidget {
  const _SkillChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return HoverBuilder(
      builder: (_, hovered) => AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 11),
        decoration: BoxDecoration(
          color: hovered ? AppColors.accent.withOpacity(0.12) : AppColors.card,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: hovered
                ? AppColors.accent.withOpacity(0.55)
                : AppColors.border,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: hovered ? AppColors.accent : AppColors.text,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
