# Developer Notes - Albourane Admin

This document contains "boring" technical details, architecture decisions, and notes on the 2026 modernization and platform expansion effort.

## Core Stack

- **Framework**: Flutter
- **State Management**: GetX (Controllers, Bindings, and Reactive state)
- **Backend**: Firebase (Firestore, Authentication)
- **Internationalization**: `intl` for dates and number formatting.
- **Exports**: `printing` and `pdf` for generating maritime reports.

## Project Standards (March 2026 Update)

1. **Naming Convention**: All files now follow the official Dart `lower_case_with_underscores` convention.
2. **Linting**: The project is 100% compliant with `flutter analyze` ("No issues found!").
3. **Production Standards**: `print` statements have been removed or replaced with `debugPrint`.
4. **Widgets**: All widgets use modern `super.key` parameters.

## Modernization (March 2026)

### Android Updates
- **SDK**: Upgraded to **Target SDK 34** and **Compile SDK 34**.
- **Build System**:
  - Kotlin version: `1.8.22`
  - Gradle Plugin: `7.3.0`
  - Gradle Distribution: `7.5`
  - Google Services: `4.3.15`
- **Dependency Optimization**: Removed redundant manual Firebase SDK declarations in `app/build.gradle` to allow the Flutter plugins to manage native dependencies correctly via Gradle.

### Web Modernization
- Updated `web/index.html` to use the modern Flutter initialization pattern.
- Removed outdated Firebase JS SDK `<script>` tags in favor of self-initializing FlutterFire plugins.

### Linux Support
- Initialized native Linux platform support.
- Added platform-specific guards for non-native plugins.

## Firebase Resilience Strategy

Due to the criticality of Firebase initialization, the app has been refactored to be resilient against missing configurations or unsupported platforms (like Linux):

1. **Safe Initialization (`main.dart`)**:
   - `Firebase.initializeApp()` is wrapped in a try-catch block.
   - A platform check blocks initialization on Linux to prevent startup crashes.

2. **Lazy Controller Guards**:
   - All 12 Firebase-dependent controllers (`HomeController`, `BoatsController`, etc.) have been updated to use `lazyPut`.
   - Firebase instances (Firestore/Auth) are initialized only in `onInit()` and ONLY if `Firebase.apps` is not empty.
   - Methods that perform Firebase operations check for connection status before execution.

3. **Nullable UI Handling**:
   - UI components using `FutureBuilder` (e.g., `Articles`, `ArticlePage`) now correctly handle nullable `snapshots` to avoid "Null check operator used on null value" errors when data is unavailable.

## Known Limitations / TODO
- **Firebase Linux Support**: Official support for Firestore/Auth on Linux is still in limited/beta stages for some plugins. The app currently skips these features on Linux to maintain UI stability.
- **Stylistic Lints**: While functional errors are resolved, the codebase currently has many stylistic lint suggestions (`prefer_const`) which can be addressed in future refactoring passes.
