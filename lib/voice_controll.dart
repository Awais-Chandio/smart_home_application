

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class VoiceControlScreen extends StatefulWidget {
//   @override
//   _VoiceControlScreenState createState() => _VoiceControlScreenState();
// }

// class _VoiceControlScreenState extends State<VoiceControlScreen> {
//   String voiceCommand = "Tap the microphone to give a command";
//   bool isListening = false;

//   // Simulate listening to voice commands (replace with actual voice recognition in a real app)
//   void _simulateVoiceCommand() {
//     setState(() {
//       isListening = !isListening;

//       // Simulating a voice command (in real app, replace with actual speech-to-text recognition)
//       if (isListening) {
//         voiceCommand = "Listening... Please give a command";
//       } else {
//         voiceCommand = "Turn on the living room lights";
//         // Here, we handle the parsed voice command
//         _performAction(voiceCommand);
//       }
//     });
//   }

//   // Perform action based on the voice command
//   void _performAction(String command) {
//     if (command.contains("Turn on the living room lights")) {
//       // Update the light's status to ON in Firestore
//       _updateLightStatus("living_room_light", true);
//     } else if (command.contains("Turn off the living room lights")) {
//       // Update the light's status to OFF in Firestore
//       _updateLightStatus("living_room_light", false);
//     } else {
//       // Handle other commands here (if needed)
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Unrecognized command: $command'),
//           backgroundColor: Colors.redAccent,
//         ),
//       );
//     }
//   }

//   // Function to update light status in Firestore
//   Future<void> _updateLightStatus(String lightId, bool isOn) async {
//     try {
//       await FirebaseFirestore.instance.collection('lights').doc(lightId).set({
//         'status': isOn ? 'ON' : 'OFF',
//       });

//       // Show feedback to the user
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(
//             isOn
//                 ? 'Turning on the living room lights...'
//                 : 'Turning off the living room lights...',
//           ),
//           backgroundColor: Colors.greenAccent,
//         ),
//       );
//     } catch (e) {
//       // Handle Firestore update errors
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Failed to update light status. Error: $e'),
//           backgroundColor: Colors.redAccent,
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Voice Control', style: TextStyle(color: Colors.white)),
//         backgroundColor: Colors.grey[800],
//         elevation: 0,
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.grey[800]!, Colors.black87],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Voice Command Display
//             Container(
//               padding: EdgeInsets.all(20),
//               margin: EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: Colors.black54,
//                 borderRadius: BorderRadius.circular(15),
//                 border: Border.all(color: Colors.blueAccent, width: 2),
//               ),
//               child: Text(
//                 voiceCommand,
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   letterSpacing: 1.2,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//             SizedBox(height: 30),

//             // Microphone Button
//             GestureDetector(
//               onTap: _simulateVoiceCommand,
//               child: Container(
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.blueAccent.withOpacity(0.5),
//                       blurRadius: 10,
//                       spreadRadius: 5,
//                     ),
//                   ],
//                 ),
//                 child: CircleAvatar(
//                   radius: 50,
//                   backgroundColor: isListening ? Colors.redAccent : Colors.blueAccent,
//                   child: Icon(
//                     isListening ? Icons.mic : Icons.mic_none,
//                     color: Colors.white,
//                     size: 50,
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 30),

//             // Action Feedback (Optional)
//             if (!isListening)
//               Text(
//                 'Voice Command: $voiceCommand',
//                 style: TextStyle(color: Colors.greenAccent, fontSize: 16),
//               ),

//             SizedBox(height: 50),

//             // Example Voice-Controlled Actions (placeholders)
//             Expanded(
//               child: GridView.count(
//                 crossAxisCount: 2,
//                 padding: EdgeInsets.all(20),
//                 crossAxisSpacing: 20,
//                 mainAxisSpacing: 20,
//                 children: [
//                   _buildControlCard(Icons.lightbulb, "Control Lights", Colors.orangeAccent),
//                   _buildControlCard(Icons.lock, "Control Security", Colors.greenAccent),
//                   _buildControlCard(Icons.thermostat, "Set Thermostat", Colors.blueAccent),
//                   _buildControlCard(Icons.tv, "Control TV", Colors.purpleAccent),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // Widget for control options (grid cards)
//   Widget _buildControlCard(IconData icon, String label, Color color) {
//     return GestureDetector(
//       onTap: () {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Voice Command: $label activated')),
//         );
//       },
//       child: Card(
//         color: Colors.black87,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(15),
//         ),
//         elevation: 5,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(icon, size: 40, color: color),
//             SizedBox(height: 10),
//             Text(
//               label,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VoiceControlScreen extends StatefulWidget {
  @override
  _VoiceControlScreenState createState() => _VoiceControlScreenState();
}

class _VoiceControlScreenState extends State<VoiceControlScreen> {
  String voiceCommand = "Tap the microphone to give a command";
  bool isListening = false;

  // Simulate listening to voice commands (replace with actual voice recognition in a real app)
  void _simulateVoiceCommand() {
    setState(() {
      isListening = !isListening;

      // Simulating a voice command (in real app, replace with actual speech-to-text recognition)
      if (isListening) {
        voiceCommand = "Listening... Please give a command";
      } else {
        voiceCommand = "Turn on the living room lights";
        // Here, we handle the parsed voice command
        _performAction(voiceCommand);
      }
    });
  }

  // Perform action based on the voice command
  void _performAction(String command) {
    if (command.contains("Turn on the living room lights")) {
      // Handle the command to turn on the light
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Turning on the living room lights...'),
          backgroundColor: Colors.greenAccent,
        ),
      );
    } else if (command.contains("Turn off the living room lights")) {
      // Handle the command to turn off the light
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Turning off the living room lights...'),
          backgroundColor: Colors.redAccent,
        ),
      );
    } else {
      // Handle unrecognized commands
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Unrecognized command: $command'),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Voice Control', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.grey[800],
        elevation: 0,
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Voice Command Display
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.blueAccent, width: 2),
              ),
              child: Text(
                voiceCommand,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 30),

            // Microphone Button
            GestureDetector(
              onTap: _simulateVoiceCommand,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueAccent.withOpacity(0.5),
                      blurRadius: 10,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: isListening ? Colors.redAccent : Colors.blueAccent,
                  child: Icon(
                    isListening ? Icons.mic : Icons.mic_none,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),

            // Action Feedback (Optional)
            if (!isListening)
              Text(
                'Voice Command: $voiceCommand',
                style: TextStyle(color: Colors.greenAccent, fontSize: 16),
              ),

            SizedBox(height: 50),

            // Example Voice-Controlled Actions (placeholders)
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                padding: EdgeInsets.all(20),
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: [
                  _buildControlCard(Icons.lightbulb, "Control Lights", Colors.orangeAccent),
                  _buildControlCard(Icons.lock, "Control Security", Colors.greenAccent),
                  _buildControlCard(Icons.thermostat, "Set Thermostat", Colors.blueAccent),
                  _buildControlCard(Icons.tv, "Control TV", Colors.purpleAccent),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget for control options (grid cards)
  Widget _buildControlCard(IconData icon, String label, Color color) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Voice Command: $label activated')),
        );
      },
      child: Card(
        color: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: color),
            SizedBox(height: 10),
            Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
