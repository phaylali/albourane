# Developer Notes (Technical Breakdown)

This document provides a technical overview of the Albourane application, focusing on architecture, dependency management, and platform-specific configurations.

## 🏗️ Architecture

The application follows the **GetX** modular architecture, prioritizing reactive state management and decoupled routing.

- **Routing**: Centralized in `lib/resources/routes.dart`. It uses path-based URL strategies on the web through `flutter_web_plugins`.
- **State Management**: Implemented using `GetView` and `GetxController`. See `lib/controllers/` for business logic and `lib/resources/bindings.dart` for dependency injection.
- **UI Components**: 
    - `MainBody`: A unified wrapper for consistent page layouts.
    - `ConnectionIndicator`: Reactive network monitoring widget.

## 📦 Dependency Highlights

The project has been modernized to use the latest stable versions:
- **GetX (^4.7.3)**: Handles navigation and reactive updates.
- **FlutterFire (^4.5.0 core)**: Direct integration with Firebase services.
- **PDF/Printing**: Full support for generating and printing documents across all platforms.
- **Cross Connectivity (^3.3.0)**: Modernized status monitoring without obsolete `unknown` status.

## 📱 Android Configuration

The Android part of the project has been updated to support high Java versions (Java 25) and modern Gradle standards:
- **Gradle Version**: 9.4.1
- **Android Gradle Plugin (AGP)**: 8.4.0
- **Kotlin Version**: 1.9.22
- **Namespace**: `com.albourane`
- **Java Targeting**: 17 (Required by AGP 8.4.0+)

> [!IMPORTANT]
> **Firebase Setup**: The Android build requires the `com.google.gms.google-services` plugin. Ensure your `google-services.json` is placed in `android/app/`.

## 🌐 Web & Desktop Support

- **Web**: Uses `usePathUrlStrategy()` from `flutter_web_plugins` for clean URLs without the hash fragment.
- **Linux**: Standard Flutter Linux support using `cmake` and GTK. Dependencies have been verified for C-level compatibility.

## 🛡️ Asset Management

Fonts are hosted locally in `res/fonts/` to ensure offline availability and consistent rendering of Arabic scripts (`Tajawal`, `Carlito`, `EMComic`).
SVG assets are managed via `flutter_svg`, ensuring crisp icons across all screen resolutions.
