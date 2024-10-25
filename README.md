# UpTodo Application

This project is a **hands-on** exercise in Flutter app development, where I am building a task management app to **enhance my skills** and develop my ability to create robust and efficient apps. The app is based on using **Bloc** to manage state and follows the **MVVM** design pattern to ensure good separation of tasks between interface and logical components. I also use **Git and GitHub** as tools for version control, modification management, and continuous development. Additionally, I leverage **Trello** for effective project management, tracking progress, and organizing tasks. Through this project, I aim to gain hands-on experience in building scalable apps and following best programming practices using Flutter.

## Features

- **Task Management**: Create, update, delete, and organize tasks efficiently.
- **Firebase Integration**: 
  - **Database**: Uses Firebase Firestore to store and retrieve task data.
  - **Authentication**: Integrates Firebase Authentication for secure user sign-in and sign-out.
- **State Management**: Utilizes the Bloc pattern for efficient state handling.
- **MVVM Design Pattern**: Adheres to the MVVM architecture to separate business logic from UI.
- **Project Management**: Uses Trello for organizing development tasks and tracking progress.


## State Management

The application uses the **Bloc** pattern for state management to handle:

- Task creation, deletion, and updates.
- Fetching task lists from Firebase.
- Managing user authentication state.

## Firebase Integration

- **Firestore**: Stores task data, allowing for real-time updates and seamless data management.
- **Authentication**: Supports user registration, login, and logout through Firebase Authentication, ensuring secure access to user-specific data.

## Project Management

The development process is organized and tracked using **Trello**, allowing for efficient management of tasks, tracking progress, and keeping an overview of the project milestones.

## Packages Used

The following packages are utilized to build and enhance the functionality of the UpTodo application:

- **cloud_firestore: ^5.4.4**: For integrating Firebase Firestore as a real-time database.
- **firebase_auth: ^5.3.1**: For user authentication, including email/password and third-party login methods.
- **firebase_core: ^3.6.0**: Essential for initializing Firebase in the app.
- **firebase_storage: ^12.3.4**: To handle images uploads
- **flutter_bloc: ^8.1.6**: For state management, facilitating reactive programming.
- **flutter_facebook_auth: ^7.1.1**: Enables users to sign in using their Facebook accounts.
- **flutter_native_splash: ^2.4.2**: To create a custom splash screen for the app.
- **flutter_svg: ^2.0.10+1**: For rendering SVG images in the UI.
- **get_it: ^8.0.1**: A service locator for managing dependencies 
- **flutter_screenutil: ^5.9.3**: A flutter plugin for adapting screen and font size.Let your  UI 
display a reasonable layout on different screen sizes! 
- **smooth_page_indicator: ^1.2.0+3**: Page indicators are a crucial part of any app that involves multiple pages.

