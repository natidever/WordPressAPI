# News App

The application utilizes GetX for state management, providing a streamlined solution for routing, dependency injection,
and reactive programming to enhance scalability and maintainability.

# Folder Structure
The project is structured to ensure scalability, maintainability, and ease of development. Below is an overview of the folder structure:
```
lib/
├── assets/            # Contains images, fonts, icons, and other static resources
│   ├── images/
│   ├── fonts/
│   └── icons/
├── controllers/       # Contains GetX controllers for managing business logic
│   └── home_controller.dart
├── localization/      #  Manages app translations for internationalization
│   └── en_us.dart
├── models/            # Contains data models and entities
│   └── news_article.dart
├── pages/             # Contains the app's screens/pages
│   ├── home_page.dart
│   └── details_page.dart
├── routes/            # Contains routing logic and route definitions
│   └── app_routes.dart
├── services/          # Contains API services and external integrations
│   └── news_api_service.dart
├── themes/            # Manages app-wide themes and styles
│   └── app_theme.dart
├── utils/             # Contains utility classes, constants, and extensions
│   └── constants.dart
└── widgets/           # Contains reusable UI components
    ├── news_card.dart
    └── loading_indicator.dart
```




