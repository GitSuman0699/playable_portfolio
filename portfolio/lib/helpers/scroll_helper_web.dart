import 'package:web/web.dart' as web;

/// Web implementation using package:web
void scrollToSection(String id) {
  final element = web.document.querySelector(id);
  if (element != null) {
    element.scrollIntoView(web.ScrollIntoViewOptions(behavior: 'smooth'));
  }
}
