import 'package:flutter/material.dart';
import '../model/Service.dart'; // Import correct du fichier Service.dart

class ReservePackagePage extends StatelessWidget {
  final Service service;

  ReservePackagePage({required this.service});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(service.name),
        backgroundColor: Colors.pink[100],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(service.imagePath),
            SizedBox(height: 20),
            Text(
              service.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              service.description,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add functionality to handle reserving the package
              },
              child: Text('Reserve this Package'),
            ),
          ],
        ),
      ),
    );
  }
}
