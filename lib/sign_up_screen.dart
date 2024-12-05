
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:smart_home_application/login_screen.dart'; // Import Login Screen
// import 'package:google_fonts/google_fonts.dart';
// import 'package:smart_home_application/loginscreen.dart'; // Google Fonts

// class SignUpScreen extends StatelessWidget {
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   Future<void> _register(BuildContext context) async {
//     try {
//       UserCredential userCredential = await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(
//         email: _emailController.text.trim(),
//         password: _passwordController.text.trim(),
//       );

//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Registration Successful!')),
//       );

//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => LoginScreen()),
//       );
//     } catch (e) {
//       print(e); // Handle error appropriately
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Registration Failed: ${e.toString()}')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Sign Up', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
//         backgroundColor: Colors.teal,
//       ),
//       body: Container(
//         padding: const EdgeInsets.all(16.0),
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.teal[100]!, Colors.teal[400]!],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: Center(
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 // Sign-up title with modern styling
//                 Text(
//                   'Create Account',
//                   style: GoogleFonts.poppins(
//                     fontSize: 28,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 SizedBox(height: 40),
//                 // Username TextField
//                 Container(
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(15),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black26,
//                         blurRadius: 10,
//                         offset: Offset(0, 4),
//                       ),
//                     ],
//                   ),
//                   child: TextField(
//                     controller: _usernameController,
//                     decoration: InputDecoration(
//                       contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//                       labelText: 'Username',
//                       labelStyle: GoogleFonts.poppins(color: Colors.teal),
//                       border: InputBorder.none,
//                     ),
//                     cursorColor: Colors.teal,
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 // Email TextField
//                 Container(
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(15),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black26,
//                         blurRadius: 10,
//                         offset: Offset(0, 4),
//                       ),
//                     ],
//                   ),
//                   child: TextField(
//                     controller: _emailController,
//                     decoration: InputDecoration(
//                       contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//                       labelText: 'Email',
//                       labelStyle: GoogleFonts.poppins(color: Colors.teal),
//                       border: InputBorder.none,
//                     ),
//                     cursorColor: Colors.teal,
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 // Password TextField
//                 Container(
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(15),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black26,
//                         blurRadius: 10,
//                         offset: Offset(0, 4),
//                       ),
//                     ],
//                   ),
//                   child: TextField(
//                     controller: _passwordController,
//                     decoration: InputDecoration(
//                       contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//                       labelText: 'Password',
//                       labelStyle: GoogleFonts.poppins(color: Colors.teal),
//                       border: InputBorder.none,
//                     ),
//                     obscureText: true,
//                     cursorColor: Colors.teal,
//                   ),
//                 ),
//                 SizedBox(height: 30),
//                 // Gradient Button
//                 Container(
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(30.0),
//                     gradient: LinearGradient(
//                       colors: [Colors.teal[300]!, Colors.teal[700]!],
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomRight,
//                     ),
//                   ),
//                   child: ElevatedButton(
//                     onPressed: () => _register(context),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.transparent,
//                       shadowColor: Colors.transparent,
//                       padding: EdgeInsets.symmetric(vertical: 15),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(30.0),
//                       ),
//                     ),
//                     child: Text(
//                       'Sign Up',
//                       style: GoogleFonts.poppins(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home_application/loginscreen.dart';
import 'package:smart_home_application/main.dart';


class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // Form key for validation

  Future<void> _register(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Registration Successful!')),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Registration Failed: ${e.toString()}')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal[100]!, Colors.teal[400]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey, // Form widget for validation
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Create Account',
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 40),
                  // Username TextField with validation
                  Container(
                    decoration: _inputDecoration(),
                    child: TextFormField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        labelText: 'Username',
                        labelStyle: GoogleFonts.poppins(color: Colors.teal),
                        border: InputBorder.none,
                      ),
                      cursorColor: Colors.teal,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your username';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  // Email TextField with validation
                  Container(
                    decoration: _inputDecoration(),
                    child: TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        labelText: 'Email',
                        labelStyle: GoogleFonts.poppins(color: Colors.teal),
                        border: InputBorder.none,
                      ),
                      cursorColor: Colors.teal,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  // Password TextField with validation
                  Container(
                    decoration: _inputDecoration(),
                    child: TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        labelText: 'Password',
                        labelStyle: GoogleFonts.poppins(color: Colors.teal),
                        border: InputBorder.none,
                      ),
                      obscureText: true,
                      cursorColor: Colors.teal,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        } else if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 30),
                  // Sign-Up Button
                  Container(
                    width: double.infinity,
                    decoration: _buttonDecoration(),
                    child: ElevatedButton(
                      onPressed: () => _register(context),
                      style: _buttonStyle(),
                      child: Text(
                        'Sign Up',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Reused input decoration
  BoxDecoration _inputDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 10,
          offset: Offset(0, 4),
        ),
      ],
    );
  }

  // Reused button decoration
  BoxDecoration _buttonDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(30.0),
      gradient: LinearGradient(
        colors: [Colors.teal[300]!, Colors.teal[700]!],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    );
  }

  // Reused button style
  ButtonStyle _buttonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      padding: EdgeInsets.symmetric(vertical: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
    );
  }
}
