import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

/// Experience data model
class ExperienceEntry {
  final String title;
  final String company;
  final String dateRange;
  final List<String> achievements;

  const ExperienceEntry({
    required this.title,
    required this.company,
    required this.dateRange,
    required this.achievements,
  });
}

/// Experience section with vertical timeline layout.
class ExperienceSection extends StatelessComponent {
  const ExperienceSection({super.key});

  static const experiences = [
    ExperienceEntry(
      title: 'Associate Software Developer',
      company: 'Utah Tech Labs',
      dateRange: 'Jun 2024 - Present',
      achievements: [
        'Architected scalable mobile solutions using Clean Architecture and BLoC, ensuring codebase maintainability and strict adherence to SOLID principles.',
        'Collaborated with cross-functional teams (Product, Design, QA) in an Agile/Scrum environment to deliver features that align with business goals.',
        'Accelerated development velocity by ~30% by integrating AI-assisted coding tools for writing testable code and automating unit test generation.',
        'Mentored junior developers on design patterns and best practices, fostering a culture of technical excellence and collaborative problem-solving.',
      ],
    ),
    ExperienceEntry(
      title: 'Flutter Developer',
      company: 'AseZtak',
      dateRange: 'Jan 2022 - Jun 2022',
      achievements: [
        'Delivered high-performance financial applications for 500k+ users, integrating secure payment gateways and real-time data visualization for financial tracking.',
        'Implemented secure backend connectivity using GraphQL and REST APIs, ensuring data integrity for sensitive user financial records.',
        'Optimized application performance by reducing app size and startup latency, crucial for user retention in competitive markets.',
        'Operated in a fast-paced Agile environment, taking ownership of feature rollouts from concept to deployment on Google Play and App Store.',
      ],
    ),
    ExperienceEntry(
      title: 'Software Developer',
      company: 'Military Engineering Services',
      dateRange: 'Sep 2021 - Dec 2021',
      achievements: [
        'Automated operational workflows using Google Apps Script, reducing manual processing time for internal reports.',
        'Developed a digital inventory tracking system using advanced Google Sheets functions, replacing manual ledgers and ensuring full adoption by the internal team.',
      ],
    ),
  ];

  @override
  Component build(BuildContext context) {
    return section(id: 'experience', classes: 'experience-section', [
      div(classes: 'section-header', [
        h2([text('Experience')]),
        p([text('My professional journey and accomplishments')]),
      ]),
      div(classes: 'timeline', [
        for (var entry in experiences) _buildTimelineItem(entry),
      ]),
    ]);
  }

  Component _buildTimelineItem(ExperienceEntry entry) {
    return div(classes: 'timeline-item', [
      div(classes: 'timeline-dot', []),
      div(classes: 'timeline-content', [
        span(classes: 'date', [text(entry.dateRange)]),
        h3([text(entry.title)]),
        h4([text(entry.company)]),
        ul([
          for (var achievement in entry.achievements) li([text(achievement)]),
        ]),
      ]),
    ]);
  }
}
