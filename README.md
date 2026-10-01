# Artfolio 🎨

Artfolio is a responsive digital art discovery and portfolio application built with Flutter and Dart.

It provides a visually focused platform where users can explore artwork, search and filter collections, save favorites, view artwork details, and edit a creator profile.

## ✨ Features

- 🏠 Art discovery home page
- 🔎 Artwork search
- 🏷️ Category-based artwork filtering
- ❤️ Add/remove artwork from favorites
- 🖼️ Artwork detail pages
- 👤 Editable artist profile
- 📝 Form validation
- 🌐 REST API integration
- ⏳ API loading and error states
- ✨ Animated favorite interactions
- 📱 Responsive artwork grid
- 🎨 Centralized application theme
- 🧪 Automated Provider test

## 🛠️ Technologies Used

- Flutter
- Dart
- Material 3
- Provider
- REST API
- JSON
- Git & GitHub

## 📂 Project Structure

```text
lib/
├── main.dart
├── models/
│   └── artwork.dart
├── providers/
│   └── favorites_provider.dart
├── screens/
│   ├── home_screen.dart
│   ├── explore_screen.dart
│   ├── favorites_screen.dart
│   ├── profile_screen.dart
│   ├── artwork_details_screen.dart
│   └── edit_profile_screen.dart
├── services/
│   └── quote_service.dart
├── theme/
│   └── art_theme.dart
└── widgets/
    └── artwork_card.dart

assets/
└── images/

test/
└── widget_test.dart