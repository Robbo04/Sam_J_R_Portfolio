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
    title: 'Dissertation: "Dumb" vs "Smart" AI in Stealth Games',
    description:
        'A brief description of what this project does and the problem it solves.',
    tags: ['Unreal Engine', 'AI'],
    imagePath: 'lib/Resources/Images/stealth.png',
  ),
  Project(
    title: 'Commercial Game: "Temple Trouble" - Nominated for best student game at Tiga Awards 2025',
    description:
        'A brief description of what this project does and the problem it solves.',
    tags: ['Unreal Engine', 'Group Game', 'Optimisation', 'Final Year Project'],
  ),
  Project(
    title: 'Global Game Jam 2025: "Washing Fever" - 2nd Place at UWE Bristol',
    description:
        'A brief description of what this project does and the problem it solves.',
    tags: ['Unity', 'Group Game', 'Game Jam'],
  ),
  Project(
    title: 'Global Game Jam 2026 - "Ugly Waters Duty"',
    description: 'description',
    tags: ['Unity', 'Group Game', 'Game Jam'],
  ),
  Project(
    title: 'Advanced Technology',
    description:
        'A brief description of what this project does and the problem it solves.',
    tags: ['Unreal Engine', 'Rendering', 'Unity', 'Chronic Conditions', 'Final Year Project'],
  ),
  Project(
    title: 'Gameplay Programming - Magic Action Platformer',
    description:
        'A brief description of what this project does and the problem it solves.',
    tags: ['Unreal Engine', 'Game Design', '2nd year project'],
  ),
  Project(
    title: 'C++ platformer',
    description:
        'A brief description of what this project does and the problem it solves.',
    tags: ['C++', 'SFML', '2D Game', '1st year project'],
  ),
  Project(
    title: 'HobbyGeekApp',
    description:
        'A brief description of what this project does and the problem it solves.',
    tags: ['Flutter', 'Web/App Development', 'API Integration'],
  ),
  Project(
    title: 'Personal Portfolio Website',
    description:
        'A brief description of what this project does and the problem it solves.',
    tags: ['Flutter', 'Web Development',],
  ),
  Project(
    title: 'Resellers Bookeeping Application',
    description:
        'A brief description of what this project does and the problem it solves.',
    tags: ['Flutter', 'Client Work'],
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
  Education(
    institution: 'City of Bristol College',
    degree: 'BTEC Level 3 Extended Diploma in Computing (D*D*D)',
    period: '2020 – 2022',
    description:
        'Relevant courses: software development - networking - security - virtualisation - project management and systems fundamentals',
  ),
];
