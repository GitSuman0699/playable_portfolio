import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import '../models/project_model.dart';
import 'project_card.dart';
import 'project_modal.dart';

class ProjectSection extends StatelessComponent {
  const ProjectSection({super.key});

  static const projects = [
    ProjectModel(
      title: 'Aero Lounge (Aviation Marketplace)',
      imagePath: 'images/aerolounge.png',
      techStack: ["Flutter", "Bloc", "Firebase", "Stripe Connect", "AWS Cognito", "REST API"],
      appUrl: '#',
      description:
          'A comprehensive aviation marketplace connecting aircraft owners, pilots, and aviation enthusiasts. Features include aircraft listings, booking management, secure payments, and real-time chat.',
      mediaItems: [
        MediaItem(type: MediaType.image, url: 'images/aerolounge1.jpg'),
        MediaItem(type: MediaType.image, url: 'images/aerolounge2.jpg'),
        MediaItem(type: MediaType.image, url: 'images/aerolounge3.jpg'),
        MediaItem(type: MediaType.image, url: 'images/aerolounge4.jpg'),
        MediaItem(type: MediaType.image, url: 'images/aerolounge5.jpg'),
        MediaItem(type: MediaType.image, url: 'images/aerolounge6.jpg'),
      ],
      features: [
        'Multi-vendor marketplace with Stripe Connect integration',
        'Real-time booking and availability management',
        'Secure authentication with AWS Cognito',
        'In-app messaging and notifications',
        'Advanced search and filtering',
        'Payment processing and escrow system',
      ],
      role: 'Senior Flutter Developer',
    ),

    ProjectModel(
      title: 'Parent Hour (Community Childcare)',
      imagePath: 'images/parenthour.jpeg',
      techStack: ["Flutter", "REST", "Getx", "Firebase"],
      appUrl: '#',
      description:
          'A community-driven childcare platform connecting parents for cooperative babysitting. Features include scheduling, parent verification, activity planning, and community building tools.',
      mediaItems: [
        MediaItem(type: MediaType.image, url: 'images/parenthour.jpeg'),
        MediaItem(type: MediaType.video, url: 'images/parentvideo.mp4', thumbnail: 'images/parenthour.jpeg'),
      ],
      features: [
        'Parent verification and trust system',
        'Flexible scheduling and time-banking',
        'Activity planning and sharing',
        'Community chat and forums',
        'Emergency contact management',
        'Child profile management',
      ],
      role: 'Senior Flutter Developer',
    ),
    ProjectModel(
      title: 'Drop It (Logistics & Delivery)',
      imagePath: 'images/dropit.png',
      techStack: ["Flutter", "Bloc", "gRPC", "AWS Cognito", "Stripe", "MapBox Maps API", "Firebase"],
      appUrl: '#',
      description:
          'A modern logistics and delivery platform enabling users to send packages, track deliveries in real-time, and manage multiple delivery options. Built with high-performance gRPC for real-time updates.',
      mediaItems: [
        MediaItem(type: MediaType.image, url: 'images/dropit1.png'),
        MediaItem(type: MediaType.image, url: 'images/dropit2.png'),
        MediaItem(type: MediaType.image, url: 'images/dropit3.png'),
        MediaItem(type: MediaType.image, url: 'images/dropit4.png'),
        MediaItem(type: MediaType.image, url: 'images/dropit5.jpg'),
        MediaItem(type: MediaType.image, url: 'images/dropit6.png'),
        MediaItem(type: MediaType.image, url: 'images/dropit7.png'),
      ],
      features: [
        'Real-time package tracking with MapBox integration',
        'gRPC-based communication for instant updates',
        'Multiple delivery options and scheduling',
        'Secure payment processing with Stripe',
        'Driver matching algorithm',
        'Push notifications for delivery status',
        'Route optimization',
      ],
      role: 'Senior Mobile Developer',
    ),
    ProjectModel(
      title: 'SRI',
      imagePath: 'images/sri.png',
      techStack: ["Flutter", "GetX", "REST API", "Barcode Scanner", "Firebase"],
      appUrl: '#',
      description:
          'SRI is a high-value logistics platform designed to streamline the tracking, management, and transportation of fine art and luxury assets.',
      mediaItems: [
        MediaItem(type: MediaType.image, url: 'images/sri.png'),
        MediaItem(type: MediaType.video, url: 'images/srivideo.mp4', thumbnail: 'images/sri.png'),
      ],
      features: [
        'Real-time asset tracking and chain-of-custody verification',
        'Automated scheduling, inventory control, and documentation',
        'Specialized handling protocols for fine art and fragile cargo',
        'End-to-end supply chain transparency with live updates',
        'Secure architecture with role-based access control',
      ],
      role: 'Flutter Developer',
    ),
    ProjectModel(
      title: 'WhatsMini (AI chatbot with Whatsapp UI)',
      imagePath: 'images/whatsmini.png',
      techStack: [
        "Flutter",
        "Riverpod",
        "Gemini API",
      ],

      description:
          'WhatsMini brings you an innovative chat experience using a familiar interface. Talk to your own AI companion through the WhatsApp-like chat screen and discover a world of engaging conversations.',
      mediaItems: [
        MediaItem(type: MediaType.image, url: 'images/whatsmini.png'),
        MediaItem(type: MediaType.video, url: 'https://www.youtube.com/watch?v=XQW9KVx-Xx0'),
      ],
      features: [
        'WhatsApp-inspired user interface',
        'AI-powered conversations using Gemini API',
        'Real-time message streaming',
        'State management with Riverpod',
        'Persistent chat history',
      ],
      role: 'Flutter Developer',
    ),
    ProjectModel(
      title: 'Aseztak (E-Commerce App Buyer)',
      imagePath: 'images/aseztak1.png',
      techStack: [
        "Flutter",
        "Riverpod",
        "GraphQL",
        "REST API",
        "PayTM Payment Gateway",
        "Firebase",
      ],
      androidUrl: 'https://play.google.com/store/apps/details?id=com.AseZtakWholesaleOnlinePrivateLimited.buyer&hl=en',
      iosUrl: 'https://apps.apple.com/us/app/aseztak-wholesale-b2b-app/id6446054120',
      description:
          'An e-commerce app for wholesale buyers, featuring a user-friendly interface, efficient data fetching, and secure payment processing with PayTM.',
      mediaItems: [
        MediaItem(type: MediaType.image, url: 'images/aseztak1.png'),
        MediaItem(type: MediaType.image, url: 'images/aseztak2.png'),
        MediaItem(type: MediaType.image, url: 'images/aseztak3.png'),
        MediaItem(type: MediaType.image, url: 'images/aseztak4.png'),
        MediaItem(type: MediaType.image, url: 'images/aseztak5.png'),
      ],
      features: [
        'Efficient data fetching and management with GraphQL',
        'Secure payment gateway integration with PayTM',
        'Real-time order tracking and status updates via Firebase',
        'Robust state management using Riverpod',
        'Advanced product filtering and category management',
      ],
      role: 'Flutter Developer',
    ),
    ProjectModel(
      title: 'Aseztak (E-Commerce App Seller)',
      imagePath: 'images/seller1.png',
      techStack: [
        "Flutter",
        "Riverpod",
        "GraphQL",
        "REST API",
        "Firebase",
        "Gemini AI",
      ],
      androidUrl:
          'https://play.google.com/store/apps/details?id=com.AseZtakWholesaleOnlinePrivateLimited.seller.seller',
      iosUrl: 'https://apps.apple.com/us/app/aseztak-seller-center/id6447749479',
      description:
          'An e-commerce app for wholesale sellers, featuring a user-friendly interface, efficient data fetching, and Gemini AI integration.',
      mediaItems: [
        MediaItem(type: MediaType.image, url: 'images/seller1.png'),
        MediaItem(type: MediaType.image, url: 'images/seller2.png'),
        MediaItem(type: MediaType.image, url: 'images/seller3.png'),
        MediaItem(type: MediaType.image, url: 'images/seller4.png'),
      ],
      features: [
        'Efficient data fetching and management with GraphQL',
        'Use of Gemini AI for product title and description generation',
        'Real-time order tracking and status updates via Firebase',
        'Robust state management using Riverpod',
        'Advanced product filtering and category management',
      ],
      role: 'Flutter Developer',
    ),
  ];

  String _getModalId(String title) {
    return 'modal-${title.replaceAll(' ', '-').replaceAll('(', '').replaceAll(')', '').toLowerCase()}';
  }

  @override
  Component build(BuildContext context) {
    return section(id: 'projects', classes: 'projects-section', [
      div(classes: 'section-header', [
        h2([text('Featured Projects')]),
        p([text('Here are some of the projects I have worked on.')]),
      ]),
      div(classes: 'projects-grid', [
        for (final project in projects) ProjectCard(project: project),
      ]),
      // Add modals for each project
      for (final project in projects)
        ProjectModal(
          project: project,
          modalId: _getModalId(project.title),
        ),
    ]);
  }
}
