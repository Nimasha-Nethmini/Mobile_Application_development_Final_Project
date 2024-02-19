import 'package:flutter/material.dart'; // Import the material package
import 'calculator_page.dart';// Import the calculator_page.dart file
import 'information_page.dart';// Import the information_page.dart file

void main() {
  runApp(const MyApp()); // Run the application with MyApp as the root widget
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Constructor for MyApp widget

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Disable debug banner
      title: 'BMI Calculator', // Set the title of the app
      home: Container(
        width: 600, // Set the width of the page
        height: 600, // Set the height of the page
        color:
            const Color.fromARGB(255, 19, 19, 19), // Set the color of the page
        child: const HomeScreen(), // Set HomeScreen as the child widget
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key}); // Constructor for HomeScreen widget

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Disable debug banner
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'BMI Calculator', // Set the title of the app bar
              style: TextStyle(
                fontWeight: FontWeight.bold, // Make the text bold
              ),
            ),
            centerTitle: true, // Center align the title
          ),
          backgroundColor: const Color.fromARGB(
              255, 185, 220, 248), // Set the background color of the Scaffold
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 50.0),
                    child: Image.asset(
                      'images/BMI.jpg', // Provide the path to your image asset
                      width: 350, // Adjust the width of the image
                      height: 350, // Adjust the height of the image
                    ),
                  ),
                ),
              ),
            ],
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(left: 100.0, bottom: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const CalculatorPage()), // Navigate to CalculatorPage
                    );
                  },
                  backgroundColor:
                      Colors.blue, // Background color of the button
                  tooltip: 'BMI Calculator', // Tooltip for the button
                  child: const Icon(
                    Icons.calculate, // Use the calculator icon
                    size: 40, // Adjust the size of the icon
                  ), // Add tooltip
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 100.0, bottom: 6.0),
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const InformationPage()), // Navigate to InformationPage
                      );
                    },
                    backgroundColor:
                        Colors.blue, // Background color of the button
                    tooltip: 'Information', // Tooltip for the button
                    child: const Icon(
                      Icons.info_outline, // Use the information icon
                      size: 40, // Adjust the size of the icon
                    ), // Add tooltip
                  ),
                ),
              ],
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        ),
      ),
    );
  }
}
