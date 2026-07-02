# DeFake.ai — Deep Fake Detection Platform

<p align="center">
  <img alt="Flutter" src="https://img.shields.io/badge/Flutter-3.x-02569B?style=for-the-badge&logo=flutter&logoColor=white" />
  <img alt="Dart" src="https://img.shields.io/badge/Dart-3.4+-0175C2?style=for-the-badge&logo=dart&logoColor=white" />
  <img alt="REST API" src="https://img.shields.io/badge/REST%20API-Node.js%20Backend-339933?style=for-the-badge&logo=nodedotjs&logoColor=white" />
  <img alt="Provider" src="https://img.shields.io/badge/State%20Management-Provider-764ABC?style=for-the-badge" />
  <img alt="AI/ML" src="https://img.shields.io/badge/AI%20%2F%20ML-CNN%20%7C%20LSTM%20%7C%20CapsNet-FF6F00?style=for-the-badge&logo=tensorflow&logoColor=white" />
  <img alt="Platform" src="https://img.shields.io/badge/Platform-Android%20%7C%20iOS%20%7C%20Web-lightgrey?style=for-the-badge" />
  <img alt="License" src="https://img.shields.io/badge/License-Private-red?style=for-the-badge" />
</p>

---

## Executive Overview

**DeFake.ai** is a cross-platform mobile application built for the **Smart India Hackathon (SIH)** that leverages state-of-the-art AI/ML models to detect synthetically generated deep fake media — both video and audio. It solves a critical problem in modern digital security: the rampant proliferation of face-swap videos and AI-cloned audio that threaten public trust, individual privacy, and institutional integrity. Users can upload any video or audio file directly from their device, and the app communicates with a cloud-deployed ML backend to return a real-time authenticity probability score and technical forensic report.

---

## Key Features

- 🎥 **Dual-Modal Deepfake Detection** — Performs both **Spatial Video Analysis** (frame-level face-swap detection) and **Temporal Audio Analysis** (audio-visual lip-sync and voice authenticity verification), providing a multi-layered forensic verdict.

- 🧠 **Multi-Architecture ML Pipeline** — The backend inference engine employs an ensemble of **CNNs** (facial feature extraction), **RNNs/LSTMs** (temporal sequence anomaly detection), **Capsule Networks** (spatial hierarchy understanding), and **Adversarially Trained** models (GAN-hardened robustness) for maximum detection accuracy.

- 🔐 **Secure Authentication System** — Full JWT-based user authentication flow including sign-up, email/phone login, security question-based password recovery, and password reset — all backed by a REST API (`fakifybackend.onrender.com`).

- 📊 **Analysis History & Result Reporting** — A persistent in-session history panel (backed by Provider state management) that stores all past analysis results with technical write-ups and probability scores, accessible via the Collection view.

- 📱 **Polished Cross-Platform UI** — Built with Flutter's Material Design system, featuring animated GIF visualizers, gradient backgrounds, a convex bottom navigation bar, collapsible sidebar drawer, and responsive layouts targeting Android, iOS, and Web.

---

## Tech Stack

| Layer | Technology |
|---|---|
| **Frontend (Mobile App)** | Flutter 3.x, Dart 3.4+ |
| **UI & Navigation** | Material Design, `convex_bottom_bar`, `video_player` |
| **State Management** | Provider (`ChangeNotifier` pattern) |
| **File Handling** | `file_picker ^8.0`, `image_picker ^1.1` |
| **Networking** | `http ^1.2` (REST, Multipart file upload) |
| **Backend API** | Node.js REST API — `https://fakifybackend.onrender.com/api` |
| **Authentication** | JWT Token-based Auth (Sign Up / Login / Reset Password) |
| **ML Models (Backend)** | CNN, RNN/LSTM, Capsule Networks, Adversarially Trained GANs |
| **Analysis Types** | Spatial Video Analysis, Temporal Audio-Visual Analysis |
| **Fonts & Assets** | LibreBaskerville, InstrumentSerif, custom GIF visualizers |

---

## Application Interface
<img width="565" height="1197" alt="image" src="https://github.com/user-attachments/assets/be598957-318f-4a4a-98e8-64c543a47c70" />
<img width="565" height="1197" alt="image" src="https://github.com/user-attachments/assets/cb2d2e7d-64ce-40a6-acd8-1296b562deb5" />
<img width="562" height="1198" alt="image" src="https://github.com/user-attachments/assets/7eb38dc5-3353-4542-a9fa-113824f462d5" />
<img width="563" height="1197" alt="image" src="https://github.com/user-attachments/assets/10d29a99-0bbf-4db6-9425-621c3dc60cbb" />
<img width="563" height="1197" alt="image" src="https://github.com/user-attachments/assets/208a7fbb-85e1-4fbe-bd8f-930b03f2f02b" />
<img width="566" height="1193" alt="image" src="https://github.com/user-attachments/assets/f1241467-283f-472b-9e36-34f7ac841d24" />






[🎥 Click here to watch the Application Demo Video](https://drive.google.com/file/d/1SCdHrYnWeY6sM39jw54sp0PZEOWE667u/view)

---

## Installation & Local Setup

### Prerequisites

Ensure the following are installed on your system:

- [Flutter SDK](https://docs.flutter.dev/get-started/install) `>=3.4.4`
- Dart SDK `>=3.4.4 <4.0.0` *(bundled with Flutter)*
- Android Studio / Xcode (for mobile targets) or a web browser (for web target)
- A connected physical device or emulator

### 1. Clone the Repository

```bash
git clone https://github.com/Rudreshwar-Singh/Deep_Fake_SIH.git
cd Deep_Fake_SIH/deep_fake
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Environment & Backend Configuration

The app communicates with the pre-deployed cloud backend. No local `.env` file is required for standard use. The base API URL is hardcoded in the auth provider:

```
https://fakifybackend.onrender.com/api
```

> **Note:** If you need to point to a local backend instance, update the `baseUrl` constant in the following files:
> - `lib/services/auth/auth_provider.dart` → `baseUrl`
> - `lib/services/video/video_upload.dart` → the `Uri.parse(...)` call

### 4. Run the Application

**Android / iOS:**
```bash
flutter run
```

**Web:**
```bash
flutter run -d chrome
```

**Specific device (list connected devices first):**
```bash
flutter devices
flutter run -d <device-id>
```

### 5. Build for Production (Optional)

```bash
# Android APK
flutter build apk --release

# iOS (macOS required)
flutter build ios --release

# Web
flutter build web --release
```

---

## Usage

Once the application is running:

1. **Launch** — The app opens on the `DeFake.ai` landing page. Tap **Get Started** to proceed.

2. **Authenticate** — Log in with your registered email or phone number, or create a new account via the Sign Up screen. Use "Forgot your password?" to trigger the security question-based password recovery flow.

3. **Audio Analysis (Home Tab):**
   - Navigate to the **Audio** tab (🎤) via the bottom navigation bar.
   - Tap **Choose File** to select an audio or video file from your device.
   - Tap **Submit** to dispatch the file to the backend for temporal/audio-visual analysis.
   - View the returned **Technical Analysis** report and **Probability Score** on the result screen.

4. **Video Analysis (Video Tab):**
   - Navigate to the **Video** tab (📹).
   - Select a file and choose an analysis type (Spatial or Audio-Visual).
   - Submit and review the deep fake probability report.

5. **Analysis History:**
   - Access the **Collection** tab or **Profile** in the sidebar to review all previous analysis results from the current session.

6. **Learn More:**
   - Navigate to **How It Works** from the More tab to read detailed explanations of the CNN, LSTM, Capsule Network, and adversarial training methodologies powering the detection engine.

---

## Project Architecture

```
lib/
├── main.dart                    # App entry, MultiProvider setup
├── models/
│   ├── history.dart             # VideoAnalysis data model
│   └── result.dart              # DeepFake result model
├── screens/
│   ├── auth/
│   │   ├── landingpage.dart     # Onboarding / splash screen
│   │   ├── login.dart           # Email/phone login
│   │   ├── signup.dart          # New user registration
│   │   ├── forgotpassword.dart  # Security question flow
│   │   └── resetpassword.dart   # Password reset
│   └── home/
│       ├── home.dart            # Audio upload & analysis
│       ├── video_page.dart      # Video upload & analysis selection
│       ├── spatial.dart         # Spatial analysis result view
│       ├── temporal.dart        # Audio/temporal analysis result view
│       ├── collection.dart      # Analysis history list
│       ├── Result.dart          # Detailed result page
│       ├── about.dart           # About the project
│       ├── howitwork.dart       # ML pipeline explainer
│       ├── contact.dart         # Contact form
│       ├── user_train.dart      # User training contribution
│       └── more_page.dart       # Settings overflow page
├── services/
│   ├── auth/
│   │   └── auth_provider.dart   # JWT auth: login, signup, password reset
│   ├── video/
│   │   ├── video_upload.dart    # Multipart video upload service
│   │   └── video_store.dart     # Video analysis state store
│   └── contact/
│       └── contact_provider.dart # Contact form submission service
├── widgets/
│   ├── appbar.dart              # Reusable app bar
│   ├── bottomnavbar.dart        # ConvexAppBar navigation
│   └── sidebar.dart             # Drawer with profile & settings
└── utils/
    ├── snackbar_helper.dart     # Standardized success/error snackbars
    └── gradients.dart           # Reusable gradient definitions
```

---

## API Endpoints

| Method | Endpoint | Description |
|---|---|---|
| `POST` | `/api/auth/signup` | Register a new user |
| `POST` | `/api/auth/login` | Authenticate user, returns JWT |
| `POST` | `/api/auth/get-security-question` | Fetch security question for email |
| `POST` | `/api/auth/verify-question` | Verify security answer |
| `POST` | `/api/auth/reset-password` | Update password |
| `POST` | `/api/video/upload-video` | Upload media file for deep fake analysis |

---

## Contributing

This project was developed as part of the **Smart India Hackathon (SIH)**. Contributions are welcome via pull requests. Please open an issue first to discuss proposed changes.

---

<p align="center">
  Built with ❤️ using Flutter &bull; Powered by AI/ML &bull; SIH 2024
</p>
