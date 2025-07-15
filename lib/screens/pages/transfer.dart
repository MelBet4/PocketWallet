//Importing the necessary packages
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp()); // Start the app
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Money Transfer App',
      theme: ThemeData(
        primarySwatch: Colors.blue, // Set the app's theme color
      ),
      home: const TransferPage(), // Set the home page to TransferPage
    );
  }
}

class TransferPage extends StatefulWidget {
  const TransferPage({super.key});

  @override
  _TransferPageState createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  int _currentPage = 0;  // Tracks the current page (0 = Search, 1 = Confirmation, 2 = Success)
  final _formKey = GlobalKey<FormState>(); //For form key
  final _pinFormKey = GlobalKey<FormState>(); //For pin form key
  final TextEditingController _recipientController = TextEditingController(); //For recipient input
  final TextEditingController _amountController = TextEditingController(); //For amount input
  final TextEditingController _pinController = TextEditingController(); //For PIN   input
  String _selectedMethod = 'Bank Transfer'; //For selected method
  bool _isFavorite = false; //For favorite
  // ignore: unused_field
  bool _showSuccess = false; //For success
  bool _isProcessing = false; //track if the transfer is being processed
  String recipientName = ''; //Store recipient name
  String amount = ''; //Store amount

  @override
  void dispose() {
    // Clean up controllers when the widget is removed
    _recipientController.dispose();
    _amountController.dispose();
    _pinController.dispose();
    super.dispose();
  }

  //Navigate to the next page
  void _goToNextPage() {
    setState(() {
      if (_currentPage < 2) {
        _currentPage++; // Move to the next page
      }
    });
  }

  //Navigate to the previous page
  void _goToPreviousPage() {
    setState(() {
      if (_currentPage > 0) {
        _currentPage--; // Move to the previous page
      }
    });
  }

  //Submit the details
  //Validate recipient name and amount
  void _submitDetails() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        recipientName = _recipientController.text.trim();
        amount = _amountController.text.trim();
      });
      _goToNextPage();
    }
  }

  //Submit and validate the PIN
  void _submitPin() async {
    if (_pinFormKey.currentState!.validate()) {
      setState(() {
        _isProcessing = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      setState(() {
        _isProcessing = false;
      });
      _goToNextPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF001F3F),
      appBar: AppBar(
        title: const Text('Transfer Money', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.orange,
        iconTheme: const IconThemeData(color: Colors.white),
        leading: _currentPage > 0
            ? IconButton(
                //back button to go back to home page
                icon: const Icon(Icons.arrow_back, color: Colors.white), 
                onPressed: _goToPreviousPage,
              )
            : null, //if the current page is 0, don't show the back button
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500), //animation duration
        child: _buildPage(_currentPage), //build the current page
      ),
    );
  }

  Widget _buildPage(int page) {
    switch (page) {
      case 0:
        return _buildDetailsForm(); //First screen: Recipient name and amount
      case 1:
        return _buildPinForm(); //Second screen: PIN
      case 2:
        return _buildSuccessScreen();
      default:
        return const Center(child: Text('Invalid page')); // Fallback for invalid page
    }
  }

  //First screen: Recipient name and amount
  Widget _buildDetailsForm() {
    return Padding( //add padding around the form
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, //align content to the left
          children: [
            //Recipient input field
            TextFormField(
              controller: _recipientController, //controller for the recipient input field linked to the TextEditingController
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration( //decoration for the recipient input field
                labelText: 'Recipient Name',
                labelStyle: const TextStyle(color: Colors.white70),
                filled: true, //filled with color
                fillColor: Colors.blue[700], //fill color
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                ),
                //focused border for the recipient input field (turns orange when focused)
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.orange),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              //validator for the recipient input field
              validator: (value) {
                //check if the recipient name is empty
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter recipient name';
                }
                //check if the recipient name is valid
                if (value.length < 3) {
                  return 'Recipient name must be at least 3 characters';
                }
                return null; 
              },
            ),
            const SizedBox(height: 20), //spacing between the recipient input field and the amount input field

            //Amount input field
            TextFormField(
              controller: _amountController, //link to amount controller
              keyboardType: TextInputType.number, //numeric keyboard
              style: const TextStyle(color: Colors.white), //text style
              decoration: InputDecoration( //decoration for the amount input field
                labelText: 'Amount',
                labelStyle: const TextStyle(color: Colors.white70),
                filled: true,
                fillColor: Colors.blue[700],
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                ),
                //focused border for the amount input field (turns orange when focused)
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.orange),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              //validator for the amount input field
              validator: (value) {
                //check if the amount is empty
                if (value == null || value.trim().isEmpty) { 
                  return 'Please enter amount';
                }
                //check if the amount is a valid number
                final num? amount = num.tryParse(value);
                //check if the amount is a valid positive number
                if (amount == null || amount <= 0) {
                  return 'Enter a valid positive number';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),

            //Dropdown menu for the transfer method - Bank Transfer, Mobile Money, Crypto Wallet
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.blue[700],
                borderRadius: BorderRadius.circular(10),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>( 
                  value: _selectedMethod, 
                  dropdownColor: Colors.blue[700],
                  icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                  //items for the dropdown menu
                  items: ['Bank Transfer', 'Mobile Money', 'Crypto Wallet'].map((String value) {
                    return DropdownMenuItem<String>( 
                      value: value, 
                      child: Text(value, style: const TextStyle(color: Colors.white)), 
                    );
                  }).toList(), 
                  //onChanged for the dropdown menu
                  onChanged: (newValue) { 
                    setState(() {
                      _selectedMethod = newValue!; //update the selected method
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),

            //set favourite switch
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, //space between the text and the switch
              children: [
                const Text('Mark as Favorite', style: TextStyle(color: Colors.white70)),
                Switch( 
                  value: _isFavorite, 
                  activeColor: Colors.orange, //color of the switch when it is on
                  onChanged: (val) {
                    setState(() {
                      _isFavorite = val; //update the favourite switch
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 30),

            //Continue button
            Center(
              child: SendMoneyButton(
                onPressed: _submitDetails,
                text: 'Continue',
              ), //move to the PIN screen
            ),
          ],
        ),
      ),
    );
  }

  //Second screen: Confirmation and PIN
  Widget _buildPinForm() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _pinFormKey, //form key for the PIN screen
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Display the recipient name and amount
            ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.orangeAccent,
                child: Icon(Icons.person, color: Colors.white),
              ),
              title: Text(
                recipientName,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              subtitle: Text(
                'Amount: $amount',
                style: const TextStyle(fontSize: 16, color: Colors.white70),
              ),
              //Display the selected method
              trailing: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.blue[700],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(_selectedMethod, style: const TextStyle(color: Colors.white)),
              ),
            ),
            const SizedBox(height: 30),

            //PIN input field
            TextFormField(
              controller: _pinController, //link to the PIN controller
              obscureText: true, //hide the PIN
              keyboardType: TextInputType.number, //numeric keyboard
              style: const TextStyle(color: Colors.white), 
              decoration: InputDecoration(
                //decoration for PIN input field
                labelText: 'Enter PIN', 
                labelStyle: const TextStyle(color: Colors.white70),
                filled: true,
                fillColor: Colors.blue[700],
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.orange),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              //validator for the PIN input field
              validator: (value) {
                //check if the PIN is empty
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter PIN';
                } 
                //check if the PIN is 4 digits
                if (value.length != 4 || int.tryParse(value) == null) { 
                  return 'PIN must be 4 digits';
                }
                //check if the PIN is a valid number
                return null;
              },
            ),
            const SizedBox(height: 30),

            Center(
              child: _isProcessing
                  //show a loading indicator if the transfer is being processed
                  ? const CircularProgressIndicator(color: Colors.orange)
                  : SendMoneyButton(
                      onPressed: _submitPin,
                      text: 'Send',
                    ), //submit the PIN, move to the success screen
            ),
          ],
        ),
      ),
    );
  }

  //Success screen
  Widget _buildSuccessScreen() {
    return Center(
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0.7, end: 1.0),
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOutBack,
        builder: (context, scale, child) {
          return Transform.scale(
            scale: scale,
            child: child,
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, color: Colors.greenAccent, size: 80),
            const SizedBox(height: 20),
            Text(
              'Success! $amount sent to $recipientName',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 30),
            SendMoneyButton(
              onPressed: () {
                setState(() {
                  _currentPage = 0;
                  _recipientController.clear();
                  _amountController.clear();
                  _pinController.clear();
                  _selectedMethod = 'Bank Transfer';
                  _isFavorite = false;
                  _showSuccess = false;
                });
              },
              text: 'Done',
            ),
          ],
        ),
      ),
    );
  }
}

// Custom reusable button widget for sending money
class SendMoneyButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const SendMoneyButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 18)),
      ),
    );
  }
}