import 'package:flutter/material.dart';
import '../model/Service.dart';
import '../widget/PackageOptionCard.dart';
import 'reserve_package.dart'; // Import the ReservePackagePage

class PackagesPage extends StatelessWidget {
  final List<Service> packages;

  PackagesPage({required this.packages});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dream Wedding Packages'),
        backgroundColor: Colors.pink[100],
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/backg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(
                      'Choose the Perfect Package for Your Special Day',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4E4A4E),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 20),
                  ...packages.map((package) {
                    return PackageOptionCard(
                      imagePath: package.imagePath,
                      title: package.name,
                      description: package.description,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ReservePackagePage(service: package)), // Navigate to ReservePackagePage
                        );
                      },
                    );
                  }).toList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
