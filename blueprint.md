# App Blueprint

## Overview

This application is a Flutter app integrated with Firebase. The goal is to add user authentication functionality to allow users to log in and register.

## Style, Design, and Features

*   **Theme:** The app uses a Material Design 3 theme with a primary seed color. It supports both light and dark modes with a toggle option.
*   **Navigation:** (To be implemented) Navigation will be handled using `go_router` to manage authenticated and unauthenticated routes.
*   **Authentication:** (To be implemented) Firebase Authentication will be used for user login and registration. The initial implementation will support Email/Password authentication.
*   **UI Components:** (To be implemented) Login and Registration screens will be created with appropriate form fields and buttons.

## Plan for Current Change: Add Login Functionality

**Goal:** Implement user login and registration using Firebase Authentication.

**Steps:**

1.  Add `firebase_auth` and `firebase_core` dependencies to `pubspec.yaml`.
2.  Ensure Firebase is initialized in `lib/main.dart`.
3.  Create a file `lib/services/auth_service.dart` to implement authentication logic.
4.  Create a file `lib/screens/login_screen.dart` for the login UI.
5.  Create a file `lib/screens/registration_screen.dart` for the registration UI.
6.  Integrate `go_router` for navigation based on authentication state.
7.  Implement error handling and state management for authentication.
