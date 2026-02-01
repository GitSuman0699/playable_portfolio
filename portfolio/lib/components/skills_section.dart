import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

/// Skill data model
class Skill {
  final String name;
  final String? icon;

  const Skill(this.name, {this.icon});
}

/// Skills section with categorized chips/badges.
class SkillsSection extends StatelessComponent {
  const SkillsSection({super.key});

  static const coreMobileSkills = [
    Skill('Flutter', icon: '📱'),
    Skill('Dart', icon: '🎯'),
    Skill('Method Channels', icon: '🔗'),
    Skill('Android Architecture', icon: '🤖'),
    Skill('iOS Architecture', icon: '🍎'),
  ];

  static const stateManagementSkills = [
    Skill('BloC', icon: '🧊'),
    Skill('Riverpod', icon: '🌊'),
    Skill('GetX', icon: '⚡'),
    Skill('MVVM/MVC', icon: '🏗️'),
    Skill('Clean Architecture', icon: '✨'),
    Skill('SOLID Principles', icon: '📐'),
  ];

  static const frontendSkills = [
    Skill('Complex Animations', icon: '🎬'),
    Skill('Custom Painters', icon: '🎨'),
    Skill('Responsive Design', icon: '�'),
    Skill('Performance Profiling', icon: '⚡'),
  ];

  static const backendCloudSkills = [
    Skill('gRPC (Protobufs)', icon: '🔌'),
    Skill('GraphQL', icon: '�'),
    Skill('REST APIs', icon: '�'),
    Skill('Firebase', icon: '🔥'),
    Skill('AWS Cognito', icon: '☁️'),
    Skill('Stripe', icon: '💳'),
    Skill('Razorpay', icon: '�'),
  ];

  static const devOpsSkills = [
    Skill('CI/CD Pipelines', icon: '�'),
    Skill('Git (Git-flow)', icon: '📂'),
    Skill('TDD/BDD', icon: '🧪'),
    Skill('Unit & Widget Testing', icon: '✅'),
    Skill('Jira', icon: '�'),
  ];

  static const designToolsSkills = [
    Skill('Figma', icon: '🎨'),
    Skill('Postman', icon: '📮'),
    Skill('AI-Assisted Dev', icon: '🤖'),
  ];

  @override
  Component build(BuildContext context) {
    return section(id: 'skills', classes: 'skills-section', [
      div(classes: 'section-header', [
        h2([text('Technical Skills')]),
        p([text('Expertise in mobile development and modern architecture')]),
      ]),
      div(classes: 'skills-container', [
        _buildSkillCategory('Core Mobile', '📱', coreMobileSkills),
        _buildSkillCategory('State Management & Architecture', '🏗️', stateManagementSkills),
        _buildSkillCategory('Frontend Logic & UI', '🎨', frontendSkills),
        _buildSkillCategory('Backend Integration & Cloud', '☁️', backendCloudSkills),
        _buildSkillCategory('DevOps & Tools', '🛠️', devOpsSkills),
        _buildSkillCategory('Design Tools', '✨', designToolsSkills),
      ]),
    ]);
  }

  Component _buildSkillCategory(String title, String icon, List<Skill> skills) {
    return div(classes: 'skill-category', [
      div(classes: 'category-header', [
        span(classes: 'category-icon', [text(icon)]),
        h3([text(title)]),
      ]),
      div(classes: 'skill-chips', [
        for (var skill in skills)
          span(classes: 'skill-chip', [
            if (skill.icon != null) span(classes: 'chip-icon', [text(skill.icon!)]),
            text(skill.name),
          ]),
      ]),
    ]);
  }
}
