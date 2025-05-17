# Flutter MVVM with Provider

A Flutter project demonstrating the implementation of the MVVM (Model-View-ViewModel) architectural pattern using Provider for state management.

## Project Architecture

This project follows the MVVM (Model-View-ViewModel) architecture pattern, which is organized as follows:

### 📁 Directory Structure

```plaintext
lib/
├── components/          # Reusable UI components
├── user_list/           # Feature module
│   ├── models/          # Data models
│   ├── views/           # UI screens
│   ├── view_models/     # Business logic and state management
│   └── repository/      # Data handling and API calls
└── utils/               # Utility classes and constants

### MVVM Components

1. **Models**
   - Represent the data structure
   - Handle data parsing and validation
   - Example: `UserModel`, `Address`, `Company`

2. **Views**
   - UI layer that displays data to users
   - Observes ViewModel for state changes
   - Example: `HomeScreen`, `UserDetailsScreen`

3. **ViewModels**
   - Contains the business logic
   - Manages UI state using Provider
   - Handles data operations through repository
   - Example: `UsersViewModel`

4. **Repository**
   - Manages data operations
   - Handles API calls and data processing
   - Example: `UserServices`

## Features

- Fetch and display user list
- View detailed user information
- Add new users
- Error handling
- Loading states

## State Management

This project uses Provider for state management, offering:
- Reactive UI updates
- Efficient dependency injection
- Simple state management solution

## Getting Started

1. Clone the repository
2. Run `flutter pub get`
3. Run `flutter run`

## Dependencies

- `provider`: For state management
- `http`: For API calls

## Requirements

- Flutter SDK
- Dart SDK

## Contributing

Feel free to submit issues and enhancement requests.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
