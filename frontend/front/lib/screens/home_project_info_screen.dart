import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class HomeProjectInfoScreen extends StatelessWidget {
  const HomeProjectInfoScreen({Key? key}) : super(key: key);
  static const routeName = '/home-project-info';

  final List<Map<String, dynamic>> _projects = const [
    {
      'id': '1',
      'name': 'Solar Farm Initiative',
      'location': 'Mahandi Delta, Odisha',
      'status': 'Active',
      'progress': 0.85,
      'carbonCredits': 1250000,
      'startDate': '2023-01-15',
      'endDate': '2025-12-31',
      'description':
          'Large-scale solar installation project generating renewable energy and carbon credits.',
      'investors': 45,
      'totalValue': 25000000,
      'type': 'Renewable Energy',
      'latLng': LatLng(20.2961, 85.8245),
    },
    {
      'id': '2',
      'name': 'Kutch Conservation',
      'location': 'Gulf of Kutch, Gujrat',
      'status': 'Active',
      'progress': 0.92,
      'carbonCredits': 850000,
      'startDate': '2022-06-01',
      'endDate': '2032-05-31',
      'description':
          'Protecting 500,000 hectares of pristine rainforest from deforestation.',
      'investors': 128,
      'totalValue': 15000000,
      'type': 'Conservation',
      'latLng': LatLng(23.7333, 69.6667),
    },
    // Add more projects as needed
  ];

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Active':
        return Colors.green;
      case 'Planning':
        return Colors.orange;
      case 'Completed':
        return Colors.blue;
      case 'Requested':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Project Info'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: FlutterMap(
              options: MapOptions(
                initialCenter: _projects.isNotEmpty
                    ? _projects[0]['latLng']
                    : LatLng(20, 80),
                initialZoom: 6.0,
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: const ['a', 'b', 'c'],
                ),
                MarkerLayer(
                  markers: _projects.map((project) {
                    return Marker(
                      point: project['latLng'],
                      width: 40,
                      height: 40,
                      child: Icon(
                        Icons.location_on,
                        color: _getStatusColor(project['status']),
                        size: 36,
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: ListView.builder(
              itemCount: _projects.length,
              itemBuilder: (context, index) {
                final project = _projects[index];
                return Card(
                  margin: const EdgeInsets.all(8),
                  color: const Color(0xFF1E1E1E),
                  child: ListTile(
                    title: Text(
                      project['name'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      project['description'],
                      style: const TextStyle(color: Colors.grey),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: _getStatusColor(
                          project['status'],
                        ).withOpacity(0.3),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        project['status'],
                        style: TextStyle(
                          color: _getStatusColor(project['status']),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    onTap: () {
                      // Optionally navigate to detailed project screen
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
