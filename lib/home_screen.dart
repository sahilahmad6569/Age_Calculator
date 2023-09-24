import 'package:flutter/material.dart';
import 'display.dart';
import 'calculate.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  bool _showAgeResult = false;

  void _calculateAge(BuildContext context) {
    String name = _nameController.text.trim();
    String dateStr = _dateController.text.trim();

    if (name.isNotEmpty && dateStr.isNotEmpty) {
      int age = AgeCalculator.calculateAge(dateStr);
      if (age != -1) {
        _navigateToDisplay(context, name, age);
      } else {
        _showErrorDialog(
            context, 'Invalid date format. Please use dd/mm/yyyy.');
      }
    } else {
      _showErrorDialog(context, 'Please enter your name and birth date.');
    }
  }

  void _navigateToDisplay(BuildContext context, String name, int age) async {
    setState(() {
      _showAgeResult = true;
    });

    await Future.delayed(Duration(milliseconds: 500));

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Display(
          name: name,
          age: age,
        ),
      ),
    );

    setState(() {
      _showAgeResult = false;
    });
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Age Calculator"),
        backgroundColor: Colors.deepPurple, // Change the color of the app bar
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20), // Add some spacing at the top
              Hero(
                tag: 'pattern',
                child: Image.asset(
                  "assets/images/pattern.gif",
                  height: 200, // Change the size of the gif image
                ),
              ),
              SizedBox(
                  height: 20), // Add some spacing between image and text fields
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: _nameController,
                  style: TextStyle(
                    color: Colors.white,
                  ), // Change the color of the text field text
                  decoration: InputDecoration(
                    labelText: 'Enter your name',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white, // Custom border color
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white, // Custom border color
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors
                            .deepPurple, // Custom border color when the field is focused
                      ),
                    ),
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ), // Change the color of the label
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: _dateController,
                  style: TextStyle(
                    color: Colors.white,
                  ), // Change the color of the text field text
                  decoration: InputDecoration(
                    labelText: 'Enter your birth date (dd/mm/yyyy)',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white, // Custom border color
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white, // Custom border color
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors
                            .deepPurple, // Custom border color when the field is focused
                      ),
                    ),
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ), // Change the color of the label
                  ),
                ),
              ),
              SizedBox(
                  height:
                      20), // Add some spacing between text fields and button
              ElevatedButton(
                onPressed: () => _calculateAge(context),
                style: ElevatedButton.styleFrom(
                  primary: Colors
                      .deepPurple, // Change the color of the elevated button
                  textStyle: TextStyle(
                    color: Colors.white, // Change the color of the button text
                  ),
                  elevation: 4, // Add a subtle elevation effect
                ),
                child: _showAgeResult
                    ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      )
                    : Text('Calculate'),
              ),
              SizedBox(height: 20), // Add some spacing at the bottom
            ],
          ),
        ),
      ),
    );
  }
}
