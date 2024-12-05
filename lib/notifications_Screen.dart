// import 'package:flutter/material.dart';

// class NotificationsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Notifications', style: TextStyle(color: Colors.white)),
//         backgroundColor: Colors.grey[800],
//       ),
//       body: Center(
//         child: Text(
//           'Notifications Management Functionality Coming Soon!',
//           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  // Sample notifications data
  List<String> notifications = [
    "Welcome to Smart Home Automation!",
    "Your living room lights are now ON.",
    "Security system armed.",
    "New firmware updates available.",
  ];

  // Function to add a new notification
  void _addNotification() {
    setState(() {
      notifications.insert(0, "New notification at ${DateTime.now().toLocal()}");
    });

    // Show feedback to the user
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Notification added!'),
        backgroundColor: Colors.greenAccent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications', style: TextStyle(color: Colors.white)),
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
            Expanded(
              child: ListView.builder(
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    color: Colors.black54,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        notifications[index],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: _addNotification,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(
                  'Add Notification',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
