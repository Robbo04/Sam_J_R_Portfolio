import 'package:flutter/material.dart';
import '../../Classes/app_colors.dart';
import '../../Classes/models.dart';
import '../../Widgets/section_widgets.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      color: AppColors.surface,
      title: 'Education',
      child: Column(
        children:
            portfolioEducation.map((e) => _EducationCard(education: e)).toList(),
      ),
    );
  }
}

class _EducationCard extends StatelessWidget {
  const _EducationCard({required this.education});

  final Education education;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const IconBadge(
            icon: Icons.school_rounded,
            size: 50,
            iconSize: 26,
            radius: 14,
          ),
          const SizedBox(width: 22),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      education.institution,
                      style: const TextStyle(
                        color: AppColors.text,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    if (education.period != null)
                      _PeriodBadge(period: education.period!),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  education.degree,
                  style: const TextStyle(
                    color: AppColors.accent,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (education.description != null) ...[
                  const SizedBox(height: 12),
                  Text(
                    education.description!,
                    style: const TextStyle(
                      color: AppColors.textMuted,
                      fontSize: 14,
                      height: 1.55,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PeriodBadge extends StatelessWidget {
  const _PeriodBadge({required this.period});

  final String period;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.accentAlt.withOpacity(0.10),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.accentAlt.withOpacity(0.30)),
      ),
      child: Text(
        period,
        style: const TextStyle(
          color: AppColors.accentAlt,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
