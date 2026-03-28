# SaveUp 💸

**Your smart and friendly financial companion!**

SaveUp is a mobile application built with Flutter to help you manage your personal finances effortlessly. With an intuitive interface, powerful features, and AI integration, managing your money has never been this easy and insightful. This app is designed to provide a clear overview of your financial habits and help you achieve your saving goals.

---

## ✨ Key Features

*   **Financial Tracking**: Easily record your income and expenses.
*   **Data Visualization**: Interactive charts and graphs to visualize your spending patterns.
*   **AI-Powered Insights**: Get smart financial advice and summaries from our AI assistant.
*   **Onboarding**: A smooth and welcoming onboarding experience for new users.
*   **Local Data Storage**: Your data is stored securely on your device using Hive.
*   **Cross-Platform**: A single codebase that runs on both Android and iOS.

---

## 🛠️ Tech Stack & Tools

This project is built with a modern and robust tech stack to ensure a high-quality user experience and maintainable codebase.

### Core Framework
*   **[Flutter](https://flutter.dev/)**: The foundation of our application, enabling cross-platform development from a single codebase.

### State Management
*   **[Bloc](https://bloclibrary.dev/)**: For predictable and scalable state management, separating business logic from the UI.

### Backend & AI
*   **[Firebase](https://firebase.google.com/)**: Used for backend services and integration with AI.
*   **[Firebase AI](https://firebase.google.com/products/ai)**: Powers the AI assistant to provide smart financial insights.

### Local Storage
*   **[Hive](https://pub.dev/packages/hive)**: A lightweight and fast NoSQL database for local data storage.

### UI & UX
*   **[Google Fonts](https://pub.dev/packages/google_fonts)**: For beautiful and consistent typography.
*   **[FL Chart](https://pub.dev/packages/fl_chart)**: To create stunning and interactive charts.
*   **[Flutter SVG](https://pub.dev/packages/flutter_svg)**: To render high-quality SVG images.
*   **[Smooth Page Indicator](https://pub.dev/packages/smooth_page_indicator)**: For a sleek onboarding experience.

### Utilities
*   **[GetIt](https://pub.dev/packages/get_it)**: A service locator for dependency injection.
*   **[Image Picker](https://pub.dev/packages/image_picker)**: To allow users to pick images.
*   **[Intl](https://pub.dev/packages/intl)**: For internationalization and date/number formatting.

---

## 🚀 Getting Started

To get a local copy up and running, follow these simple steps.

### Prerequisites

*   Flutter SDK installed on your machine.
*   An editor like VS Code or Android Studio.

### Installation

1.  **Clone the repo**
    ```sh
    git clone https://github.com/alHerys/SaveUp.git
    ```
2.  **Navigate to the project directory**
    ```sh
    cd SaveUp
    ```
3.  **Install dependencies**
    ```sh
    flutter pub get
    ```
4.  **Run the app**
    ```sh
    flutter run
    ```

---

## 📂 Project Structure

The project follows a clean and organized structure to make it easy to navigate and contribute.

```
/
├── lib/
│   ├── app/          # Core application setup
│   ├── common/       # Shared widgets and utilities
│   ├── core/         # Core components (e.g., AI, database)
│   ├── data/         # Data models and repositories
│   ├── features/     # Main features of the app
│   └── main.dart     # Entry point of the application
├── assets/           # Images and other static assets
└── pubspec.yaml      # Project dependencies
```

---

## 🤝 Contributing

Contributions are what make the open-source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".

1.  Fork the Project
2.  Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3.  Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4.  Push to the Branch (`git push origin feature/AmazingFeature`)
5.  Open a Pull Request

---

Happy saving! 💰