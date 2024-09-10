# Heartily Chat App

Heartily Chat is a real-time messaging application built using **Flutter** and **Firebase**. The app allows users to register, log in, and chat with others in real-time, leveraging Firebase for authentication, real-time database, and storage. This project is designed for both Android and iOS platforms, providing a seamless and responsive chat experience across devices.

## Features

- **User Authentication**: Secure sign-up and login using Firebase Authentication.
- **Real-time Messaging**: Instant messaging with real-time updates using Firebase Firestore.
- **User Profile Management**: Users can manage their profiles, including updating their display name and profile picture.
- **Group & Private Chats**: Support for one-on-one and group conversations.
- **Media Sharing**: Send and receive images in chat.
- **Push Notifications**: Receive notifications for new messages.

## Screenshots
![heartily chat](https://github.com/user-attachments/assets/99b8f1c4-c529-4d35-8aff-ebff9ae7cb36)



## Technologies Used

- **Flutter**: Frontend framework for building natively compiled applications for mobile.
- **Firebase**:
  - **Firebase Authentication**: Used for user registration, login, and secure access control.
  - **Firebase Firestore**: Real-time NoSQL database for storing messages and user data.
  - **Firebase Storage**: Used to store media (profile pictures, chat images) shared by users.
  - **Firebase Cloud Messaging**: Push notifications for new messages.

## Installation

1. **Clone the repository:**
    ```bash
    git clone https://github.com/RadhaPriyadarshan/Heartily_Chat_App.git
    ```

2. **Navigate to the project directory:**
    ```bash
    cd Heartily_Chat_App
    ```

3. **Install dependencies:**
    ```bash
    flutter pub get
    ```

4. **Set up Firebase:**
    - Create a Firebase project from the [Firebase Console](https://console.firebase.google.com/).
    - Add an Android and/or iOS app to your Firebase project.
    - Download the `google-services.json` (for Android) or `GoogleService-Info.plist` (for iOS) and place it in the appropriate directories:
      - For Android: `android/app/google-services.json`
      - For iOS: `ios/Runner/GoogleService-Info.plist`
    - Enable Firebase Authentication, Firestore, and Storage in your Firebase project.

5. **Run the app:**
    ```bash
    flutter run
    ```

## Project Structure

The project follows a standard **Flutter** structure:

```
lib/
├── main.dart                   # Entry point of the app
├── contants.dart               # contant theme values    
├── screens/                    # App screens like chat, login, register, profile, etc.           
└── components/                 # Reusable widgets like message bubbles, input fields, etc.    
```

## Contributing

Contributions are welcome! If you would like to contribute to the project:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Make your changes.
4. Push to the branch (`git push origin feature-branch`).
5. Create a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.


