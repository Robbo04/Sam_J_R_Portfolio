// ─── Data Models ─────────────────────────────────────────────────────────────

class Project {
  final String title;
  final String description;
  final String? imagePath;
  final List<String> tags;
  final String? githubUrl;
  final String? liveUrl;

  const Project({
    required this.title,
    required this.description,
    this.imagePath,
    this.tags = const [],
    this.githubUrl,
    this.liveUrl,
  });
}

class SkillGroup {
  final String category;
  final List<String> skills;

  const SkillGroup({required this.category, required this.skills});
}

class Education {
  final String institution;
  final String degree;
  final String period;
  final String? description;

  const Education({
    required this.institution,
    required this.degree,
    required this.period,
    this.description,
  });
}

// ─── Portfolio Data (replace with your own) ───────────────────────────────────

const List<Project> portfolioProjects = [
  Project(
    title: 'Project One',
    description:
        'A brief description of what this project does and the problem it solves.',
    tags: ['Flutter', 'Dart', 'Firebase'],
  ),
  Project(
    title: 'Project Two',
    description:
        'A brief description of what this project does and the problem it solves.',
    tags: ['Unity', 'C#', 'Game Dev'],
  ),
  Project(
    title: 'Project Three',
    description:
        'A brief description of what this project does and the problem it solves.',
    tags: ['Android', 'Kotlin'],
  ),
  Project(
    title: 'Project Four',
    description:
        'A brief description of what this project does and the problem it solves.',
    tags: ['Python', 'FastAPI'],
  ),
];

const List<SkillGroup> portfolioSkills = [
  SkillGroup(
    category: 'LANGUAGES',
    skills: ['Dart', 'C#', 'Python', 'C++'],
  ),
  SkillGroup(
    category: 'FRAMEWORKS & ENGINES',
    skills: ['Flutter', 'Unity', 'Unreal Engine', 'Visual Studio', 'VS Code', 'Clion'],
  ),
  SkillGroup(
    category: 'TOOLS',
    skills: ['Git', 'GitHub', 'VS Code', 'Figma', 'Postman', 'Jira', 'Trello'],
  ),
];

const List<Education> portfolioEducation = [
  Education(
    institution: 'UWE Bristol University',
    degree: 'Bachelor of Games Technology (BSc) 2:1',
    period: '2022 – 2025',
    description:
        'Relevant courses: Comprehensive Creative Technologies Project (Exploring "Dumb" vs "Smart" AI in stealth games) - Commercial Games Development - Gameplay Programming (Unreal Engine) - Advanced Technology - Play & Games (Tabletop Design) - Game Engine Programming (Unity & Unreal) - Games in C++ - Programming in Python.',
  ),
];
