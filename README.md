# Mid Test Project Flutter App

A Simple Flutter Application for Mid Test Project. Login and register functionality included. Using sqlflite for local database management.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## Features
- User Registration
- User Login
- Local Database Management using sqflite


## Dependencies
- flutter
- sqflite

## Documentation
The code is documented with comments explaining the functionality of different parts of the application. Please refer to the code files for detailed documentation.

- Login Screen
<img src="assets/img/login.jpg" width="200"/> 

- Register Screen
<img src="assets/img/register.jpg" width="200"/>

## Folder Structure
```
lib/
├── main.dart          # Entry point of the application
├── screens/          # Contains all the screen widgets
│   ├── login_screen.dart
│   └── register_screen.dart
├── models/           # Contains data models
│   └── user_model.dart
├── database/         # Contains services for database operations
│   └── database_helper.dart
└── utils/            # Contains utility functions
    └── CounterPageState.dart
    └── DataFetchPage.dart
```