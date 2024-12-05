


// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// import 'package:smart_home_application/lighting_controll_screen.dart';
// import 'package:smart_home_application/main.dart';
// import 'package:smart_home_application/security_setting.dart';
// import 'package:smart_home_application/security_settings_screen.dart';
// import 'package:smart_home_application/loginscreen.dart';
// import 'package:smart_home_application/additional_settings.dart'; // Import the AdditionalSettingsScreen

// class DashboardScreen extends StatefulWidget {
//   @override
//   _DashboardScreenState createState() => _DashboardScreenState();
// }

// class _DashboardScreenState extends State<DashboardScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();
//     // Initialize animation controller
//     _controller = AnimationController(
//       duration: const Duration(seconds: 1),
//       vsync: this,
//     )..forward();
//     // Define fade-in animation
//     _animation = CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeIn,
//     );
//   }

//   @override
//   void dispose() {
//     // Dispose the animation controller
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Dashboard', style: TextStyle(color: Colors.white)),
//         backgroundColor: Colors.grey[800],
//         actions: [
//           IconButton(
//             icon: Icon(Icons.logout),
//             onPressed: () {
//               // Logout functionality
//               FirebaseAuth.instance.signOut();
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(builder: (context) => LoginScreen()),
//               );
//             },
//           ),
//         ],
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: NetworkImage(
//               'https://images.pexels.com/photos/775219/pexels-photo-775219.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
//             ),
//             fit: BoxFit.cover,
//           ),
//         ),
//         padding: const EdgeInsets.all(16.0),
//         child: Stack(
//           children: [
//             Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 // Profile Section
//                 _buildProfileSection(),
//                 SizedBox(height: 20),
//                 // Welcome Message with Icon
//                 _buildWelcomeMessage(),
//                 SizedBox(height: 40),
//                 // Button for Light Control
//                 _buildDashboardButton(
//                   context,
//                   'Control Lighting',
//                   Colors.orangeAccent,
//                   Icons.lightbulb_outline,
//                   SmartHomeControlScreen(),
//                 ),
//                 SizedBox(height: 20),
//                 // Button for Security Settings
//                 _buildDashboardButton(
//                   context,
//                   'Security Settings',
//                   Colors.lightBlueAccent,
//                   Icons.security_outlined,
//                   SecuritySettingsScreen(),
//                 ),
//                 SizedBox(height: 20),
//                 // Button for Additional Settings
//                 _buildDashboardButton(
//                   context,
//                   'Additional Settings',
//                   Colors.pinkAccent,
//                   Icons.settings,
//                   AdditionalSettingsScreen(),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // Function to build the profile section
//   Widget _buildProfileSection() {
//     String? userName = FirebaseAuth.instance.currentUser?.email?.split('@')[0];

//     return Container(
//       padding: EdgeInsets.all(16.0),
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(0.8),
//         borderRadius: BorderRadius.circular(10),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black26,
//             blurRadius: 10,
//             offset: Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           Icon(
//             Icons.person,
//             size: 50,
//             color: Colors.teal[700],
//           ),
//           SizedBox(width: 10),
//           Expanded(
//             child: Text(
//               userName != null ? 'Hello, $userName!' : 'Hello, Guest!',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.teal[700],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // Function to build welcome message with icon
//   Widget _buildWelcomeMessage() {
//     return Container(
//       padding: EdgeInsets.all(16.0),
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(0.8),
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Column(
//         children: [
//           Icon(
//             Icons.home,
//             size: 40,
//             color: Colors.teal[700],
//           ),
//           SizedBox(height: 10),
//           Text(
//             'Welcome to Your Smart Home!',
//             style: TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//               color: Colors.teal[700],
//             ),
//             textAlign: TextAlign.center,
//           ),
//           SizedBox(height: 5),
//           Text(
//             'Control your devices easily and enjoy the comfort of automation.',
//             style: TextStyle(
//               fontSize: 16,
//               color: Colors.teal[600],
//             ),
//             textAlign: TextAlign.center,
//           ),
//         ],
//       ),
//     );
//   }

//   // Function to build dashboard buttons with custom styling
//   Widget _buildDashboardButton(BuildContext context, String title, Color color, IconData icon, Widget screen) {
//     return Container(
//       width: double.infinity,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(30.0),
//         gradient: LinearGradient(
//           colors: [color.withOpacity(0.7), color],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black26,
//             blurRadius: 10,
//             offset: Offset(0, 4),
//           ),
//         ],
//       ),
//       child: ElevatedButton.icon(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.transparent,
//           shadowColor: Colors.transparent,
//           padding: EdgeInsets.symmetric(vertical: 15),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(30.0),
//           ),
//         ),
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => screen),
//           );
//         },
//         icon: Icon(icon, color: Colors.white),
//         label: Text(
//           title,
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:smart_home_application/lighting_controll_screen.dart';
import 'package:smart_home_application/main.dart';
import 'package:smart_home_application/security_setting.dart';
import 'package:smart_home_application/security_settings_screen.dart';
import 'package:smart_home_application/loginscreen.dart';
import 'package:smart_home_application/additional_settings.dart'; // Import the AdditionalSettingsScreen

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    // Initialize animation controller
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..forward();
    // Define fade-in animation
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
  }

  @override
  void dispose() {
    // Dispose the animation controller
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.grey[800],
        actions: [
          IconButton(
            icon: Icon(Icons.logout,color: Colors.white,),
            onPressed: () {
              // Logout functionality
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://images.pexels.com/photos/775219/pexels-photo-775219.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
            ),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Profile Section
                _buildProfileSection(),
                SizedBox(height: 20),
                // Welcome Message with Icon
                _buildWelcomeMessage(),
                SizedBox(height: 40),
                // Button for Light Control
                _buildDashboardButton(
                  context,
                  'Control Lighting',
                  Colors.orangeAccent,
                  Icons.lightbulb_outline,
                  SmartHomeControlScreen(),
                ),
                SizedBox(height: 20),
                // Button for Security Settings
                _buildDashboardButton(
                  context,
                  'Security Settings',
                  Colors.lightBlueAccent,
                  Icons.security_outlined,
                  SecuritySettingsScreen(),
                ),
                SizedBox(height: 20),
                // Button for Additional Settings
                _buildDashboardButton(
                  context,
                  'Additional Settings',
                  Colors.pinkAccent,
                  Icons.settings,
                  AdditionalSettingsScreen(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Function to build the profile section
  Widget _buildProfileSection() {
    String? userName = FirebaseAuth.instance.currentUser?.email?.split('@')[0];

    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            Icons.person,
            size: 50,
            color: Colors.teal[700],
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              userName != null ? 'Hello, $userName!' : 'Hello, Guest!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.teal[700],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Function to build welcome message with icon
  Widget _buildWelcomeMessage() {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Icon(
            Icons.home,
            size: 40,
            color: Colors.teal[700],
          ),
          SizedBox(height: 10),
          Text(
            'Welcome to Your Smart Home!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.teal[700],
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 5),
          Text(
            'Control your devices easily and enjoy the comfort of automation.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.teal[600],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // Function to build dashboard buttons with custom styling
  Widget _buildDashboardButton(BuildContext context, String title, Color color, IconData icon, Widget screen) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        gradient: LinearGradient(
          colors: [color.withOpacity(0.7), color],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        },
        icon: Icon(icon, color: Colors.white),
        label: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
