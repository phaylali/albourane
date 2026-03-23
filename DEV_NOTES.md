# Developer Notes - Albourane

This document contains technical details, architecture decisions, and platform-specific configurations for the Albourane project ecosystem.

## Architecture

Both applications follow **GetX** modular architecture:

- **Routing**: Centralized in `lib/resources/routes.dart` with path-based URL strategies for web
- **State Management**: GetView + GetxController pattern
- **Bindings**: Dependency injection via `lib/resources/bindings.dart`

## Core Stack

### Client App (albourane)
- Flutter (v3.12+)
- GetX (^4.7.3)
- Firebase (^4.5.0 core) - Auth & Firestore
- `pdf` & `printing` for document generation
- `cross_connectivity` (^3.3.0) for network monitoring
- `flutter_svg` for scalable icons
- `flutter_web_plugins` for URL strategy

### Admin Dashboard
- Flutter
- GetX
- Firebase (Firestore, Authentication)
- `intl` for dates and number formatting
- `printing` & `pdf` for reports

## Project Standards (2026)

1. **Naming Convention**: All files use Dart `lower_case_with_underscores`
2. **Linting**: 100% compliant with `flutter analyze`
3. **Production**: `print` statements replaced with `debugPrint`
4. **Widgets**: Modern `super.key` parameters

## Platform Configurations

### Android
| Property | Client App | Admin |
|----------|-----------|-------|
| Target/Compile SDK | 34 | 34 |
| Gradle Version | 9.4.1 | 7.5 |
| AGP | 8.4.0 | 7.3.0 |
| Kotlin | 1.9.22 | 1.8.22 |
| Java Target | 17 | - |

### Web
- Uses `usePathUrlStrategy()` from `flutter_web_plugins` for clean URLs (no hash fragment)
- Firebase initialized via FlutterFire plugins (no manual JS SDK)

### Linux
- Native desktop support initialized
- Platform-specific guards for non-native plugins
- Firebase features skipped on Linux to maintain stability (Firestore/Auth in beta)

## Firebase Resilience

The apps are resilient against missing configurations or unsupported platforms:

1. **Safe Initialization**: `Firebase.initializeApp()` wrapped in try-catch
2. **Platform Checks**: Linux blocks Firebase initialization to prevent crashes
3. **Lazy Controllers**: Firebase instances initialized only in `onInit()` if `Firebase.apps` is not empty
4. **Nullable UI**: FutureBuilder components handle nullable snapshots correctly

## Asset Management

- **Fonts**: Stored locally in `res/fonts/` for offline availability
- **Arabic Support**: Tajawal, Carlito, EMComic fonts
- **Icons**: SVG via `flutter_svg` for crisp rendering across resolutions

## Known Limitations

- Firebase Linux Support: Limited/beta - features skipped on Linux
- Android requires `google-services.json` to build
- Some stylistic lint suggestions remain (e.g., `prefer_const`)

## Directory Structure

```
albourane/
├── admin/                    # Admin dashboard
│   ├── lib/
│   │   ├── controllers/     # GetX controllers
│   │   ├── views/           # UI screens
│   │   ├── resources/       # Routes, bindings
│   │   └── ...
│   ├── android/
│   └── ...
├── albourane/               # Client app
│   ├── lib/
│   │   ├── controllers/
│   │   ├── views/
│   │   ├── resources/
│   │   └── ...
│   ├── android/
│   └── ...
└── res/
    └── fonts/
```
