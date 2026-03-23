# Albourane Admin

A specialized administrative dashboard for management of boats, maritime personnel (Seamen), and financial declarations. Built with Flutter, this application provides a unified interface for multiple platforms including Web, Android, and Linux.

## Features

- **Boat Management**: Create, edit, and track boat details.
- **Seamen Directory**: Manage maritime personnel profiles and records.
- **Financial Declarations**: Generate and manage CNSS/financial reports for maritime operations.
- **Multi-platform**: Fully supported and modernized for:
  - **Web**: Optimized for modern browsers with a clean responsive UI.
  - **Android**: Updated to SDK 34 with modern Gradle and Kotlin 1.8.
  - **Linux**: Native desktop support initialized.

## Getting Started

### Prerequisites

- Flutter SDK (latest stable version recommended)
- Firebase CLI (for configuration)

### Running the App

1. **Clone the repository**
2. **Install dependencies**:
   ```bash
   flutter pub get
   ```
3. **Configure Firebase**:
   The app uses Firebase for backend services. You need to configure it for your own project:
   ```bash
   flutterfire configure
   ```
4. **Run the app**:
   - For Web: `flutter run -d chrome`
   - For Linux: `flutter run -d linux`
   - For Android: `flutter run -d <device_id>`

## Architecture

The project follows a reactive architecture using **GetX** for state management and navigation. For deeper technical details, refer to [DEV_NOTES.md](./DEV_NOTES.md).
