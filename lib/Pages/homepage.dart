import 'package:flutter/material.dart';
import '../Classes/app_colors.dart';
import 'Sections/nav_bar.dart';
import 'Sections/hero_section.dart';
import 'Sections/projects_section.dart';
import 'Sections/skills_section.dart';
import 'Sections/education_section.dart';
import 'Sections/contact_section.dart';
import 'Sections/footer.dart';
import '../Widgets/fadeIn.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();

  final _heroKey = GlobalKey();
  final _projectsKey = GlobalKey();
  final _skillsKey = GlobalKey();
  final _educationKey = GlobalKey();
  final _contactKey = GlobalKey();

  void _scrollTo(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx == null) return;
    Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                HeroSection(
                  key: _heroKey,
                  onViewProjects: () => _scrollTo(_projectsKey),
                ),
                ProjectsSection(key: _projectsKey),
                SkillsSection(key: _skillsKey),
                EducationSection(key: _educationKey),
                ContactSection(key: _contactKey),
                const Footer(),
              ],
            ),
          ),
          NavBar(
            onHome: () => _scrollTo(_heroKey),
            onProjects: () => _scrollTo(_projectsKey),
            onSkills: () => _scrollTo(_skillsKey),
            onEducation: () => _scrollTo(_educationKey),
            onContact: () => _scrollTo(_contactKey),
          ),
        ],
      ),
    );
  }
}

// ─── Nav Bar ──────────────────────────────────────────────────────────────────





// ─── Shared Buttons ───────────────────────────────────────────────────────────





// ─── Section Header ───────────────────────────────────────────────────────────



// ─── Hero Section ─────────────────────────────────────────────────────────────



// ─── Projects Section ─────────────────────────────────────────────────────────





// ─── Skills Section ───────────────────────────────────────────────────────────



// ─── Education Section ────────────────────────────────────────────────────────



// ─── Contact Section ──────────────────────────────────────────────────────────



// ─── Footer ───────────────────────────────────────────────────────────────────


