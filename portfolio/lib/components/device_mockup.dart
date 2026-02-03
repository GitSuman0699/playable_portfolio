import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

/// Device mockup component for embedding Flutter web apps
///
/// Features:
/// - Lazy loading with play button overlay
/// - Loading spinner while iframe loads
/// - Realistic phone frame styling
class DeviceMockup extends StatelessComponent {
  final String appUrl;
  final String mockupId;

  const DeviceMockup({
    required this.appUrl,
    required this.mockupId,
  });

  @override
  Component build(BuildContext context) {
    // Script to handle lazy loading - starts the app on play button click
    final launchScript =
        """
      var mockup = document.getElementById('$mockupId');
      var playOverlay = mockup.querySelector('.device-play-overlay');
      var loadingOverlay = mockup.querySelector('.device-loading');
      var iframeContainer = mockup.querySelector('.device-iframe-container');
      
      // Hide play button, show loading
      playOverlay.classList.add('hidden');
      loadingOverlay.classList.remove('hidden');
      
      // Create and insert iframe
      var iframe = document.createElement('iframe');
      iframe.src = '$appUrl';
      iframe.onload = function() {
        loadingOverlay.classList.add('hidden');
      };
      iframeContainer.appendChild(iframe);
    """;

    return div(
      id: mockupId,
      classes: 'device-mockup-container',
      [
        div(classes: 'device-mockup', [
          div(classes: 'device-screen', [
            // Play button overlay (shown initially)
            div(
              classes: 'device-play-overlay',
              attributes: {'onclick': launchScript},
              [
                div(classes: 'device-play-button', []),
                span(classes: 'device-play-text', [text('Tap to Play')]),
              ],
            ),

            // Loading overlay (hidden initially)
            div(classes: 'device-loading hidden', [
              div(classes: 'device-loading-spinner', []),
              span(classes: 'device-loading-text', [text('Loading app...')]),
            ]),

            // Iframe container (iframe will be inserted here on play)
            div(classes: 'device-iframe-container', []),
          ]),
        ]),
      ],
    );
  }
}
