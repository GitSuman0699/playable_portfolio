import 'dart:async';
import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'helpers/scroll_helper.dart' as helpers;

import 'components/hero_section.dart';
import 'components/experience_section.dart';
import 'components/project_section.dart';
import 'components/skills_section.dart';
import 'components/contact_section.dart';

/// Main portfolio application - a single-page layout with all sections.
/// Manages theme state directly for simplicity.
@client
class App extends StatefulComponent {
  const App({super.key});

  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> {
  bool isDarkMode = true;
  bool isMobileMenuOpen = false;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  void toggleMobileMenu() {
    setState(() => isMobileMenuOpen = !isMobileMenuOpen);
  }

  void closeMobileMenu() {
    // Delay closing to allow the anchor link navigation to trigger
    // and to match (roughly) the animation duration if we add a fade out later.
    Timer(const Duration(milliseconds: 300), () {
      setState(() => isMobileMenuOpen = false);
    });
  }

  void scrollToSection(String id) {
    // Only works on client side via the helper
    helpers.scrollToSection(id);
    setState(() => isMobileMenuOpen = false);
  }

  @override
  Component build(BuildContext context) {
    return div(
      classes: 'portfolio',
      attributes: {'data-theme': isDarkMode ? 'dark' : 'light'},
      [
        // Navbar with theme toggle
        nav(classes: 'navbar', [
          div(classes: 'navbar-brand', [
            a(href: '#', classes: 'logo', [text('Portfolio')]),
          ]),
          div(classes: 'navbar-links', [
            a(href: '#about', [text('About')]),
            a(href: '#experience', [text('Experience')]),
            a(href: '#projects', [text('Projects')]),
            a(href: '#skills', [text('Skills')]),
            a(href: '#contact', [text('Contact')]),
          ]),
          div(classes: 'navbar-actions', [
            button(
              [text(isDarkMode ? '☀️' : '🌙')],
              classes: 'theme-toggle',
              onClick: toggleTheme,
            ),
            button(
              classes: 'mobile-menu-toggle',
              onClick: toggleMobileMenu,
              [text('☰')],
            ),
            a(
              href: 'images/Flutter-Developer-Suman-Poudyal.pdf',
              classes: 'btn-resume',
              attributes: {'download': ''},
              [text('Download Resume')],
            ),
          ]),
          if (isMobileMenuOpen)
            div(classes: 'mobile-menu', [
              button(
                classes: 'mobile-menu-close',
                onClick: closeMobileMenu,
                [text('×')],
              ),
              a(href: '#about', onClick: () => scrollToSection('#about'), [text('About')]),
              a(href: '#experience', onClick: () => scrollToSection('#experience'), [text('Experience')]),
              a(href: '#projects', onClick: () => scrollToSection('#projects'), [text('Projects')]),
              a(href: '#skills', onClick: () => scrollToSection('#skills'), [text('Skills')]),
              a(href: '#contact', onClick: () => scrollToSection('#contact'), [text('Contact')]),
            ]),
        ]),
        const HeroSection(),
        const ExperienceSection(),
        const ProjectSection(),
        const SkillsSection(),
        const ContactSection(),
      ],
    );
  }
}
