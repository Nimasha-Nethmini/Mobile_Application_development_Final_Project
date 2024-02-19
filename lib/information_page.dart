import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp()); // Run the app with MyApp as the root widget
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Constructor for MyApp widget

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Information', // Set the title of the app
      theme: ThemeData(
        primarySwatch: Colors.blue, // Set the primary color theme
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const InformationPage(), // Set InformationPage as the home page
    );
  }
}

class InformationPage extends StatelessWidget {
  const InformationPage({super.key}); // Constructor for InformationPage widget

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set the background color of the scaffold
      appBar: AppBar(
        title: const Text('Information'), // Set the title of the app bar
        backgroundColor: const Color.fromARGB(
            255, 185, 220, 248), // Set the background color of the app bar
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image at the top
            Image.asset(
              'images/index.png', // Path to the image asset
              height: 200, // Adjust the height as needed
              width: double.infinity, // Adjust the fit as needed
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'BMI Chart', // Title for the section
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight:
                            FontWeight.bold), // Set font size and weight
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Image.asset(
                    'images/table.png', // Path to the image asset
                    height: 250, // Adjust the height of the image
                    fit: BoxFit.contain, // Adjust the fit of the image
                  ),
                ],
              ),
            ),
            // Rest of the content (BMI categories)
            _buildCategory(
              title: 'Severe undernourishment', // Title of the category
              description: """
                This category refers to individuals whose BMI falls below 16 kg/m².
                Severe undernourishment indicates a critical deficiency in body weight relative to height, suggesting significant malnutrition.
                People in this category may exhibit severe symptoms of malnutrition, including extreme weight loss, muscle wasting, and potential organ dysfunction.
                Immediate medical attention and nutritional intervention are typically required to address severe undernourishment and prevent further health complications.
              """,
            ),
            _buildCategory(
              title: 'Medium undernourishment',
              description: """
                Individuals falling within the BMI range of 16 to 16.9 kg/m² are classified as having medium undernourishment.
                While not as severe as "severe undernourishment," medium undernourishment still indicates a notable deficiency in body weight relative to height.
                People in this category may experience symptoms such as fatigue, weakness, and compromised immune function due to insufficient nutrition.
                Intervention strategies may include dietary improvements, nutritional supplementation, and medical monitoring to address medium undernourishment and prevent its progression.
              """,
            ),
            _buildCategory(
              title: 'Slight undernourishment',
              description: """
                This category encompasses individuals with BMIs ranging from 17 to 18.4 kg/m².
                Slight undernourishment suggests a mild deficiency in body weight relative to height.
                While not as critical as severe or medium undernourishment, individuals in this category may still be at risk of health issues associated with inadequate nutrition.
                Dietary counseling, nutritional support, and lifestyle modifications may be recommended to address slight undernourishment and promote healthier weight management.
              """,
            ),
            _buildCategory(
              title: 'Normal nutrition state',
              description: """
                The BMI range of 18.5 to 24.9 kg/m² is considered the normal nutrition state.
                Individuals within this range typically have a balanced weight relative to their height, indicating adequate nutrition and a lower risk of weight-related health issues.
                Maintaining a BMI within this range is associated with optimal health outcomes and reduced risk of chronic diseases.
                However, it's essential to note that BMI is just one measure of health, and other factors such as muscle mass, body composition, and overall lifestyle also contribute to overall health and well-being.
              """,
            ),
            _buildCategory(
              title: 'Overweight',
              description: """
                Falling within the BMI range of 25 to 29.9 kg/m² classifies individuals as overweight.
                Overweight individuals have excess body weight relative to their height, which may increase their risk of developing various health conditions such as cardiovascular disease, type 2 diabetes, and certain cancers.
                Weight management strategies, including dietary modifications, regular physical activity, and behavior changes, are typically recommended to reduce the risk of complications associated with being overweight.
              """,
            ),
            _buildCategory(
              title: 'Obesity',
              description: """
                BMI values ranging from 30 to 39.9 kg/m² indicate obesity.
                Obesity is a chronic medical condition characterized by excessive body fat accumulation, which can significantly impact health and increase the risk of numerous diseases and health conditions.
                Individuals with obesity may experience a range of health issues, including hypertension, dyslipidemia, sleep apnea, and joint problems.
                Management of obesity often requires comprehensive interventions, including lifestyle modifications, dietary changes, physical activity, behavioral therapy, and in some cases, medical or surgical interventions.
              """,
            ),
            _buildCategory(
              title: 'Pathological obesity',
              description: """
                This category includes individuals with a BMI exceeding 40 kg/m².
                Pathological obesity represents extreme obesity and is associated with a significantly higher risk of severe health complications and mortality.
                People in this category may experience severe obesity-related health issues such as heart disease, stroke, respiratory problems, and reduced life expectancy.
                Treatment for pathological obesity often involves intensive medical management, including specialized weight loss interventions, close medical monitoring, and, in some cases, bariatric surgery to reduce weight and mitigate associated health risks.
              """,
            ),
          ],
        ),
      ),
    );
  }

  // Function to build a category widget with title and description
  Widget _buildCategory({required String title, required String description}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title, // Title of the category
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold), // Set font size and weight
          ),
          const SizedBox(height: 10), // Empty space
          Text(
            description, // Description of the category
            style: const TextStyle(fontSize: 16), // Set font size
          ),
        ],
      ),
    );
  }
}
