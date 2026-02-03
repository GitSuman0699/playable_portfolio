/// Media item types for project gallery
enum MediaType { image, pdf, video, driveLink }

/// Media item model for project gallery
class MediaItem {
  final MediaType type;
  final String url;
  final String? thumbnail; // For videos and PDFs

  const MediaItem({
    required this.type,
    required this.url,
    this.thumbnail,
  });
}

class ProjectModel {
  final String title;
  final String imagePath;
  final List<String> techStack;
  @Deprecated('Use androidUrl and iosUrl instead')
  final String? appUrl; // Deprecated - kept for backward compatibility
  final String? androidUrl; // Optional Android Play Store URL
  final String? iosUrl; // Optional iOS App Store URL
  final String description; // Full project description
  final List<MediaItem> mediaItems; // Gallery items
  final List<String> features; // Key features
  final String role; // Your role in the project
  final String? embeddedAppPath; // Path to embedded Flutter web app (e.g., '/apps/Aero-Lounge/index.html')

  const ProjectModel({
    required this.title,
    required this.imagePath,
    required this.techStack,
    this.appUrl,
    this.androidUrl,
    this.iosUrl,
    required this.description,
    required this.mediaItems,
    required this.features,
    required this.role,
    this.embeddedAppPath,
  });
}
