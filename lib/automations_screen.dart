// import 'package:flutter/material.dart';

// class AutomationsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Automations', style: TextStyle(color: Colors.white)),
//         backgroundColor: Colors.grey[800],
//       ),
//       body: Center(
//         child: Text(
//           'Automation Management Functionality Coming Soon!',
//           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';

class AutomationsScreen extends StatefulWidget {
  @override
  _AutomationsScreenState createState() => _AutomationsScreenState();
}

class _AutomationsScreenState extends State<AutomationsScreen> {
  // Sample automation options
  List<Map<String, dynamic>> automations = [
    {"name": "Turn on lights at sunset", "isActive": false},
    {"name": "Turn off lights at sunrise", "isActive": false},
    {"name": "Lock doors at night", "isActive": false},
    {"name": "Temperature control based on weather", "isActive": false},
  ];

  // Toggle automation status
  void _toggleAutomation(int index) {
    setState(() {
      automations[index]['isActive'] = !automations[index]['isActive'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Automations', style: TextStyle(color: Colors.white)),
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
        child: ListView.builder(
          itemCount: automations.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color: Colors.black87,
              child: ListTile(
                title: Text(
                  automations[index]['name'],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Switch(
                  value: automations[index]['isActive'],
                  onChanged: (value) {
                    _toggleAutomation(index);
                  },
                  activeColor: Colors.greenAccent,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
