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
  final String? period;
  final String? description;

  const Education({
    required this.institution,
    required this.degree,
    this.period,
    this.description,
  });
}

// ─── Portfolio Data (replace with your own) ───────────────────────────────────

const List<Project> portfolioProjects = [  
  Project(
    title: 'Dissertation: "Dumb" vs "Smart" AI in Stealth Games',
    description:
        'For my dissertation, I created a stealth environment with two different enemmy AIs in Unreal Engine to explore whether a "smarter" more realistic behaviour would enhance or hinder the experience over typical game behaviours.',
    tags: ['Unreal Engine', 'AI'],
    imagePath: '/Users/samrobertson/Development/Sam_J_R_Portfolio/lib/Resources/Images/projects/stealth.png',
  ),
  Project(
    //Tiga awards 2025 nominee for student best game
    title: 'Commercial Game: "Temple Trouble"',
    description:
        'Tiga Awards 2025 nominee. An Isometric, Puzzle-Platforming Adventure, with the core gameplay loop using an ancient hammer to interact with the world.',
    tags: ['Unreal Engine', 'Group Game', 'Optimisation', 'Final Year Project'],
    imagePath: '/Users/samrobertson/Development/Sam_J_R_Portfolio/lib/Resources/Images/projects/TTrelicRoom.png',
  ),
  Project(
    title: 'Global Game Jam 2025: "Washing Fever"',
    description:
        'Placed 2nd out of 15 uwe teams. Theme: "BUBBLES". This game is a rhythm-based, 2D, music game where I collaborated with a team including game devs, musicians, digital media and artists.',
    tags: ['Unity', 'Group Game', 'Game Jam', 'Group Collaboration'],
    imagePath: '/Users/samrobertson/Development/Sam_J_R_Portfolio/lib/Resources/Images/projects/WFl2.png',
  ),
  Project(
    title: 'Global Game Jam 2026 - "Ugly Waters Duty"',
    description: 'Theme: "MASKS". This 3d game involves you, a mechanic on an oil rig, working during a storm before to stop it sinking. I collaborated with a team including game devs, musicians and artists.',
    tags: ['Unity', 'Group Game', 'Game Jam', 'Group Collaboration'],
    imagePath: 'lib/Resources/Images/projects/UglyWatersDuty.png', //placeholder
  ),
  Project(
    title: 'Advanced Technology - Final Year Projects',
    description:
        'This module included 2 projects, the first tackles rendering a different art style in run time, whilst the second focuses on gamification for chronic conditions.',
    tags: ['Unreal Engine', 'Rendering', 'Unity', 'Chronic Conditions', 'Final Year Project'],
    imagePath: '/Users/samrobertson/Development/Sam_J_R_Portfolio/lib/Resources/Images/projects/AT_Toon.png',
  ),
  Project(
    title: 'Gameplay Programming - 2nd Year Project',
    description:
        'Given the freedom to create a 3d game demo using Unreal Engine, I created a magic action platformer where the player could cast projectile spells and dash which included special environmental interactions.',
    tags: ['Unreal Engine', 'Game Design', '2nd year project'],
    imagePath: '/Users/samrobertson/Development/Sam_J_R_Portfolio/lib/Resources/Images/projects/Gameplay.png',
  ),
  Project(
    title: 'C++ platformer',
    description:
        'My first year project, a 2D platformer game built in C++ using the SFML library. This project focused on basic game mechanics and collision detection.',
    tags: ['C++', 'SFML', '2D Game', '1st year project'],
    imagePath: '/Users/samrobertson/Development/Sam_J_R_Portfolio/lib/Resources/Images/projects/cppMenu.png',
  ),
  Project(
    title: 'HobbyGeekApp',
    description:
        'My first Flutter project, creating a media tracker for wishlists, owned and completed media. Currently setup API integration for Games and Anime but looking to add movies and tv.',
    tags: ['Flutter', 'Web/App Development', 'API Integration'],
    imagePath: '/Users/samrobertson/Development/Sam_J_R_Portfolio/lib/Resources/Images/projects/Geek.jpeg',
  ),
  Project(
    title: 'Personal Portfolio Website',
    description:
        'A personal portfolio website built with Flutter, showcasing my projects, skills, and education. The website is designed to be responsive and visually appealing.',
    tags: ['Flutter', 'Web Development',],
    imagePath: '/Users/samrobertson/Development/Sam_J_R_Portfolio/lib/Resources/Images/projects/Portfolio.png',
  ),
  Project(
    title: 'Resellers Bookeeping Application',
    description:
        'A project i took on for a client, creating a flutter application to help keep track of logistics, inventory, sales and calculate profit margins and taxes. Designed to prioritse ease of use and simplicity to match clients needs.',
    tags: ['Flutter', 'Client Work'],
    imagePath: '/Users/samrobertson/Development/Sam_J_R_Portfolio/lib/Resources/Images/projects/Resellers.png',
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
    description:
        'Relevant courses: Comprehensive Creative Technologies Project (Exploring "Dumb" vs "Smart" AI in stealth games) - Commercial Games Development - Gameplay Programming (Unreal Engine) - Advanced Technology - Play & Games (Tabletop Design) - Game Engine Programming (Unity & Unreal) - Games in C++ - Programming in Python.',
  ),
  Education(
    institution: 'City of Bristol College',
    degree: 'BTEC Level 3 Extended Diploma in Computing (D*D*D)',
    description:
        'Relevant courses: software development - networking - security - virtualisation - project management and systems fundamentals',
  ),
];
