import 'package:flutter/material.dart';
import 'create_package.dart'; // Import CreatePackagePage
import '../model/service.dart';
import '../model/package.dart';
import '../widget/PackageOptionCard.dart';

class ManagementPackagesPage extends StatelessWidget {
  final List<Service> availableServices = [
    Service(name: 'Photographer', description: 'Discover your perfect shot.', imagePath: 'images/photographer.jpg'),
    Service(name: 'Outdoor Space', description: 'Find the perfect location.', imagePath: 'images/Venues.jpg'),
    Service(name: 'DJs', description: 'Get the best music for your day.', imagePath: 'images/dj.jpg'),
    Service(name: 'Caterers', description: 'Delicious food for your guests.', imagePath: 'images/food.jpg'),
    Service(name: 'Others', description: 'Elevate your wedding with these special additions.', imagePath: 'images/autres.png'),
  ];

  final List<Package> packages = [
    Package(
      imagePath: 'images/her.jpeg',
      title: 'For Her',
      description: 'Includes Photographer, DJ, Dress, Beauty, Hair, Outdoor Space.',
    ),
    Package(
      imagePath: 'images/him.jpeg',
      title: 'For Him',
      description: 'Includes Photographer, DJ, Caterers, Outdoor Space.',
    ),
    Package(
      imagePath: 'images/together.jpeg',
      title: 'For Both',
      description: 'Includes all services for both Bride and Groom.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Packages'),
        backgroundColor: Colors.pink[100],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/backg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemCount: packages.length,
          itemBuilder: (context, index) {
            final package = packages[index];
            return ListTile(
              title: Text(package.title),
              subtitle: Text(package.description),
              leading: Image.asset(package.imagePath),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      // Handle update package logic
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      // Handle delete package logic
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreatePackagePage(availableServices: availableServices)),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
