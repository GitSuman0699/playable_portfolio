# 🎮 Playable Portfolio

A high-performance portfolio website built with [Jaspr](https://github.com/schultek/jaspr) that showcases mobile apps as **interactive Flutter Web builds** embedded within device mockups.

## ✨ Features

- **🌓 Dark/Light Theme** - Seamless theme switching with smooth transitions
- **📱 Responsive Design** - Mobile-first approach with adaptive layouts
- **🎯 Interactive Project Demos** - Embed playable Flutter apps within device mockups
- **⚡ Static Site Generation** - Fast loading with Jaspr's static mode
- **🚀 One-Click Deployment** - Automated build and deploy to Vercel

## 🏗️ Project Structure

```
playable_portfolio/
├── portfolio/              # Main Jaspr portfolio site
│   ├── lib/
│   │   ├── components/     # Reusable UI components
│   │   │   ├── hero_section.dart
│   │   │   ├── experience_section.dart
│   │   │   ├── project_section.dart
│   │   │   ├── skills_section.dart
│   │   │   ├── contact_section.dart
│   │   │   ├── project_modal.dart
│   │   │   └── device_mockup.dart
│   │   ├── models/         # Data models
│   │   ├── helpers/        # Utility functions
│   │   └── app.dart        # Main application component
│   └── web/                # Static assets (CSS, images)
├── apps/                   # Embedded Flutter app builds
│   └── hello_world/        # Example embedded app
├── build_apps.ps1          # Script to build Flutter apps
└── deploy_to_vercel.ps1    # One-click deploy script
```

## 🚀 Getting Started

### Prerequisites

- [Dart SDK](https://dart.dev/get-dart) >= 3.9.0
- [Jaspr CLI](https://pub.dev/packages/jaspr_cli)
- [Flutter](https://flutter.dev/) (for building embedded apps)
- [Node.js](https://nodejs.org/) (for Vercel CLI)

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd playable_portfolio
   ```

2. **Install dependencies**
   ```bash
   cd portfolio
   dart pub get
   ```

3. **Run the development server**
   ```bash
   jaspr serve
   ```

   The site will be available at `https://suman-poudyal-portfolio.vercel.app/`

## 🛠️ Development

### Running Locally

```bash
cd portfolio
jaspr serve
```

### Building for Production

```bash
cd portfolio
jaspr build
```

The output will be in `portfolio/build/jaspr/`.

### Building Embedded Flutter Apps

```powershell
.\build_apps.ps1
```

This script compiles Flutter apps in the `apps/` directory for web embedding.

## 🚢 Deployment

### One-Click Deploy to Vercel

```powershell
.\deploy_to_vercel.ps1
```

This script will:
1. Build all embedded Flutter apps
2. Build the Jaspr portfolio site
3. Deploy to Vercel (production)

> **Note:** First-time deployment will open a browser for Vercel authentication.

## 🎨 Customization

### Adding Projects

Edit the project data in `portfolio/lib/components/project_section.dart` to add your own projects. Each project supports:
- Title, description, and tech stack
- Screenshot images
- Live demo and source code links
- Android/iOS app store links
- Embedded Flutter app demos

### Styling

CSS files are located in `portfolio/web/css/`. The site uses a design system with:
- CSS custom properties for theming
- Responsive breakpoints
- Smooth scroll behavior
- Modern animations and transitions

## 📦 Tech Stack

- **[Jaspr](https://github.com/schultek/jaspr)** - Dart web framework with SSR/SSG
- **[Flutter](https://flutter.dev/)** - For embedded interactive app demos
- **[Vercel](https://vercel.com/)** - Hosting and deployment


Built with ❤️ using Dart and Jaspr
