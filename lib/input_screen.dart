import 'package:flutter/material.dart';
import 'information_screen.dart';

class InputScreen extends StatelessWidget {
  final TextEditingController systolicController = TextEditingController();
  final TextEditingController diastolicController = TextEditingController();

  void validateAndNavigate(BuildContext context) {
    final double systolic = double.tryParse(systolicController.text) ?? 0;
    final double diastolic = double.tryParse(diastolicController.text) ?? 0;

    if (systolic >= 0 && diastolic >= 0) {
      String category = determineCategory(systolic, diastolic);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => InformationScreen(category: category),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Invalid Data', style: TextStyle(color: Colors.white)),
            backgroundColor: Color(0xFF000066),
            content: Text('Please enter valid systolic and diastolic values.', style: TextStyle(color: Colors.white)),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK', style: TextStyle(color: Colors.white)),
              ),
            ],
          );
        },
      );
    }
  }

  String determineCategory(double systolic, double diastolic) {
    if (systolic < 120 && diastolic < 80) {
      return 'Normal';
    } else if (systolic >= 120 && systolic <= 129 && diastolic < 80) {
      return 'Elevated';
    } else if ((systolic >= 130 && systolic <= 139) || (diastolic >= 80 && diastolic <= 89)) {
      return 'Hypertension Stage 1';
    } else if (systolic >= 140 || diastolic >= 90) {
      return 'Hypertension Stage 2';
    } else {
      return 'Hypertensive Crisis! high blood pressure requires medical attention';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Blood Pressure Monitor',
          style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromRGBO(0, 0, 0, 1)),
        ),
      ),
      backgroundColor: Color(0xFF000066),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: systolicController,
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                labelText: 'Systolic',
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: diastolicController,
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                labelText: 'Diastolic',
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => validateAndNavigate(context),
              child: Text(
                'Show Info',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFFF9933)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
