import 'package:jaspr/jaspr.dart';

/// Provider component that manages theme state (dark/light mode)
/// and provides toggle functionality to child components.
class ThemeProvider extends StatefulComponent {
  final Component child;

  const ThemeProvider({super.key, required this.child});

  @override
  State<ThemeProvider> createState() => ThemeProviderState();
}

class ThemeProviderState extends State<ThemeProvider> {
  bool isDarkMode = true;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Component build(BuildContext context) {
    return ThemeScope(
      isDarkMode: isDarkMode,
      toggleTheme: toggleTheme,
      child: component.child,
    );
  }
}

/// InheritedComponent to provide theme state down the widget tree
class ThemeScope extends InheritedComponent {
  final bool isDarkMode;
  final void Function() toggleTheme;

  const ThemeScope({
    super.key,
    required this.isDarkMode,
    required this.toggleTheme,
    required super.child,
  });

  static ThemeScope? of(BuildContext context) {
    return context.dependOnInheritedComponentOfExactType<ThemeScope>();
  }

  @override
  bool updateShouldNotify(covariant ThemeScope oldComponent) {
    return isDarkMode != oldComponent.isDarkMode;
  }
}
