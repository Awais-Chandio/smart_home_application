

// import 'dart:io' as io;
// import 'package:flutter/foundation.dart' show kIsWeb;
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:torch_light/torch_light.dart';
// import 'package:permission_handler/permission_handler.dart';

// class LightControlScreen extends StatefulWidget {
//   @override
//   _LightControlScreenState createState() => _LightControlScreenState();
// }

// class _LightControlScreenState extends State<LightControlScreen> {
//   final CollectionReference _lightsCollection =
//       FirebaseFirestore.instance.collection('lights');

//   List<Map<String, dynamic>> _lights = [];
//   bool _torchEnabled = false; // Track torch state

//   @override
//   void initState() {
//     super.initState();
//     _getLights(); // Fetch lights on init
//     _requestCameraPermission(); // Request camera permission
//   }

//   // Request camera permission
//   Future<void> _requestCameraPermission() async {
//     var status = await Permission.camera.status;
//     if (!status.isGranted) {
//       // Request camera permission if not granted
//       await Permission.camera.request();
//     }
//   }

//   // Fetch lights from Firestore
//   Future<void> _getLights() async {
//     try {
//       final snapshot = await _lightsCollection.get();
//       setState(() {
//         _lights = snapshot.docs.map((doc) {

//           final data = doc.data() as Map<String, dynamic>;

//           return {
//             'id': doc.id,
//             'isOn': data['isOn'] ?? false, // Default to false if not present
//           };
//         }).toList();
//       });
//     } catch (e) {
//       print("Error fetching lights: $e");
//     }
//   }

//   // Update Firestore for a light
//   Future<void> _updateLightState(String lightId, bool isOn) async {
//     await _lightsCollection.doc(lightId).set({
//       'isOn': isOn,
//     });
//     print('Updated light $lightId: isOn=$isOn'); // Debugging
//   }

//   // Toggle a specific light
//   void _toggleLight(int index) async {
//     setState(() {
//       _lights[index]['isOn'] = !_lights[index]['isOn'];
//       _torchEnabled = _lights[index]['isOn']; // Update torch state
//     });

//     await _updateLightState(
//       _lights[index]['id'],
//       _lights[index]['isOn'],
//     );

//     // Enable or disable the torch based on platform
//     if (!kIsWeb && (io.Platform.isAndroid || io.Platform.isIOS)) {
//       if (_torchEnabled) {
//         await TorchLight.enableTorch(); // Turn on the flashlight
//       } else {
//         await TorchLight.disableTorch(); // Turn off the flashlight
//       }
//     } else {
//       print('Torchlight is not supported on this platform');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Control Lighting'),
//         backgroundColor: Colors.teal[400],
//       ),
//       body: Container(
//         color: Colors.black, // Set background to black
//         padding: const EdgeInsets.all(16.0),
//         child: _lights.isEmpty
//             ? Center(child: CircularProgressIndicator())
//             : Center(
//                 child: Card(
//                   margin: const EdgeInsets.symmetric(vertical: 8.0),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(15.0),
//                   ),
//                   elevation: 8,
//                   color: Colors.grey[850], // Card background color
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min, // Center the light
//                       children: [
//                         Text(
//                           'Torch',
//                           style: TextStyle(
//                               fontSize: 24,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.teal[300]),
//                         ),
//                         SizedBox(height: 10),
//                         GestureDetector(
//                           onTap: () => _toggleLight(0), // Only handle the first light
//                           child: Container(
//                             width: 120,
//                             height: 120,
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               color: _lights[0]['isOn']
//                                   ? Colors.yellow
//                                   : Colors.grey[700],
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: _lights[0]['isOn']
//                                       ? Colors.yellow
//                                       : Colors.grey,
//                                   blurRadius: 15,
//                                   spreadRadius: 1,
//                                 ),
//                               ],
//                             ),
//                             child: Center(
//                               child: FaIcon(
//                                 FontAwesomeIcons.lightbulb,
//                                 color: _lights[0]['isOn']
//                                     ? Colors.white
//                                     : Colors.black,
//                                 size: 50,
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 10),
//                         Text(
//                           'Status: ${_lights[0]['isOn'] ? "ON" : "OFF"}',
//                           style: TextStyle(
//                             fontSize: 20,
//                             color: _lights[0]['isOn']
//                                 ? Colors.white
//                                 : Colors.red, // White for ON
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           setState(() {
//             _torchEnabled = false;
//             _updateLightState(_lights[0]['id'], false);
//             _lights[0]['isOn'] = false; // Turn off the light
//           });
//           TorchLight.disableTorch(); // Ensure the torch is off
//         },
//         child: Icon(Icons.power_settings_new),
//         backgroundColor: Colors.red,
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SmartHomeControlScreen extends StatefulWidget {
  @override
  _SmartHomeControlScreenState createState() => _SmartHomeControlScreenState();
}

class _SmartHomeControlScreenState extends State<SmartHomeControlScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Smart Home Control',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal.shade700,
        elevation: 5,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal.shade700, Colors.blueGrey.shade900],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildFeatureCard(
                title: "Room Temperature",
                subtitle: "22°C - Living Room",
                icon: FontAwesomeIcons.thermometerHalf,
                color: Colors.orange.shade300,
                onTap: () {
                  // Navigate to temperature details screen
                },
              ),
              SizedBox(height: 16),
              _buildFeatureCard(
                title: "Security Status",
                subtitle: "All Secure",
                icon: FontAwesomeIcons.shieldAlt,
                color: Colors.green.shade300,
                onTap: () {
                  // Navigate to security status screen
                },
              ),
              SizedBox(height: 16),
              _buildFeatureCard(
                title: "Connected Devices",
                subtitle: "5 Active Devices",
                icon: FontAwesomeIcons.wifi,
                color: Colors.blue.shade300,
                onTap: () {
                  // Navigate to connected devices screen
                },
              ),
              SizedBox(height: 16),
              _buildFeatureCard(
                title: "Energy Usage",
                subtitle: "Monthly Usage: 320 kWh",
                icon: FontAwesomeIcons.bolt,
                color: Colors.yellow.shade300,
                onTap: () {
                  // Navigate to energy usage screen
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 8,
        color: Colors.grey.shade800,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: color,
                child: FaIcon(
                  icon,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 14, color: Colors.white70),
                  ),
                ],
              ),
              Spacer(),
              Icon(Icons.arrow_forward_ios, color: Colors.white70, size: 20),
            ],
          ),
        ),
      ),
    );
  }
}
