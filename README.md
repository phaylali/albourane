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

## Support Us

<p align="center">
  <a href="https://ko-fi.com/omniversify">
    <img src="https://raw.githubusercontent.com/phaylali/Omniversify/main/public/images/kofi_logo.svg" width="200" alt="Ko-Fi" />
  </a>
</p>

<p align="center">
  <strong>Keep us going</strong>
</p>

---

&copy; 2026 [Omniversify](https://omniversify.com). All rights reserved.

_Made by Moroccans, for the Omniverse_

[![ReadMeSupportPalestine](https://raw.githubusercontent.com/Safouene1/support-palestine-banner/master/banner-project.svg)](https://donate.unrwa.org/-landing-page/en_EN)
