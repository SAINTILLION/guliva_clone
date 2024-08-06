import 'package:flutter/material.dart';

class VehiclePassengerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset(
            'assets/guliva_logo.png',
            height: 40,
          ),
          elevation: 0,
          bottom: const TabBar(
            labelPadding: EdgeInsets.symmetric(horizontal: 16.0),
            tabs: [
              Tab(text: 'Vehicles'),
              Tab(text: 'Passengers'),
            ],
          ),
        ),
        body: Column(
          children: [
            Text("kkk"),
            TabBarView(
              children: [
                VehiclesTab(),
                PassengersTab(), // You can implement this similar to VehiclesTab
              ],
            ),
          ],
        ),
       
      ),
    );
  }
}

class VehiclesTab extends StatelessWidget {
  final List<Map<String, String>> vehicles = [
    {'name': 'Toyota', 'id': '4yuuij8', 'image': 'assets/toyota.png'},
    {'name': 'Honda', 'id': 'FIJSIFI', 'image': 'assets/honda.png'},
    {'name': 'Benz', 'id': 'SDGR77', 'image': 'assets/benz.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: vehicles.length,
      itemBuilder: (context, index) {
        final vehicle = vehicles[index];
        return Card(
          margin: EdgeInsets.all(8),
          child: ListTile(
            leading: Image.asset(
              vehicle['image']!,
              height: 40,
              width: 40,
            ),
            title: Text(vehicle['name']!),
            subtitle: Text(vehicle['id']!),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              // Handle vehicle tap
            },
          ),
        );
      },
    );
  }
}

class PassengersTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Passengers tab content goes here'),
    );
  }
}
