


// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';

// class SecuritySettingsScreen extends StatefulWidget {
//   @override
//   _SecuritySettingsScreenState createState() => _SecuritySettingsScreenState();
// }

// class _SecuritySettingsScreenState extends State<SecuritySettingsScreen> {
//   // Firestore collection reference
//   final CollectionReference _securitySettingsCollection =
//       FirebaseFirestore.instance.collection('securitySettings');

//   // Variables to hold the settings values
//   int _alarmDuration = 30;
//   List<String> _emergencyContacts = ["awais"];
//   bool _isAlarmActive = false;
//   bool _isCameraActive = true;
//   bool _isSensorActive = true;
//   bool _receiveNotifications = true;
//   String _selectedTone = "Alarm Tone 2";

//   // Track modified features
//   Set<String> _modifiedFeatures = Set();

//   // Method to update the settings to Firestore
//   Future<void> _updateSettings() async {
//     try {
//       await _securitySettingsCollection.doc('settings').set({
//         'alarmDuration': _alarmDuration,
//         'emergencyContacts': _emergencyContacts,
//         'isAlarmActive': _isAlarmActive,
//         'isCameraActive': _isCameraActive,
//         'isSensorActive': _isSensorActive,
//         'receiveNotifications': _receiveNotifications,
//         'selectedTone': _selectedTone,
//       });
//       print('Settings saved successfully');
//     } catch (e) {
//       print('Error saving settings: $e');
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Error saving settings!'),
//         backgroundColor: Colors.red,
//       ));
//     }
//   }

//   // Show a dialog with the modified features
//   void _showModifiedFeatures() {
//     if (_modifiedFeatures.isNotEmpty) {
//       showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text('Modified Features'),
//             content: SingleChildScrollView(
//               child: ListBody(
//                 children: _modifiedFeatures.map((feature) => Text(feature)).toList(),
//               ),
//             ),
//             actions: [
//               TextButton(
//                 child: Text('OK'),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//           );
//         },
//       );
//     }
//   }

//   // Method to handle feature changes
//   void _handleChange(String featureName, dynamic newValue) {
//     setState(() {
//       switch (featureName) {
//         case 'alarmDuration':
//           _alarmDuration = newValue;
//           break;
//         case 'isAlarmActive':
//           _isAlarmActive = newValue;
//           break;
//         case 'isCameraActive':
//           _isCameraActive = newValue;
//           break;
//         case 'isSensorActive':
//           _isSensorActive = newValue;
//           break;
//         case 'receiveNotifications':
//           _receiveNotifications = newValue;
//           break;
//         case 'selectedTone':
//           _selectedTone = newValue;
//           break;
//         default:
//           break;
//       }
//       _modifiedFeatures.add(featureName); // Track modified feature
//     });
//   }

//   // Method to trigger the alarm
//   void _triggerAlarm() async {
//     if (_isAlarmActive) {
//       // Schedule the alarm
//       await AndroidAlarmManager.oneShot(
//         Duration(seconds: _alarmDuration),
//         0, // alarm ID
//         _playAlarm, // function to call
//         exact: true,
//         wakeup: true,
//       );
//       print('Alarm scheduled for $_alarmDuration seconds');
//     }
//   }

//   // Function that gets called when the alarm triggers
//   static Future<void> _playAlarm() async {
//     // Here you can use any method to play alarm sound
//     // For example, using the `flutter_ringtone_player` or any other package

//     print('Alarm is ringing!'); // Replace this with actual sound playing logic
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Security Settings', style: TextStyle(color: Colors.white)),
//         backgroundColor: Colors.grey[800],
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.grey[850]!, Colors.black87],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         padding: const EdgeInsets.all(16.0),
//         child: ListView(
//           children: [
//             // Alarm Duration
//             Card(
//               margin: EdgeInsets.symmetric(vertical: 8),
//               color: Colors.grey[900],
//               child: ListTile(
//                 title: Text('Alarm Duration (seconds)', style: TextStyle(color: Colors.white)),
//                 subtitle: Slider(
//                   value: _alarmDuration.toDouble(),
//                   min: 10,
//                   max: 60,
//                   divisions: 5,
//                   label: _alarmDuration.toString(),
//                   activeColor: Colors.blueAccent,
//                   inactiveColor: Colors.grey[600],
//                   onChanged: (value) {
//                     _handleChange('alarmDuration', value.toInt());
//                   },
//                 ),
//               ),
//             ),
//             // Emergency Contacts
//             Card(
//               margin: EdgeInsets.symmetric(vertical: 8),
//               color: Colors.grey[900],
//               child: ListTile(
//                 title: Text('Emergency Contacts', style: TextStyle(color: Colors.white)),
//                 subtitle: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     for (int i = 0; i < _emergencyContacts.length; i++)
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Expanded(
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(vertical: 4),
//                               child: Text(
//                                 _emergencyContacts[i],
//                                 style: TextStyle(color: Colors.white),
//                               ),
//                             ),
//                           ),
//                           IconButton(
//                             icon: Icon(Icons.delete, color: Colors.red),
//                             onPressed: () {
//                               setState(() {
//                                 _emergencyContacts.removeAt(i);
//                                 _modifiedFeatures.add('emergencyContacts');
//                               });
//                             },
//                           ),
//                         ],
//                       ),
//                     TextField(
//                       onSubmitted: (value) {
//                         if (value.isNotEmpty) {
//                           setState(() {
//                             _emergencyContacts.add(value);
//                             _modifiedFeatures.add('emergencyContacts');
//                           });
//                         }
//                       },
//                       decoration: InputDecoration(
//                         hintText: 'Add Emergency Contact',
//                         hintStyle: TextStyle(color: Colors.grey),
//                         suffixIcon: Icon(Icons.add, color: Colors.blueAccent),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(8),
//                           borderSide: BorderSide(color: Colors.grey[600]!),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(8),
//                           borderSide: BorderSide(color: Colors.blueAccent),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             // Alarm Active Switch
//             Card(
//               margin: EdgeInsets.symmetric(vertical: 8),
//               color: Colors.grey[900],
//               child: SwitchListTile(
//                 title: Text('Alarm Active', style: TextStyle(color: Colors.white)),
//                 value: _isAlarmActive,
//                 onChanged: (value) {
//                   _handleChange('isAlarmActive', value);
//                   if (value) {
//                     _triggerAlarm(); // Trigger alarm if activated
//                   }
//                 },
//                 activeColor: Colors.blueAccent,
//               ),
//             ),
//             // Camera Active Switch
//             Card(
//               margin: EdgeInsets.symmetric(vertical: 8),
//               color: Colors.grey[900],
//               child: SwitchListTile(
//                 title: Text('Camera Active', style: TextStyle(color: Colors.white)),
//                 value: _isCameraActive,
//                 onChanged: (value) {
//                   _handleChange('isCameraActive', value);
//                 },
//                 activeColor: Colors.blueAccent,
//               ),
//             ),
//             // Sensor Active Switch
//             Card(
//               margin: EdgeInsets.symmetric(vertical: 8),
//               color: Colors.grey[900],
//               child: SwitchListTile(
//                 title: Text('Sensor Active', style: TextStyle(color: Colors.white)),
//                 value: _isSensorActive,
//                 onChanged: (value) {
//                   _handleChange('isSensorActive', value);
//                 },
//                 activeColor: Colors.blueAccent,
//               ),
//             ),
//             // Receive Notifications Switch
//             Card(
//               margin: EdgeInsets.symmetric(vertical: 8),
//               color: Colors.grey[900],
//               child: SwitchListTile(
//                 title: Text('Receive Notifications', style: TextStyle(color: Colors.white)),
//                 value: _receiveNotifications,
//                 onChanged: (value) {
//                   _handleChange('receiveNotifications', value);
//                 },
//                 activeColor: Colors.blueAccent,
//               ),
//             ),
//             // Selected Tone
//             Card(
//               margin: EdgeInsets.symmetric(vertical: 8),
//               color: Colors.grey[900],
//               child: ListTile(
//                 title: Text('Selected Tone', style: TextStyle(color: Colors.white)),
//                 trailing: DropdownButton<String>(
//                   value: _selectedTone,
//                   dropdownColor: Colors.grey[900],
//                   items: <String>[
//                     'Alarm Tone 1',
//                     'Alarm Tone 2',
//                     'Alarm Tone 3'
//                   ].map<DropdownMenuItem<String>>((String value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(value, style: TextStyle(color: Colors.white)),
//                     );
//                   }).toList(),
//                   onChanged: (String? newValue) {
//                     if (newValue != null) {
//                       _handleChange('selectedTone', newValue);
//                     }
//                   },
//                 ),
//               ),
//             ),
//             // Save Settings Button
//             ElevatedButton(
//               onPressed: () {
//                 _updateSettings();
//                 _showModifiedFeatures(); // Show modified features dialog
//               },
//               child: Text('Save Settings'),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blueAccent,
//                 padding: EdgeInsets.symmetric(vertical: 16.0),
//                 textStyle: TextStyle(fontSize: 20),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }




// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class SecuritySettingsScreen extends StatefulWidget {
//   @override
//   _SecuritySettingsScreenState createState() => _SecuritySettingsScreenState();
// }

// class _SecuritySettingsScreenState extends State<SecuritySettingsScreen> {
//   // Firestore collection reference
//   final CollectionReference _securitySettingsCollection =
//       FirebaseFirestore.instance.collection('securitySettings');

//   // Variables to hold the settings values
//   int _alarmDuration = 30;
//   List<String> _emergencyContacts = [];
//   bool _isAlarmActive = false;
//   bool _isCameraActive = true;
//   bool _isSensorActive = true;
//   bool _receiveNotifications = true;
//   String _selectedTone = "Alarm Tone 2";
//   bool _motionDetectionEnabled = true;
//   bool _nightModeEnabled = false;
//   double _alarmVolume = 0.5; // Default volume (50%)

//   // Method to update the settings to Firestore
//   Future<void> _updateSettings() async {
//     try {
//       await _securitySettingsCollection.doc('settings').set({
//         'alarmDuration': _alarmDuration,
//         'emergencyContacts': _emergencyContacts,
//         'isAlarmActive': _isAlarmActive,
//         'isCameraActive': _isCameraActive,
//         'isSensorActive': _isSensorActive,
//         'receiveNotifications': _receiveNotifications,
//         'selectedTone': _selectedTone,
//         'motionDetectionEnabled': _motionDetectionEnabled,
//         'nightModeEnabled': _nightModeEnabled,
//         'alarmVolume': _alarmVolume,
//       });
//       print('Settings updated successfully in Firestore.');
//     } catch (e) {
//       print('Error saving settings: $e');
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Error saving settings!'),
//         backgroundColor: Colors.red,
//       ));
//     }
//   }

//   // Method to test the alarm
//   void _testAlarm() {
//     print("Testing alarm with volume: $_alarmVolume");
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//       content: Text('Alarm test initiated! Volume: ${(_alarmVolume * 100).toInt()}%'),
//       backgroundColor: Colors.green,
//     ));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Security Settings'),
//         backgroundColor: Colors.grey[800],
//       ),
//       body: Container(
//         padding: const EdgeInsets.all(16.0),
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.grey[850]!, Colors.black87],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: ListView(
//           children: [
//             // Alarm Duration
//             ListTile(
//               title: Text('Alarm Duration (seconds)', style: TextStyle(color: Colors.white)),
//               trailing: DropdownButton<int>(
//                 value: _alarmDuration,
//                 dropdownColor: Colors.grey[900],
//                 items: [15, 30, 45, 60].map((duration) {
//                   return DropdownMenuItem<int>(
//                     value: duration,
//                     child: Text(duration.toString(), style: TextStyle(color: Colors.white)),
//                   );
//                 }).toList(),
//                 onChanged: (value) {
//                   setState(() {
//                     _alarmDuration = value!;
//                   });
//                 },
//               ),
//             ),
//             Divider(color: Colors.white),

//             // Motion Detection
//             SwitchListTile(
//               title: Text('Enable Motion Detection', style: TextStyle(color: Colors.white)),
//               value: _motionDetectionEnabled,
//               onChanged: (value) {
//                 setState(() {
//                   _motionDetectionEnabled = value;
//                 });
//               },
//               activeColor: Colors.green,
//             ),
//             Divider(color: Colors.white),

//             // Night Mode
//             SwitchListTile(
//               title: Text('Enable Night Mode', style: TextStyle(color: Colors.white)),
//               value: _nightModeEnabled,
//               onChanged: (value) {
//                 setState(() {
//                   _nightModeEnabled = value;
//                 });
//               },
//               activeColor: Colors.blue,
//             ),
//             Divider(color: Colors.white),

//             // Alarm Volume Slider
//             ListTile(
//               title: Text('Alarm Volume', style: TextStyle(color: Colors.white)),
//               subtitle: Slider(
//                 value: _alarmVolume,
//                 min: 0.0,
//                 max: 1.0,
//                 divisions: 10,
//                 label: '${(_alarmVolume * 100).toInt()}%',
//                 onChanged: (value) {
//                   setState(() {
//                     _alarmVolume = value;
//                   });
//                 },
//                 activeColor: Colors.green,
//               ),
//             ),
//             Divider(color: Colors.white),

//             // Test Alarm
//             ElevatedButton(
//               onPressed: _testAlarm,
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.orange,
//               ),
//               child: Text('Test Alarm'),
//             ),
//             Divider(color: Colors.white),

//             // Save Settings
//             ElevatedButton(
//               onPressed: _updateSettings,
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.green,
//                 padding: EdgeInsets.symmetric(vertical: 16.0),
//               ),
//               child: Text('Save Settings', style: TextStyle(color: Colors.white)),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SecuritySettingsScreen extends StatefulWidget {
  @override
  _SecuritySettingsScreenState createState() => _SecuritySettingsScreenState();
}

class _SecuritySettingsScreenState extends State<SecuritySettingsScreen> {
  // Firestore collection reference
  final CollectionReference _securitySettingsCollection =
      FirebaseFirestore.instance.collection('securitySettings');

  // Variables to hold the settings values
  int _alarmDuration = 30;
  List<String> _emergencyContacts = [];
  bool _isAlarmActive = false;
  bool _isCameraActive = true;
  bool _isSensorActive = true;
  bool _receiveNotifications = true;
  String _selectedTone = "Alarm Tone 2";
  bool _motionDetectionEnabled = true;
  bool _nightModeEnabled = false;
  double _alarmVolume = 0.5; // Default volume (50%)
  bool _facialRecognitionEnabled = false;
  bool _twoFactorAuthEnabled = false;
  bool _realTimeAlertsEnabled = true;
  int _autoLockDuration = 10; // Auto lock after 10 seconds

  // Track modified features
  Set<String> _modifiedFeatures = {};

  // Method to update the settings to Firestore
  Future<void> _updateSettings() async {
    try {
      // Save settings to Firestore
      await _securitySettingsCollection.doc('settings').set({
        'alarmDuration': _alarmDuration,
        'emergencyContacts': _emergencyContacts,
        'isAlarmActive': _isAlarmActive,
        'isCameraActive': _isCameraActive,
        'isSensorActive': _isSensorActive,
        'receiveNotifications': _receiveNotifications,
        'selectedTone': _selectedTone,
        'motionDetectionEnabled': _motionDetectionEnabled,
        'nightModeEnabled': _nightModeEnabled,
        'alarmVolume': _alarmVolume,
        'facialRecognitionEnabled': _facialRecognitionEnabled,
        'twoFactorAuthEnabled': _twoFactorAuthEnabled,
        'realTimeAlertsEnabled': _realTimeAlertsEnabled,
        'autoLockDuration': _autoLockDuration,
      });

      print('Settings updated successfully in Firestore.');
      _showModifiedFeatures(); // Show modified settings in a dialog box
    } catch (e) {
      print('Error saving settings: $e');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error saving settings!'),
        backgroundColor: Colors.red,
      ));
    }
  }

  // Method to display modified settings in a dialog
  void _showModifiedFeatures() {
    if (_modifiedFeatures.isEmpty) {
      // If no settings were modified, show a default message
      _modifiedFeatures.add("No changes were made.");
    }

    // Show the dialog with modified settings
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Modified Settings'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: _modifiedFeatures.map((feature) {
                return Text(
                  '- $feature',
                  style: TextStyle(fontSize: 16),
                );
              }).toList(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Clear modified features after showing the dialog
                setState(() {
                  _modifiedFeatures.clear();
                });
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  // Method to handle feature changes
  void _handleChange(String featureName, dynamic newValue) {
    setState(() {
      switch (featureName) {
        case 'alarmDuration':
          _alarmDuration = newValue;
          break;
        case 'facialRecognitionEnabled':
          _facialRecognitionEnabled = newValue;
          break;
        case 'twoFactorAuthEnabled':
          _twoFactorAuthEnabled = newValue;
          break;
        case 'realTimeAlertsEnabled':
          _realTimeAlertsEnabled = newValue;
          break;
        case 'autoLockDuration':
          _autoLockDuration = newValue;
          break;
        default:
          break;
      }
      _modifiedFeatures.add(featureName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Security Settings', style: TextStyle(color: Colors.white)), // White color text
        backgroundColor: Colors.grey[800],
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.grey[850]!, Colors.black87],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          children: [
            // Alarm Duration
            ListTile(
              title: Text('Alarm Duration (seconds)', style: TextStyle(color: Colors.white)),
              trailing: DropdownButton<int>(
                value: _alarmDuration,
                dropdownColor: Colors.grey[900],
                items: [15, 30, 45, 60].map((duration) {
                  return DropdownMenuItem<int>(
                    value: duration,
                    child: Text(duration.toString(), style: TextStyle(color: Colors.white)),
                  );
                }).toList(),
                onChanged: (value) => _handleChange('alarmDuration', value),
              ),
            ),
            Divider(color: Colors.white),

            // Facial Recognition
            SwitchListTile(
              title: Text('Enable Facial Recognition', style: TextStyle(color: Colors.white)),
              value: _facialRecognitionEnabled,
              onChanged: (value) => _handleChange('facialRecognitionEnabled', value),
              activeColor: Colors.green,
            ),
            Divider(color: Colors.white),

            // Two-Factor Authentication
            SwitchListTile(
              title: Text('Enable Two-Factor Authentication', style: TextStyle(color: Colors.white)),
              value: _twoFactorAuthEnabled,
              onChanged: (value) => _handleChange('twoFactorAuthEnabled', value),
              activeColor: Colors.blue,
            ),
            Divider(color: Colors.white),

            // Real-Time Alerts
            SwitchListTile(
              title: Text('Enable Real-Time Alerts', style: TextStyle(color: Colors.white)),
              value: _realTimeAlertsEnabled,
              onChanged: (value) => _handleChange('realTimeAlertsEnabled', value),
              activeColor: Colors.redAccent,
            ),
            Divider(color: Colors.white),

            // Auto Lock Duration
            ListTile(
              title: Text('Auto Lock Duration (seconds)', style: TextStyle(color: Colors.white)),
              trailing: DropdownButton<int>(
                value: _autoLockDuration,
                dropdownColor: Colors.grey[900],
                items: [5, 10, 15, 30].map((duration) {
                  return DropdownMenuItem<int>(
                    value: duration,
                    child: Text(duration.toString(), style: TextStyle(color: Colors.white)),
                  );
                }).toList(),
                onChanged: (value) => _handleChange('autoLockDuration', value),
              ),
            ),
            Divider(color: Colors.white),

            // Save Settings Button
            ElevatedButton(
              onPressed: _updateSettings,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(vertical: 16.0),
              ),
              child: Text('Save Settings', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
