# employee_attendance

# Employee Attendance Marking System

A Flutter-based mobile application for managing employee attendance with real-time Firebase integration. This application provides a simple yet effective solution for organizations to register employees and track their daily attendance.

## Features

### Employee Registration Module
- **Add New Employees**: Intuitive form to register employees in the system
- **Comprehensive Data Capture**: Collects Employee Name, Employee ID, Department, and Contact Number
- **Form Validation**: Ensures all required fields are properly filled before submission
- **Real-time Feedback**: Displays success and error messages for better user experience
- **Cloud Storage**: All employee data securely stored in Firebase Firestore

### Attendance Marking Module
- **Employee List Display**: View all registered employees in an organized list
- **Smart Search**: Quickly find employees by name using the search/filter functionality
- **Easy Attendance Marking**: Mark attendance with simple checkbox or toggle controls
- **Date Tracking**: Automatically records the date for each attendance entry
- **Visual Indicators**: Clear UI showing which employees have been marked present
- **Persistent Storage**: All attendance records saved to Firebase Firestore in real-time

## Technology Stack

- **Framework**: Flutter (Latest Stable Version)
- **Database**: Firebase Firestore
- **State Management**: [Mention your state management solution - Provider/Riverpod/Bloc/GetX]
- **Platform**: Android & iOS compatible

## Prerequisites

Before running this application, ensure you have the following installed:

- Flutter SDK (3.0 or higher)
- Dart SDK
- Android Studio / VS Code with Flutter extensions
- Firebase account with a configured project

## Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/your-username/employee-attendance-system.git
cd employee-attendance-system
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Firebase Configuration

1. Create a new Firebase project at [Firebase Console](https://console.firebase.google.com/)
2. Enable Firestore Database in your Firebase project
3. Download the configuration files:
   - For Android: Download `google-services.json` and place it in `android/app/`
   - For iOS: Download `GoogleService-Info.plist` and place it in `ios/Runner/`
4. Update Firebase configuration in your project

### 4. Run the Application

```bash
flutter run
```

## Project Structure

```
lib/
├── models/          # Data models for Employee and Attendance
├── screens/         # UI screens (Registration, Attendance)
├── services/        # Firebase service classes
├── widgets/         # Reusable UI components
└── main.dart        # Application entry point
```

## Usage

### Registering an Employee

1. Navigate to the Employee Registration screen
2. Fill in all required fields (Name, ID, Department, Contact)
3. Tap the Submit button
4. Confirmation message will appear upon successful registration

### Marking Attendance

1. Open the Attendance Marking screen
2. Use the search bar to filter employees if needed
3. Toggle the checkbox/switch next to each employee's name to mark them present
4. Attendance is automatically saved with the current date

## Code Quality Features

- **Clean Architecture**: Well-organized code structure following Flutter best practices
- **Error Handling**: Comprehensive error handling throughout the application
- **Code Comments**: Detailed comments explaining complex logic
- **Validation**: Input validation on all forms
- **Responsive UI**: Adaptive layout for different screen sizes

## Future Enhancements

- Employee profile editing and deletion
- Attendance history and reports
- Export attendance data to Excel/PDF
- Push notifications for attendance reminders
- Biometric authentication
- Admin dashboard with analytics

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## Acknowledgments

This project was developed as part of a Flutter Developer Assessment Task, demonstrating proficiency in Flutter development, Firebase integration, and mobile app architecture.

<img width="1440" height="327" alt="Screenshot 2025-12-19 at 14 37 15" src="https://github.com/user-attachments/assets/16b4206f-e75d-4b4c-a015-83e6b7d09aad" />
<img width="1440" height="340" alt="Screenshot 2025-12-19 at 14 40 14" src="https://github.com/user-attachments/assets/3f09569a-f655-4c88-b383-68c8e51d8615" />
<img width="1440" height="900" alt="Screenshot 2025-12-19 at 14 49 07" src="https://github.com/user-attachments/assets/5768c476-c0a3-4902-b07e-48a93a06fb78" />
<img width="1440" height="900" alt="Screenshot 2025-12-19 at 14 49 15" src="https://github.com/user-attachments/assets/dda43310-5530-4df2-8ec7-ff3bfe211c87" />
<img width="1440" height="293" alt="Screenshot 2025-12-19 at 14 50 52" src="https://github.com/user-attachments/assets/0c2fb58f-1815-42d6-97e6-48231c2a3a70" />
<img width="1440" height="900" alt="Screenshot 2025-12-19 at 14 52 19" src="https://github.com/user-attachments/assets/aeffd4ce-5bd1-4e19-850a-87c4a1b433c5" />
<img width="1440" height="900" alt="Screenshot 2025-12-19 at 14 58 37" src="https://github.com/user-attachments/assets/37d216c2-0567-474d-8e28-536a1512ac4e" />
<img width="1077" height="586" alt="Screenshot 2025-12-19 at 18 22 02" src="https://github.com/user-attachments/assets/2b975b4b-68b7-4ae9-8eae-594ee6bba51e" />
<img width="291" height="632" alt="Screenshot 2025-12-20 at 00 45 14" src="https://github.com/user-attachments/assets/2f7d7f3b-a980-4ee6-b90d-5d9d4a91727e" />
<img width="291" height="632" alt="Screenshot 2025-12-20 at 00 45 54" src="https://github.com/user-attachments/assets/014d50b0-da62-403f-80ce-9ed193221603" />
<img width="291" height="632" alt="Screenshot 2025-12-20 at 00 46 01" src="https://github.com/user-attachments/assets/63a0c680-5304-4f93-91f2-356711be3b62" />
<img width="291" height="632" alt="Screenshot 2025-12-20 at 00 46 14" src="https://github.com/user-attachments/assets/6556a243-1297-4979-93ed-1a50877aee8a" />
<img width="291" height="632" alt="Screenshot 2025-12-20 at 00 47 15" src="https://github.com/user-attachments/assets/412d41bd-022b-47d5-bc23-32c8a2e59b58" />
<img width="291" height="632" alt="Screenshot 2025-12-20 at 00 47 44" src="https://github.com/user-attachments/assets/e0fdef7f-d70e-4577-953e-7874f96c7ae4" />
<img width="291" height="632" alt="Screenshot 2025-12-20 at 00 47 59" src="https://github.com/user-attachments/assets/140d4d2e-4cf3-4f44-851c-0e36f12e2447" />
