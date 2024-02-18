import 'package:flutter/material.dart';

class InformationScreen extends StatelessWidget {
  final String category;

  InformationScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Blood Pressure Information',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      backgroundColor: Color(0xFF6600FF),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Category: $category',
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Back to Input',
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
