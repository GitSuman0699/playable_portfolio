import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

/// Contact section with footer, social links, and contact form.
class ContactSection extends StatefulComponent {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => ContactSectionState();
}

class ContactSectionState extends State<ContactSection> {
  String name = '';
  String email = '';
  String message = '';

  bool get isValid {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return name.isNotEmpty && emailRegex.hasMatch(email) && message.isNotEmpty;
  }

  @override
  Component build(BuildContext context) {
    return section(id: 'contact', classes: 'contact-section', [
      div(classes: 'contact-container', [
        div(classes: 'contact-info', [
          h2([text('Get In Touch')]),
          p([text("Have a project in mind? Feel free to reach out. I'm always open to new ideas.")]),
          div(classes: 'social-links', [
            a(
              href: 'https://github.com/GitSuman0699',
              classes: 'social-link',
              attributes: {'target': '_blank'},
              [
                img(
                  src: 'icons/github.svg',
                  classes: 'social-icon',
                  alt: 'GitHub',
                  attributes: {'style': 'width: 24px; height: 24px;'},
                ),
                text('GitHub'),
              ],
            ),
            a(
              href: 'https://www.linkedin.com/in/suman-poudyal/',
              classes: 'social-link',
              attributes: {'target': '_blank'},
              [
                img(
                  src: 'icons/linkedin.svg',
                  classes: 'social-icon',
                  alt: 'LinkedIn',
                  attributes: {'style': 'width: 24px; height: 24px;'},
                ),
                text('LinkedIn'),
              ],
            ),
            a(
              href: 'https://x.com/povSuman99',
              classes: 'social-link',
              attributes: {'target': '_blank'},
              [
                img(
                  src: 'icons/x.svg',
                  classes: 'social-icon',
                  alt: 'X (Twitter)',
                  attributes: {'style': 'width: 24px; height: 24px;'},
                ),
                text('X (Twitter)'),
              ],
            ),
            a(
              href: 'https://mail.google.com/mail/?view=cm&fs=1&to=shranp75@gmail.com',
              attributes: {'target': '_blank'},
              classes: 'social-link',
              [
                img(
                  src: 'icons/email.svg',
                  classes: 'social-icon',
                  alt: 'Email',
                  attributes: {'style': 'width: 24px; height: 24px;'},
                ),
                text('Email'),
              ],
            ),
          ]),
        ]),
        div(classes: 'contact-form', [
          div(classes: 'form-group', [
            label(htmlFor: 'name', [text('Name')]),
            input(
              id: 'name',
              type: InputType.text,
              name: 'name',
              attributes: {'placeholder': 'Your name', 'value': name},
              onInput: (value) => setState(() => name = value as String),
            ),
          ]),
          div(classes: 'form-group', [
            label(htmlFor: 'email', [text('Email')]),
            input(
              id: 'email',
              type: InputType.email,
              name: 'email',
              attributes: {'placeholder': 'your@email.com', 'value': email},
              onInput: (value) => setState(() => email = value as String),
            ),
          ]),
          div(classes: 'form-group', [
            label(htmlFor: 'message', [text('Message')]),
            textarea(
              [text(message)],
              id: 'message',
              name: 'message',
              attributes: {'placeholder': 'Your message...', 'rows': '5'},
              onInput: (value) => setState(() => message = value),
            ),
          ]),
          a(
            href: isValid
                ? 'https://mail.google.com/mail/?view=cm&fs=1&to=shranp75@gmail.com&su=${Uri.encodeComponent("Portfolio Contact from $name")}&body=${Uri.encodeComponent("Name: $name\nEmail: $email\n\n$message")}'
                : '',
            classes: 'submit-btn',
            attributes: isValid
                ? {'target': '_blank'}
                : {'disabled': 'true', 'style': 'pointer-events: none; opacity: 0.6;'},
            [text('Send Message')],
          ),
        ]),
      ]),
      footer(classes: 'footer', [
        p([text('© 2026 Suman Poudyal. All rights reserved.')]),
        p(classes: 'footer-note', [
          text('Built with Flutter and '),
          a(href: 'https://jaspr.site', attributes: {'target': '_blank'}, [text('Jaspr')]),
        ]),
      ]),
    ]);
  }
}
