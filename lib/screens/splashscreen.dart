// Importing necessary packages and files.
import 'package:flutter/material.dart'; // Flutter's material design package for UI components.
import 'package:my_pocket_wallet/screens/pages/register.dart';

// Splashscreen widget represents the splash screen of the app.
class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  _SplashscreenState createState() => _SplashscreenState(); // Creates the state for the Splashscreen widget.
}

// State class for the Splashscreen widget.
class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue.shade900, // Background color matching the app theme.
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centers the content vertically.
          children: [
            _topImageSection(), // Displays the top image section.
            const SizedBox(height: 24), // Spacing between sections.
            _middleScreenText(), // Displays the middle text section.
            const SizedBox(height: 32), // Spacing between sections.
            _splashButton(context), // Displays the "Get Started" button.
          ],
        ),
      ),
    );
  }
}

// Top Image Section
Widget _topImageSection() {
  return Container(
    padding: const EdgeInsets.all(16.0), // Padding around the image.
    child: Center(
      child: Image.asset(
        "assets/images/bank_wallet.png", // Path to the image asset.
        width: 200, // Width of the image.
        height: 200, // Height of the image.
      ),
    ),
  );
}

// Middle Screen Text Section
Widget _middleScreenText() {
  return const Column(
    children: [
      Text(
        "My Pocket Wallet", // Main title text.
        style: TextStyle(
          fontSize: 24, // Font size.
          fontWeight: FontWeight.bold, // Bold font weight.
          color: Colors.white, // Text color.
        ),
      ),
      SizedBox(height: 10), // Spacing between texts.
      Text(
        "Your secure digital wallet for easy transactions", // Subtitle text.
        textAlign: TextAlign.center, // Center-align the text.
        style: TextStyle(
          fontSize: 16, // Font size.
          color: Colors.white70, // Text color with opacity.
        ),
      ),
    ],
  );
}

// Splash Button Section
Widget _splashButton(BuildContext context) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.orangeAccent, // Button background color.
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30), // Rounded corners for the button.
      ),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12), // Button padding.
    ),
    onPressed: () {
      // Action to perform when the button is pressed.
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SignUpPage()), // Navigates to the Register page.
      );
    },
    child: const Text(
      "Get Started", // Button text.
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Button text style.
    ),
  );
}