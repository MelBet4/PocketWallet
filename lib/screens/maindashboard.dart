// Importing necessary packages and files.
import 'package:flutter/material.dart'; // Flutter's material design package for UI components.

// DashboardPage widget represents the main dashboard screen of the app.
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key}); // Constructor for the class with a unique key.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar displaying the title of the page.
      appBar: AppBar(
        title: const Text('Dashboard'), // Title displayed in the AppBar.
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Adds padding around the body.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Aligns children to the start of the column.
          children: [
            _greetUser(), // Displays the greeting message.
            const SizedBox(height: 20), // Adds space between widgets.

            // Account Balance Container.
            _accountBalance(), // Displays the account balance section.
            const SizedBox(height: 40), // Adds space after account balance.

            // Row to center the buttons horizontally.
            //_paymentType(context), // Displays the payment type buttons.
          ],
        ),
      ),
    );
  }

  // Greeting Widget
  Widget _greetUser() {
    return const SizedBox(
      child: Text(
        'Hello, User!', // Greeting text.
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold, // Bold font for the greeting.
        ),
      ),
    );
  }
}

// Account Balance Container.
Widget _accountBalance() {
  return Container(
    padding: const EdgeInsets.all(16), // Adds padding inside the container.
    decoration: BoxDecoration(
      color: Colors.blueAccent, // Background color for the container.
      borderRadius: BorderRadius.circular(12), // Rounded corners for the container.
    ),
    child: const Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Aligns children to the start of the column.
      children: [
        Text(
          'Account Balance', // Label for account balance.
          style: TextStyle(
            color: Colors.white, // White color for the label.
            fontSize: 18, // Font size for the label.
          ),
        ),
        SizedBox(height: 10), // Adds space between label and balance.
        Text(
          '\$12,345.67', // Account balance amount.
          style: TextStyle(
            color: Colors.white, // White color for the balance.
            fontSize: 32, // Font size for the balance amount.
            fontWeight: FontWeight.bold, // Bold font for the balance amount.
          ),
        ),
      ],
    ),
  );
}

// Row to center the buttons horizontally.
// Widget _paymentType(BuildContext context) {
//   return Column(
//     mainAxisAlignment: MainAxisAlignment.center, // Centers buttons horizontally.
//     children: [
//       // Send Money Button.
//       ElevatedButton(
//         onPressed: () {
//           // Navigates to the SendMoneyPage when pressed.
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => const SendMoneyPage()),
//           );
//         },
//         style: ElevatedButton.styleFrom(
//           padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30), // Padding inside the button.
//           textStyle: const TextStyle(fontSize: 18), // Text style for the button.
//         ),
//         child: const Text('Send Money'), // Button label.
//       ),

//       const SizedBox(height: 20), // Adds space between the buttons.

//       // Pay Bills Button.
//       ElevatedButton(
//         onPressed: () {
//           // Navigates to the PayBillsPage when pressed.
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => const PayBillsPage()),
//           );
//         },
//         style: ElevatedButton.styleFrom(
//           padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30), // Padding inside the button.
//           textStyle: const TextStyle(fontSize: 18), // Text style for the button.
//         ),
//         child: const Text('Pay Bills'), // Button label.
//       ),

//       const SizedBox(height: 20), // Adds space between the buttons.

//       // Withdraw Button.
//       ElevatedButton(
//         onPressed: () {
//           // Navigates to the WithdrawScreen when pressed.
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => const WithdrawScreen()),
//           );
//         },
//         style: ElevatedButton.styleFrom(
//           padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30), // Padding inside the button.
//           textStyle: const TextStyle(fontSize: 18), // Text style for the button.
//         ),
//         child: const Text('Withdraw'), // Button label.
//       ),
//     ],
//   );
// }