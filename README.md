# Albourane (البوران)

A complete maritime management ecosystem for the Artisanal Fishing Cooperative Albourane Ouedlaou.

## About

**Albourane** is a multi-application platform designed to support traditional maritime fishing operations in Ouedlaou, Morocco. It provides tools for boat management, seamen tracking, financial declarations, and reporting.

## Projects

This repository contains two Flutter applications:

### 1. Albourane (Client App)
A cross-platform application for maritime tracking and information.

**Platforms**: Web, Linux Desktop, Android

**Features**:
- Maritime tracking and boat information management
- Real-time connectivity monitoring
- PDF generation and document printing
- Arabic language support with Tajawal font
- Firebase backend (Auth & Firestore)

**Tech Stack**:
- Flutter (v3.12+)
- GetX (State Management)
- Firebase (Auth, Firestore)
- `pdf` & `printing` packages
- `cross_connectivity`

### 2. Albourane Admin
Administrative dashboard for cooperative management.

**Platforms**: Web, Android, Linux Desktop

**Features**:
- Boat management (create, edit, track)
- Seamen directory (maritime personnel profiles)
- Financial declarations (CNSS/financial reports)
- Multi-platform support with modernized UI

**Tech Stack**:
- Flutter
- GetX
- Firebase (Firestore, Authentication)
- `intl` for internationalization
- `printing` & `pdf` for reports

## Getting Started

### Prerequisites

- Flutter SDK (latest stable)
- Firebase CLI

### Installation

1. Clone the repository
2. Navigate to the desired project:
   - `cd albourane` (client app)
   - `cd admin` (admin dashboard)
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Configure Firebase:
   ```bash
   flutterfire configure
   ```

### Running the App

**Client App (albourane)**:
- Web: `flutter run -d chrome`
- Linux: `flutter run -d linux`
- Android: `flutter run -d <device_id>`

**Admin Dashboard**:
- Web: `flutter run -d chrome`
- Linux: `flutter run -d linux`
- Android: `flutter run -d <device_id>`

### Firebase Configuration

- **Android**: Place `google-services.json` in `android/app/` directory
- **Web**: Configure Firebase via initialization flow

> [!WARNING]
> The Android build will fail without `google-services.json`.

## Architecture

Both projects follow **GetX** modular architecture:
- **Routing**: Centralized path-based routing
- **State Management**: GetView + GetxController
- **Bindings**: Dependency injection via GetX bindings

## License

<a href="https://www.buymeacoffee.com/omniversify" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-red.png" alt="Buy Me A Coffee" style="height: 60px !important;width: 217px !important;" ></a>
