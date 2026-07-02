import 'package:flutter/material.dart';
import '../../Classes/app_colors.dart';
import '../../Widgets/buttons.dart';
import '../../Widgets/hover_builder.dart';
import '../../Widgets/section_widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      color: AppColors.bg,
      title: "Let's Connect",
      subtitle: 'Open to work, freelance opportunities, and collaborations. Feel free to drop a message!',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _ContactCard(
                icon: Icons.email_outlined,
                label: 'EMAIL',
                value: 's5robertsonwork@outlook.com',
                onTap: () {
                  //to do: launchUrl
                },
              ),
              const SizedBox(width: 20),
              _ContactCard(
                icon: Icons.code_rounded,
                label: 'GITHUB',
                value: 'GitHub Profile',
                onTap: () {
                  // TODO: launchUrl(Uri.parse('https://github.com/Robbo04'))
                  launchUrl(Uri.parse('https://github.com/Robbo04'));
                },
              ),
              const SizedBox(width: 20),
              _ContactCard(
                icon: Icons.link_rounded,
                label: 'LINKEDIN',
                value: 'LinkedIn Profile',
                onTap: () {
                  // TODO: launchUrl(Uri.parse('https://www.linkedin.com/in/sam-robertson-46a491309'))
                  launchUrl(Uri.parse('https://www.linkedin.com/in/sam-robertson-46a491309'));
                },
              ),
            ],
          ),
          const SizedBox(height: 48),
          Center(
            child: BorderButton(
              label: 'Download Resume',
              icon: Icons.download_rounded,
              onTap: () {
                // TODO: launchUrl(Uri.parse('https://yourresume.pdf'))
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactCard extends StatelessWidget {
  const _ContactCard({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final String value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: HoverBuilder(
        builder: (_, hovered) => GestureDetector(
          onTap: onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            padding: const EdgeInsets.all(26),
            decoration: BoxDecoration(
              color: hovered ? AppColors.card : AppColors.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: hovered
                    ? AppColors.accent.withOpacity(0.55)
                    : AppColors.border,
              ),
            ),
            child: Row(
              children: [
                IconBadge(icon: icon, size: 46, iconSize: 22, radius: 12),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        label,
                        style: const TextStyle(
                          color: AppColors.textMuted,
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 2,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        value,
                        style: const TextStyle(
                          color: AppColors.text,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
