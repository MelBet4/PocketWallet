/// Importing necessary packages and files.
import 'package:flutter/material.dart'; // Flutter's material design package for UI components.
import 'package:my_pocket_wallet/screens/pages/account.dart';
import 'package:my_pocket_wallet/screens/pages/mobile_recharge.dart';
import 'package:my_pocket_wallet/screens/pages/pay_bill.dart'; // Pay the Bill page.
import 'package:my_pocket_wallet/screens/pages/transfer.dart';
import 'package:my_pocket_wallet/screens/pages/withdraw.dart'; // Transfer page.

// Homecontent widget represents the main screen of the app.
class Homecontent extends StatelessWidget {
  const Homecontent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900, // Background color matching the login page.
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900, // Deep blue color for the app bar.
        elevation: 0, // No shadow for the app bar.
        automaticallyImplyLeading: false, // Removes the back arrow from the app bar.
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0), // Horizontal padding for the body.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start of the column.
          children: [
            _upperText(), // Greeting section.
            _materCardSection(), // Card section.
            const SizedBox(height: 30), // Spacing between sections.
            _middleScreenButtons(context), // Grid menu section.
          ],
        ),
      ),
    );
  }

  // Grid Menu Section
  Widget _middleScreenButtons(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 3, // Number of columns in the grid.
        crossAxisSpacing: 15, // Spacing between columns.
        mainAxisSpacing: 15, // Spacing between rows.
        children: [
          // Menu items with icons, labels, and navigation actions.
          _buildMenuItem(
            Icons.account_balance_wallet,
            'Account\nand Card',
            () => Navigator.of(context).push(_fadeRoute(const AccountAndCardPage())),
          ),
          _buildMenuItem(
            Icons.swap_horiz,
            'Transfer',
            () => Navigator.of(context).push(_fadeRoute(const TransferPage())),
          ),
          _buildMenuItem(
            Icons.attach_money,
            'Withdraw',
            () => Navigator.of(context).push(_fadeRoute(const WithdrawPage())),
          ),
          _buildMenuItem(
            Icons.phone_android,
            'Mobile\nrecharge',
            () => Navigator.of(context).push(_fadeRoute(const MobileRechargePage())),
          ),
          _buildMenuItem(
            Icons.receipt,
            'Pay the bill',
            () => Navigator.of(context).push(_fadeRoute(const PayTheBillPage())),
          ),
          // _buildMenuItem(
          //   Icons.credit_card,
          //   'Credit card',
          //   () => Navigator.push(context, MaterialPageRoute(builder: (context) => const CreditCardPage())),
          // ),
          // _buildMenuItem(
          //   Icons.insert_chart,
          //   'Transaction\nreport',
          //   () => Navigator.push(context, MaterialPageRoute(builder: (context) => const TransactionReportPage())),
          // ),
        ],
      ),
    );
  }

  // Fade transition route
  PageRouteBuilder _fadeRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 400),
    );
  }

  // Menu Item Widget (Styled like Login Page)
  Widget _buildMenuItem(IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap, // Action to perform when the item is tapped.
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Center the content vertically.
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.blue.shade800, // Background color matching the login page fields.
            child: Icon(icon, color: Colors.orangeAccent, size: 30), // Orange accent icon.
          ),
          const SizedBox(height: 10), // Spacing between icon and label.
          Text(
            label,
            textAlign: TextAlign.center, // Center the text.
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white70),
          ),
        ],
      ),
    );
  }
}

// Greeting Section
Widget _upperText() {
  return const Padding(
    padding: EdgeInsets.only(top: 20.0), // Padding at the top.
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start.
      children: [
        Text(
          'Good Morning,',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        Text(
          'Gega!',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.orangeAccent),
        ),
        SizedBox(height: 20), // Spacing between texts.
      ],
    ),
  );
}

// Card Section (Styled like Login Page)
Widget _materCardSection() {
  return Container(
    width: double.infinity, // Full width.
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16), // Rounded corners.
      color: Colors.blue.shade800, // Deep blue background (like input fields).
      border: Border.all(color: Colors.orangeAccent, width: 2), // Orange border.
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 10,
          offset: const Offset(0, 10),
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.all(20.0), // Padding inside the container.
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start.
        children: [
          const Text(
            'Gega Smith',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5), // Spacing between texts.
          Text(
            'OverBridge Expert',
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 15), // Spacing between sections.
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between elements.
            children: [
              Text(
                '4756 •••• •••• 9018',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              Text(
                '\$3,469.52',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Align(
            alignment: Alignment.bottomRight, // Align text to the bottom right.
            child: Text(
              'VISA',
              style: TextStyle(
                color: Colors.orangeAccent,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}