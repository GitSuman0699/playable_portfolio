import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import '../models/project_model.dart';

class ProjectCard extends StatelessComponent {
  final ProjectModel project;

  const ProjectCard({required this.project, super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'project-card', [
      div(classes: 'project-image-container', [
        img(
          src: project.imagePath,
          alt: project.title,
          classes: 'project-image',
        ),
        div(classes: 'project-overlay', [
          button(
            classes: 'btn-view-project',
            attributes: {
              'onclick':
                  "document.getElementById('modal-${project.title.replaceAll(' ', '-').replaceAll('(', '').replaceAll(')', '').toLowerCase()}').classList.add('active'); document.body.style.overflow = 'hidden';",
            },
            [text('View details')],
          ),
        ]),
      ]),
      div(classes: 'project-content', [
        h3(classes: 'project-title', [text(project.title)]),
        div(classes: 'tech-stack', [
          for (final tech in project.techStack) span(classes: 'tech-badge', [text(tech)]),
        ]),
      ]),
    ]);
  }
}
