import 'package:flutter/material.dart';
import '../../Classes/app_colors.dart';
import '../../Classes/models.dart';
import '../../Widgets/hover_builder.dart';
import '../../Widgets/section_widgets.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      color: AppColors.surface,
      title: 'Projects',
      subtitle: "A selection of things I've built.",
      child: LayoutBuilder(
        builder: (context, constraints) {
          final cols = constraints.maxWidth > 960 ? 3 : 2;
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: cols,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              childAspectRatio: 0.82,
            ),
            itemCount: portfolioProjects.length,
            itemBuilder: (_, i) => _ProjectCard(project: portfolioProjects[i]),
          );
        },
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  const _ProjectCard({required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    return HoverBuilder(
      builder: (_, hovered) => AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: hovered
                ? AppColors.accent.withOpacity(0.55)
                : AppColors.border,
            width: 1.5,
          ),
          boxShadow: hovered
              ? [
                  BoxShadow(
                    color: AppColors.accent.withOpacity(0.10),
                    blurRadius: 28,
                    offset: const Offset(0, 10),
                  ),
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(14)),
              child: project.imagePath != null
                  ? Image.asset(
                      project.imagePath!,
                      height: 190,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      height: 190,
                      color: AppColors.surface,
                      child: const Center(
                        child: Icon(
                          Icons.image_outlined,
                          color: AppColors.textMuted,
                          size: 52,
                        ),
                      ),
                    ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      project.title,
                      style: const TextStyle(
                        color: AppColors.text,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      project.description,
                      style: const TextStyle(
                        color: AppColors.textMuted,
                        fontSize: 13,
                        height: 1.55,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: project.tags
                          .map((t) => TagChip(label: t))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
