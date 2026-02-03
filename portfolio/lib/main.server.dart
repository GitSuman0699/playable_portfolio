/// The entrypoint for the **server** environment.
library;

import 'package:jaspr/dom.dart';
import 'package:jaspr/server.dart';

import 'app.dart';
import 'main.server.options.dart';

void main() {
  Jaspr.initializeApp(
    options: defaultServerOptions,
  );

  runApp(
    Document(
      title: 'Suman Kumar Poudyal | Flutter Developer',
      meta: {
        'description':
            'Professional portfolio of Suman Kumar Poudyal, a Flutter Developer specializing in mobile and web applications.',
        'viewport': 'width=device-width, initial-scale=1.0',
      },
      styles: [
        // Import Inter font
        css.import('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap'),
        // Import portfolio styles
        css.import('css/portfolio.css'),
        // Import modal styles
        css.import('css/modal.css'),
        // Import device mockup styles
        css.import('css/device_mockup.css'),
      ],
      head: [
        // Include EmailJS custom JavaScript
        script(src: 'js/email.js', attributes: {'defer': 'true'}),
        // Include client-side JavaScript for interactivity
        // script(src: 'main.client.dart.js'), // Auto-injected by Jaspr
      ],
      body: App(),
    ),
  );
}
