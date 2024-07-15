import 'package:flutter/material.dart';
import '../model/service.dart';

class CreatePackagePage extends StatefulWidget {
  final List<Service> availableServices;

  CreatePackagePage({required this.availableServices});

  @override
  _CreatePackagePageState createState() => _CreatePackagePageState();
}

class _CreatePackagePageState extends State<CreatePackagePage> {
  List<Service> selectedServices = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Package'),
        backgroundColor: Colors.pink[100],
      ),
      body: ListView.builder(
        itemCount: widget.availableServices.length,
        itemBuilder: (context, index) {
          final service = widget.availableServices[index];
          return CheckboxListTile(
            title: Text(service.name),
            subtitle: Text(service.description),
            secondary: Image.asset(service.imagePath),
            value: selectedServices.contains(service),
            onChanged: (bool? checked) {
              setState(() {
                if (checked!) {
                  selectedServices.add(service);
                } else {
                  selectedServices.remove(service);
                }
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Save logic for selected services and navigate back
          Navigator.pop(context, selectedServices);
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
