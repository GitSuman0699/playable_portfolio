import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import '../models/project_model.dart';

/// Project details modal component
class ProjectModal extends StatelessComponent {
  final ProjectModel project;
  final String modalId;

  const ProjectModal({
    required this.project,
    required this.modalId,
    super.key,
  });

  @override
  Component build(BuildContext context) {
    final closeScript =
        "document.getElementById('$modalId').classList.remove('active'); document.body.style.overflow = 'auto';";

    return div(
      id: modalId,
      classes: 'project-modal',
      [
        // Backdrop
        div(
          classes: 'modal-backdrop',
          attributes: {
            'onclick': closeScript,
          },
          [],
        ),

        // Modal content
        div(classes: 'modal-content', [
          // Close button
          button(
            classes: 'modal-close',
            attributes: {
              'onclick': closeScript,
            },
            [text('×')],
          ),

          // Modal body
          div(classes: 'modal-body', [
            // Left side - Image gallery
            div(classes: 'modal-gallery', [
              div(
                id: '$modalId-gallery-main',
                classes: 'gallery-main',
                [
                  if (project.mediaItems.isNotEmpty)
                    _buildMainMedia(project.mediaItems[0])
                  else
                    img(
                      src: project.imagePath,
                      alt: project.title,
                      classes: 'gallery-main-image',
                    ),
                ],
              ),
              if (project.mediaItems.length > 1)
                div(classes: 'gallery-thumbnails', [
                  for (var i = 0; i < project.mediaItems.length; i++)
                    _buildThumbnail(project.mediaItems[i], i, modalId),
                ]),
            ]),

            // Right side - Project details
            div(classes: 'modal-details', [
              h2(classes: 'modal-title', [text(project.title)]),

              // Role
              div(classes: 'modal-role', [
                span(classes: 'role-label', [text('Role: ')]),
                span(classes: 'role-value', [text(project.role)]),
              ]),

              // Description
              p(classes: 'modal-description', [text(project.description)]),

              // Tech stack
              div(classes: 'modal-section', [
                h3([text('Tech Stack')]),
                div(classes: 'tech-stack-modal', [
                  for (final tech in project.techStack) span(classes: 'tech-badge-modal', [text(tech)]),
                ]),
              ]),

              // Features
              div(classes: 'modal-section', [
                h3([text('Key Features')]),
                ul(classes: 'features-list', [
                  for (final feature in project.features) li([text(feature)]),
                ]),
              ]),

              // App store links (if available)
              if (project.androidUrl != null ||
                  project.iosUrl != null ||
                  (project.appUrl != null && project.appUrl!.isNotEmpty && project.appUrl != '#'))
                div(classes: 'modal-actions', [
                  h3([text('Download App')]),
                  div(classes: 'app-store-buttons', [
                    // Android button
                    if (project.androidUrl != null && project.androidUrl!.isNotEmpty)
                      a(
                        href: project.androidUrl!,
                        target: Target.blank,
                        classes: 'btn-app-store btn-android',
                        [
                          span(classes: 'app-store-icon', [
                            raw(
                              '<svg width="24" height="24" viewBox="0 0 24 24" fill="currentColor"><path d="M3,20.5V3.5C3,2.91 3.34,2.39 3.84,2.15L13.69,12L3.84,21.85C3.34,21.6 3,21.09 3,20.5M16.81,15.12L6.05,21.34L14.54,12.85L16.81,15.12M20.16,10.81C20.5,11.08 20.75,11.5 20.75,12C20.75,12.5 20.53,12.9 20.18,13.18L17.89,14.5L15.39,12L17.89,9.5L20.16,10.81M6.05,2.66L16.81,8.88L14.54,11.15L6.05,2.66Z"/></svg>',
                            ),
                          ]),
                          span(classes: 'app-store-text', [
                            span(classes: 'app-store-label', [text('Get it on')]),
                            span(classes: 'app-store-name', [text('Google Play')]),
                          ]),
                        ],
                      ),
                    // iOS button
                    if (project.iosUrl != null && project.iosUrl!.isNotEmpty)
                      a(
                        href: project.iosUrl!,
                        target: Target.blank,
                        classes: 'btn-app-store btn-ios',
                        [
                          span(classes: 'app-store-icon', [
                            raw(
                              '<svg width="24" height="24" viewBox="0 0 24 24" fill="currentColor"><path d="M18.71,19.5C17.88,20.74 17,21.95 15.66,21.97C14.32,22 13.89,21.18 12.37,21.18C10.84,21.18 10.37,21.95 9.1,22C7.79,22.05 6.8,20.68 5.96,19.47C4.25,17 2.94,12.45 4.7,9.39C5.57,7.87 7.13,6.91 8.82,6.88C10.1,6.86 11.32,7.75 12.11,7.75C12.89,7.75 14.37,6.68 15.92,6.84C16.57,6.87 18.39,7.1 19.56,8.82C19.47,8.88 17.39,10.1 17.41,12.63C17.44,15.65 20.06,16.66 20.09,16.67C20.06,16.74 19.67,18.11 18.71,19.5M13,3.5C13.73,2.67 14.94,2.04 15.94,2C16.07,3.17 15.6,4.35 14.9,5.19C14.21,6.04 13.07,6.7 11.95,6.61C11.8,5.46 12.36,4.26 13,3.5Z"/></svg>',
                            ),
                          ]),
                          span(classes: 'app-store-text', [
                            span(classes: 'app-store-label', [text('Download on the')]),
                            span(classes: 'app-store-name', [text('App Store')]),
                          ]),
                        ],
                      ),
                    // Fallback for deprecated appUrl
                    if ((project.androidUrl == null || project.androidUrl!.isEmpty) &&
                        (project.iosUrl == null || project.iosUrl!.isEmpty) &&
                        project.appUrl != null &&
                        project.appUrl!.isNotEmpty &&
                        project.appUrl != '#')
                      a(
                        href: project.appUrl!,
                        target: Target.blank,
                        classes: 'btn-view-app',
                        [text('View Live App →')],
                      ),
                  ]),
                ]),
            ]),
          ]),
        ]),
      ],
    );
  }

  Component _buildMainMedia(MediaItem item) {
    if (item.type == MediaType.video) {
      // Check if it's a YouTube link
      if (item.url.contains('youtube.com') || item.url.contains('youtu.be')) {
        final embedUrl = _getYouTubeEmbedUrl(item.url);
        return iframe(
          src: embedUrl,
          classes: 'gallery-main-video',
          attributes: {
            'frameborder': '0',
            'allow': 'accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture',
            'allowfullscreen': 'true',
          },
          [],
        );
      } else {
        // Regular video file
        return video(
          src: item.url,
          classes: 'gallery-main-video',
          controls: true,
          attributes: {
            'controlsList': 'nodownload',
          },
          [],
        );
      }
    } else if (item.type == MediaType.image) {
      return img(
        src: item.url,
        alt: 'Gallery image',
        classes: 'gallery-main-image',
      );
    } else if (item.type == MediaType.pdf) {
      return iframe(
        src: item.url,
        classes: 'gallery-main-pdf',
        attributes: {
          'frameborder': '0',
        },
        [],
      );
    } else {
      // Drive link or other types
      return div(classes: 'gallery-main-placeholder', [
        text('Click to view: '),
        a(href: item.url, target: Target.blank, [text('Open Link')]),
      ]);
    }
  }

  String _getYouTubeEmbedUrl(String url) {
    // Convert YouTube URL to embed format
    if (url.contains('youtube.com/watch?v=')) {
      final videoId = url.split('v=')[1].split('&')[0];
      return 'https://www.youtube.com/embed/$videoId';
    } else if (url.contains('youtu.be/')) {
      final videoId = url.split('youtu.be/')[1].split('?')[0];
      return 'https://www.youtube.com/embed/$videoId';
    } else if (url.contains('youtube.com/embed/')) {
      return url; // Already in embed format
    }
    return url; // Return as-is if format not recognized
  }

  Component _buildThumbnail(MediaItem item, int index, String modalId) {
    // Generate appropriate HTML based on media type
    String mediaHtml;
    if (item.type == MediaType.video) {
      // Check if it's a YouTube link
      if (item.url.contains('youtube.com') || item.url.contains('youtu.be')) {
        final embedUrl = _getYouTubeEmbedUrl(item.url);
        mediaHtml =
            '<iframe src="$embedUrl" class="gallery-main-video" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>';
      } else {
        mediaHtml = '<video src="${item.url}" class="gallery-main-video" controls controlsList="nodownload"></video>';
      }
    } else if (item.type == MediaType.image) {
      mediaHtml = '<img src="${item.url}" alt="Gallery image ${index + 1}" class="gallery-main-image" />';
    } else if (item.type == MediaType.pdf) {
      mediaHtml = '<iframe src="${item.url}" class="gallery-main-pdf" frameborder="0"></iframe>';
    } else {
      mediaHtml =
          '<div class="gallery-main-placeholder">Click to view: <a href="${item.url}" target="_blank">Open Link</a></div>';
    }

    final updateScript =
        """
      var mainGallery = document.getElementById('$modalId-gallery-main');
      if (mainGallery) {
        mainGallery.innerHTML = '$mediaHtml';
      }
      var thumbnails = document.querySelectorAll('#$modalId .gallery-thumbnail');
      thumbnails.forEach(function(thumb) { thumb.classList.remove('active'); });
      this.classList.add('active');
    """;

    return div(
      classes: 'gallery-thumbnail ${index == 0 ? 'active' : ''}',
      attributes: {
        'onclick': updateScript,
      },
      [
        if (item.type == MediaType.image)
          img(
            src: item.url,
            alt: 'Thumbnail ${index + 1}',
            classes: 'thumbnail-image',
          )
        else if (item.type == MediaType.video)
          div(classes: 'thumbnail-video', [
            if (item.thumbnail != null) img(src: item.thumbnail!, alt: 'Video thumbnail') else text('▶'),
          ])
        else if (item.type == MediaType.pdf)
          div(classes: 'thumbnail-pdf', [text('📄')])
        else if (item.type == MediaType.driveLink)
          div(classes: 'thumbnail-drive', [text('📁')]),
      ],
    );
  }
}
