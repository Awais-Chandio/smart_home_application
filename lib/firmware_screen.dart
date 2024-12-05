// import 'package:flutter/material.dart';

// class FirmwareUpdatesScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Firmware Updates', style: TextStyle(color: Colors.white)),
//         backgroundColor: Colors.grey[800],
//       ),
//       body: Center(
//         child: Text(
//           'Firmware Update Functionality Coming Soon!',
//           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class FirmwareUpdatesScreen extends StatefulWidget {
  @override
  _FirmwareUpdatesScreenState createState() => _FirmwareUpdatesScreenState();
}

class _FirmwareUpdatesScreenState extends State<FirmwareUpdatesScreen> {
  // Sample firmware updates
  List<Map<String, dynamic>> firmwareUpdates = [
    {"version": "1.0.0", "description": "Initial release", "isAvailable": false},
    {"version": "1.1.0", "description": "Bug fixes and performance improvements", "isAvailable": true},
    {"version": "1.2.0", "description": "New features and enhancements", "isAvailable": false},
  ];

  // Check for firmware updates
  void _checkForUpdates() {
    // In a real app, implement the logic to check for updates
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Checking for firmware updates...')),
    );
  }

  // Initiate firmware update
  void _initiateUpdate(String version) {
    // In a real app, implement the logic to initiate the update
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Updating to firmware version $version...')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firmware Updates', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.grey[800],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.grey[800]!, Colors.black87],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            // Check for updates button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: _checkForUpdates,
                child: Text('Check for Updates'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: firmwareUpdates.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    color: Colors.black87,
                    child: ListTile(
                      title: Text(
                        'Version: ${firmwareUpdates[index]['version']}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        firmwareUpdates[index]['description'],
                        style: TextStyle(color: Colors.white70),
                      ),
                      trailing: firmwareUpdates[index]['isAvailable']
                          ? ElevatedButton(
                              onPressed: () => _initiateUpdate(firmwareUpdates[index]['version']),
                              child: Text('Update'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.greenAccent,
                              ),
                            )
                          : SizedBox.shrink(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

