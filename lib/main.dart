

// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart'; // Ensure this file is generated and imported
// import 'loginscreen.dart';
// import 'sign_up_screen.dart';
// import 'dashboard_screen.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
  
//   // Initialize Firebase with the generated options

//     const FirebaseOptions(
//      apiKey: "AIzaSyAsG-seVNZcf3YXJxEychiiRSewMBx0Odc",
//   authDomain: "smarthomeapplication-552e2.firebaseapp.com",
//   projectId: "smarthomeapplication-552e2",
//   storageBucket: "smarthomeapplication-552e2.appspot.com",
//   messagingSenderId: "211575409447",
//   appId: "1:211575409447:web:396ba46167b4072a9c7702",
//   measurementId: "G-0VYTWK3M5M"
//     );

//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Smart Home Application',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//         scaffoldBackgroundColor: Colors.grey[200],
//       ),
//       initialRoute: '/',
//       routes: {
//         '/': (context) => LoginScreen(),
//         '/signup': (context) => SignUpScreen(),
//         '/dashboard': (context) => DashboardScreen(),
//       },
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // Ensure this file is generated and imported
import 'loginscreen.dart';
import 'sign_up_screen.dart';
import 'dashboard_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Firebase with the generated options for all platforms
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Home Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.grey[200],
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/signup': (context) => SignUpScreen(),
        '/dashboard': (context) => DashboardScreen(),
      },
    );
  }
}

