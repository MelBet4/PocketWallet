# My Pocket Wallet – Your Digital Wallet Solution

**My Pocket Wallet** is a modern, mobile-first Flutter application designed to help users manage their finances with ease. The app enables secure money transfers, bill payments, mobile recharges, and card/account management, all within a user-friendly interface.

Built with Flutter, My Pocket Wallet is optimized for smooth performance and a consistent experience across Android, iOS, and web platforms.

---

## Features

### Core Functionalities
- Money Transfer  
  Send money securely to other users or accounts
- Bill Payments  
  Pay for utilities such as electricity, water, internet, and rent
- Mobile Recharge  
  Top up your mobile phone or others directly from the app
- Card & Account Management  
  Add, view, and manage your cards and bank accounts
- Transaction History  
  View a record of your past transactions
- Form Validation  
  All user inputs are validated for security and accuracy
- Animated Transitions  
  Smooth page transitions and animated feedback for key actions

---

## Tech Stack

- Frontend & UI: Flutter (Dart)
- State Management: setState (Flutter built-in)
- Backend: Firebase (Authentication, planned for cloud sync)

---

## Target Users

- Individuals seeking a simple, secure digital wallet
- Users who want to manage money, pay bills, and recharge phones in one app
- Android, iOS, and web users

---

## Installation

### Prerequisites
- Flutter SDK (3.0+ recommended)
- Dart
- Android Studio, Xcode, or VS Code

### Steps
```bash
git clone https://github.com/YOUR_USERNAME/my_pocket_wallet.git
cd my_pocket_wallet
flutter pub get
flutter run
```

---

## Web Deployment (Vercel)

To deploy the Flutter web app to Vercel:

1. Build the web app:
   ```bash
   flutter build web
   ```
2. Ensure `vercel.json` is present in the project root with the following content:
   ```json
   {
     "builds": [
       { "src": "build/web/**", "use": "@vercel/static" }
     ],
     "rewrites": [
       { "source": "/(.*)", "destination": "/" }
     ]
   }
   ```
3. Connect your repo to Vercel and set:
   - Root Directory: my_pocket_wallet (if your repo contains multiple projects)
   - Build Command: flutter build web
   - Output Directory: build/web
4. Deploy!

---

## Environment & Security

- Firebase Config:  
  The file `lib/firebase_options.dart` contains your Firebase credentials.  
  - This file is gitignored for security.
  - Use the provided `lib/firebaseoptions.example.dart` as a template and add your own credentials locally.

---

## Contributing

1. Fork the repo
2. Create your feature branch (`git checkout -b feature/YourFeature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin feature/YourFeature`)
5. Open a pull request

---
Acknowledgements
Melanie Chebet - developer
Allan Lenkaa - Flutter/Dart instructor at Power Learn Project

