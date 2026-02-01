import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class DeviceMockup extends StatelessComponent {
  final String appUrl;

  const DeviceMockup({required this.appUrl});

  @override
  Component build(BuildContext context) {
    return div(classes: 'device-mockup', [
      div(classes: 'device-screen', [
        iframe(src: appUrl, []),
      ]),
    ]);
  }
}
