import 'package:flutter/material.dart';
import 'view/services.dart';
import 'view/packages.dart';
import 'view/login.dart';
import 'view/forgot_password.dart';
import 'view/management_packages.dart';
import 'model/Service.dart';
import 'package:firebase_core/firebase_core.dart'; // Importez Firebase Core

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialisez Firebase
  runApp(WeddingPlanApp());
}

class WeddingPlanApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Liste des services accessibles depuis le bouton "Get Started"
    final List<Service> services = [
      Service(name: 'Photographer', description: 'Discover your perfect shot.', imagePath: 'images/photographer.jpg'),
      Service(name: 'Outdoor Space', description: 'Find the perfect location.', imagePath: 'images/Venues.jpg'),
      Service(name: 'DJs', description: 'Get the best music for your day.', imagePath: 'images/dj.jpg'),
      Service(name: 'Decoration', description: 'Stunning décor to transform your venue.', imagePath: 'images/deco.jpg'),
      Service(name: 'Caterers', description: 'Delicious food for your guests.', imagePath: 'images/food.jpg'),
      Service(name: 'Sweet Treats', description: 'Delight your guests with delectable pastries and refreshing drinks.', imagePath: 'images/sucrés.jpg'),
      Service(name: 'Spa', description: 'Luxurious relaxation for your big day.', imagePath: 'images/spawed.jpg'),
      Service(name: 'Dress', description: 'Find the perfect dress to make your day unforgettable.', imagePath: 'images/dress.jpg'),
      Service(name: 'Groom Attire', description: 'Elegant suits for the distinguished groom.', imagePath: 'images/GroomAttire.jpg'),
      Service(name: 'Bridal Makeup', description: 'Flawless makeup to enhance your bridal beauty.', imagePath: 'images/makeup.jpg'),
      Service(name: 'Groom Hairstyling', description: 'Stylish haircuts for the groom.', imagePath: 'images/coiffeur.jpg'),
      Service(name: 'Wedding Invitations', description: 'Beautifully crafted invitations for your special day.', imagePath: 'images/card.jpg'),
      Service(name: 'Honeymoon', description: 'Plan the perfect romantic getaway for your honeymoon.', imagePath: 'images/honeymoon.jpg'),
      Service(name: 'Others', description: 'Elevate your wedding with these special additions.', imagePath: 'images/autres.png'),
    ];

    // Liste des packages accessibles depuis le bouton "Packages"
    final List<Service> packages = [
      Service(
        imagePath: 'images/her.jpg',
        name: 'For Her',
        description: 'Includes Photographer, DJ, Dress, Beauty, Hair, Outdoor Space. ',
      ),
      Service(
        imagePath: 'images/him.jpg',
        name: 'For Him',
        description: 'Includes Photographer, DJ, Caterers, Outdoor Space.',
      ),
      Service(
        imagePath: 'images/together.jpeg',
        name: 'For Both',
        description: 'Includes all services for both Bride and Groom.',
      ),
    ];

    return MaterialApp(
      title: 'WeddingPlan',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainPage(services: services, packages: packages),
      routes: {
        '/services': (context) => ServicesPage(services: services),
        '/packages': (context) => PackagesPage(packages: packages),
        '/login': (context) => LoginPage(),
        '/forgot_password': (context) => ForgotPasswordPage(),
        '/management_packages': (context) => ManagementPackagesPage(),
      },
    );
  }
}

class MainPage extends StatefulWidget {
  final List<Service> services;
  final List<Service> packages;

  MainPage({required this.services, required this.packages});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  List<Widget> _pages(BuildContext context) {
    return [
      IntroPage(services: widget.services),
      ServicesPage(services: widget.services),
      PackagesPage(packages: widget.packages),
      LoginPage(),
      ManagementPackagesPage(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages(context)[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_camera),
            label: 'Services',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Packages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.login),
            label: 'Login',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.admin_panel_settings),
            label: 'Admin',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.pink[800],
        unselectedItemColor: Colors.pink[200],
        onTap: _onItemTapped,
      ),
    );
  }
}

class IntroPage extends StatelessWidget {
  final List<Service> services;

  IntroPage({required this.services});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WeddingPlan'),
        backgroundColor: Colors.pink[100],
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/weddingphoto.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Your Dream Wedding, Perfectly Planned',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    backgroundColor: Colors.black54,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
