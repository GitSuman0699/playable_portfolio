import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

/// Hero/About section with professional introduction
class HeroSection extends StatelessComponent {
  const HeroSection({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'about', classes: 'hero-section', [
      div(classes: 'hero-content', [
        div(classes: 'hero-image', [
          div(classes: 'image-placeholder', [
            img(
              src: 'images/profile_picture.png',
              alt: 'Suman Kumar Poudyal',
              attributes: {'style': 'width: 100%; height: 100%; object-fit: cover;'},
            ),
          ]),
        ]),
        div(classes: 'hero-text', [
          span(classes: 'greeting', [text("Hello, I'm")]),
          h1(classes: 'hero-name', [text('Suman Kumar Poudyal')]),
          h2(classes: 'hero-title', [text('Flutter Developer')]),
          p(classes: 'hero-description', [
            text(
              'I am a Flutter Developer with over 4 years of experience building scalable, high-impact applications. My expertise lies in bridging the gap between complex backend architectures (GraphQL, Hasura, gRPC, Firebase) and intuitive, fluid user interfaces. I specialize in engineering robust financial workflows, real-time logistics systems, and AI-integrated mobile solutions. I focus on writing clean, maintainable code that drives business growth.',
            ),
          ]),
          div(classes: 'hero-cta', [
            a(href: '#contact', classes: 'btn-primary', [text('Get In Touch')]),
            a(href: '#projects', classes: 'btn-secondary', [text('View My Work')]),
          ]),
          div(classes: 'hero-social', [
            a(href: 'https://github.com/GitSuman0699', attributes: {'target': '_blank'}, [text('GitHub')]),
            a(href: 'https://www.linkedin.com/in/suman-poudyal/', attributes: {'target': '_blank'}, [text('LinkedIn')]),
            a(href: 'https://x.com/povSuman99', attributes: {'target': '_blank'}, [text('Twitter')]),
          ]),
        ]),
      ]),
    ]);
  }
}
