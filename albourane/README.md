# Albourane (البوران)

A high-performance Flutter application designed for maritime tracking and management. This project provides a robust, cross-platform experience with specialized support for Web, Linux, and Android.

## 🚢 About the Project

**Albourane** (Arabic: البوران) is a modern Flutter application built to provide information and management tools, likely centered around maritime activities (boats) as suggested by its core UI components.

### Features
- **Cross-Platform**: Fully compatible with Web, Linux Desktop, and Android.
- **Cloud Integration**: Powered by Firebase (Auth and Firestore) for real-time data storage and user management.
- **Connectivity Monitoring**: Real-time detection of network status (WiFi, Mobile, Ethernet).
- **Reporting**: Native support for PDF generation and document printing.
- **Localized UI**: Designed with Arabic support using high-quality typography (Tajawal).

## 🚀 Getting Started

### Prerequisites

To successfully build and run the application, especially for Android, you must provide your own Firebase configuration:

- **Android**: Place your `google-services.json` file in the `android/app/` directory. **The project will not build properly for Android without this file.**
- **Web**: Configure the Firebase configuration for web in the initialization flow.

### Installation

1. Clone the repository.
2. Run `flutter pub get` to install dependencies.
3. Building for Linux: `flutter build linux`.
4. Building for Web: `flutter build web`.
5. Building for Android: `flutter build apk` (Ensure `google-services.json` is present).

## 🛠️ Tech Stack
- **Framework**: Flutter (v3.12+ compatible)
- **State Management**: GetX
- **Backend**: Firebase (Auth, Firestore)
- **PDF/Print**: `pdf`, `printing`
- **Networking**: `cross_connectivity`
