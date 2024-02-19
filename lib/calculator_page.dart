import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key}); // Constructor for CalculatorPage widget

  @override
  // ignore: library_private_types_in_public_api
  _CalculatorPageState createState() =>
      _CalculatorPageState(); // Create state for CalculatorPage
}

class _CalculatorPageState extends State<CalculatorPage> {
  TextEditingController heightController =
      TextEditingController(); // Controller for height input field
  TextEditingController weightController =
      TextEditingController(); // Controller for weight input field
  double bmiResult = 0.0; // Initialize bmiResult with a default value

  // Function to calculate BMI
  void calculateBMI() {
    double height =
        double.parse(heightController.text); // Parse height input to double
    double weight =
        double.parse(weightController.text); // Parse weight input to double
    double heightInMeters = height / 100; // Convert height to meters
    setState(() {
      bmiResult = weight / (heightInMeters * heightInMeters); // Calculate BMI
    });
  }

  // Function to determine BMI category
  String getCategory(double bmi) {
    if (bmi < 16) {
      return 'Severe undernourishment';
    } else if (bmi >= 16 && bmi < 17) {
      return 'Medium undernourishment';
    } else if (bmi >= 17 && bmi < 18.5) {
      return 'Slight undernourishment';
    } else if (bmi >= 18.5 && bmi < 25) {
      return 'Normal nutrition state';
    } else if (bmi >= 25 && bmi < 30) {
      return 'Overweight';
    } else if (bmi >= 30 && bmi < 40) {
      return 'Obesity';
    } else {
      return 'Pathological obesity';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color of scaffold
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(
            255, 185, 220, 248), // Set background color of app bar
        title: const Text('BMI Calculator'), // Set title of app bar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller:
                  heightController, // Set controller for height input field
              keyboardType: TextInputType.number, // Set keyboard type to number
              decoration: const InputDecoration(
                labelText: 'Height (cm)', // Label for height input field
                suffixText:
                    'Please enter as centimeter', // Suffix text for height input field
              ),
            ),
            const SizedBox(height: 50), // Empty space
            TextField(
              controller:
                  weightController, // Set controller for weight input field
              keyboardType: TextInputType.number, // Set keyboard type to number
              decoration: const InputDecoration(
                labelText: 'Weight (kg)', // Label for weight input field
                suffixText:
                    'Please enter as kilogram', // Suffix text for weight input field
              ),
            ),
            const SizedBox(height: 50), // Empty space
            ElevatedButton(
              onPressed: () {
                calculateBMI(); // Call function to calculate BMI when button is pressed
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(
                    255, 98, 140, 228), // Change the button background color
              ),
              child: const Text(
                'Calculate BMI', // Text for button
                style: TextStyle(color: Colors.white), // Change font color
              ),
            ),
            const SizedBox(height: 20), // Empty space
            Text(
              'Your BMI: ${bmiResult.toStringAsFixed(2)}', // Display BMI result
              style: const TextStyle(fontSize: 20), // Set font size
            ),
            const SizedBox(height: 20), // Empty space
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('BMI Category'), // Dialog title
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'Category: ${getCategory(bmiResult)}'), // Display BMI category
                        ],
                      ),
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(
                    255, 98, 140, 228), // Change the button background color
              ),
              child: const Text(
                'Category', // Text for button
                style: TextStyle(color: Colors.white), // Change font color
              ),
            ),
            const SizedBox(height: 20), // Empty space
            Image.asset(
              'images/mass.png', // Path to image asset
              width: 200, // Adjust the width of the image
              height: 200, // Adjust the height of the image
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: CalculatorPage(), // Set CalculatorPage as the home page of the app
  ));
}
