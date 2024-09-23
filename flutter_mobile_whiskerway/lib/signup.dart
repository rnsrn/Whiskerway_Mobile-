// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:flutter_mobile_whiskerway/login.dart';

// class SignupPage extends StatefulWidget {
//   const SignupPage({super.key});

//   @override
//   State<SignupPage> createState() => _SignupPageState();
// }

// class _SignupPageState extends State<SignupPage> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _confirmPasswordController =
//       TextEditingController();
//   bool _obscurePassword = true;
//   bool _obscureConfirmPassword = true;

//   @override
//   void dispose() {
//     _usernameController.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//     _confirmPasswordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       backgroundColor: const Color(0xff006296),
//       body: Stack(
//         children: [
//           // Background Image
//           Container(
//             decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                     colors: [
//                   Color(0xff393939),
//                   Color(0xffbbbbbc),
//                   Color(0xff626363),
//                 ])),
//           ),
//           // Background Image
//           Positioned.fill(
//             child: Image.asset(
//               'images/PawCaresBg.png',
//               fit: BoxFit.scaleDown,
//               alignment: Alignment.center,
//               color: Colors.grey.withOpacity(0.3),
//               colorBlendMode: BlendMode.modulate,
//             ),
//           ),

//           // Page Content
//           SingleChildScrollView(
//             child: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 40),
//               height: MediaQuery.of(context).size.height - 5,
//               width: double.infinity,
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     const Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Text(
//                           'Sign Up',
//                           style: TextStyle(
//                               fontSize: 40,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white),
//                         ),
//                         SizedBox(
//                           height: 5,
//                         ),
//                         Text(
//                           'Welcome back!',
//                           style: TextStyle(fontSize: 25, color: Colors.grey),
//                         )
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 30,
//                     ),
//                     Container(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(
//                                 left: 2, right: 2, bottom: 5),
//                             child: Container(
//                               padding: const EdgeInsets.all(10),
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(15),
//                                   color: Colors.grey.withOpacity(0.8)),
//                               child: Column(
//                                 children: <Widget>[
//                                   inputFile(
//                                     label: "Username",
//                                     controller: _usernameController,
//                                     validator: (value) {
//                                       if (value == null || value.isEmpty) {
//                                         return 'Please enter your username';
//                                       }
//                                       return null;
//                                     },
//                                   ),
//                                   inputFile(
//                                     label: "Email",
//                                     controller: _emailController,
//                                     validator: (value) {
//                                       if (value == null || value.isEmpty) {
//                                         return 'Please enter your email';
//                                       }
//                                       // Add your email validation logic here
//                                       return null;
//                                     },
//                                   ),
//                                   inputFile(
//                                     label: "Password",
//                                     obscureText: _obscurePassword,
//                                     suffixIcon: _obscurePassword
//                                         ? Icons.visibility_off
//                                         : Icons.visibility,
//                                     controller: _passwordController,
//                                     validator: (value) {
//                                       if (value == null || value.isEmpty) {
//                                         return 'Please enter your password';
//                                       }
//                                       // Add your password validation logic here
//                                       return null;
//                                     },
//                                     toggleVisibility: () {
//                                       setState(() {
//                                         _obscurePassword = !_obscurePassword;
//                                       });
//                                     },
//                                   ),
//                                   inputFile(
//                                     label: "Confirm Password",
//                                     obscureText: _obscureConfirmPassword,
//                                     suffixIcon: _obscureConfirmPassword
//                                         ? Icons.visibility_off
//                                         : Icons.visibility,
//                                     controller: _confirmPasswordController,
//                                     validator: (value) {
//                                       if (value == null || value.isEmpty) {
//                                         return 'Please confirm your password';
//                                       }
//                                       if (value != _passwordController.text) {
//                                         return 'Passwords do not match';
//                                       }
//                                       return null;
//                                     },
//                                     toggleVisibility: () {
//                                       setState(() {
//                                         _obscureConfirmPassword =
//                                             !_obscureConfirmPassword;
//                                       });
//                                     },
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 110),
//                     Padding(
//                       padding: const EdgeInsets.only(
//                         top: 30,
//                       ),
//                       child: Container(
//                         padding: const EdgeInsets.only(top: 3, left: 3),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(50),
//                         ),
//                         child: MaterialButton(
//                           minWidth: double.infinity,
//                           height: 75,
//                           onPressed: () {
//                             if (_formKey.currentState!.validate()) {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => const LoginPage()),
//                               );
//                             }
//                           },
//                           color: const Color(0xff013958),
//                           elevation: 0,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(50),
//                           ),
//                           child: const Text(
//                             "Sign up",
//                             style: TextStyle(
//                               fontWeight: FontWeight.normal,
//                               fontSize: 18,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         const Text(
//                           "I have an account. ",
//                           style: TextStyle(color: Colors.white),
//                         ),
//                         TextButton(
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => const LoginPage()),
//                             );
//                           },
//                           child: const Text(
//                             "Login",
//                             style: TextStyle(
//                               fontWeight: FontWeight.w600,
//                               fontSize: 18,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget inputFile({
//     required String label,
//     bool obscureText = false,
//     IconData? suffixIcon,
//     required TextEditingController controller,
//     required String? Function(String?) validator,
//     VoidCallback? toggleVisibility,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Text(
//           label,
//           style: const TextStyle(
//               fontSize: 15, fontWeight: FontWeight.w400, color: Colors.white),
//         ),
//         const SizedBox(
//           height: 5,
//         ),
//         TextFormField(
//           controller: controller,
//           obscureText: obscureText,
//           validator: validator,
//           decoration: InputDecoration(
//             contentPadding:
//                 const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
//             filled: true,
//             fillColor: Colors.white,
//             suffixIcon: obscureText
//                 ? IconButton(
//                     icon: Icon(suffixIcon),
//                     onPressed: toggleVisibility,
//                   )
//                 : IconButton(
//                     icon: Icon(suffixIcon),
//                     onPressed: toggleVisibility,
//                   ),
//             enabledBorder: const OutlineInputBorder(
//               borderRadius: BorderRadius.all(Radius.circular(32.0)),
//               borderSide: BorderSide(
//                 color: Colors.white,
//               ),
//             ),
//             border: const OutlineInputBorder(
//               borderRadius: BorderRadius.all(Radius.circular(32.0)),
//               borderSide: BorderSide(color: Colors.green),
//             ),
//           ),
//         ),
//         const SizedBox(
//           height: 10,
//         )
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_mobile_whiskerway/login.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> registerUser(
      String username, String email, String password) async {
    try {
      // Create user with email and password
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Send verification email
      User? user = userCredential.user;
      if (user != null) {
        if (!user.emailVerified) {
          await user.sendEmailVerification();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Verification email sent to ${user.email}')),
          );
        }
        // Navigate to login screen on successful registration
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      }
    } catch (e) {
      // Handle registration failure
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to register: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xff006296),
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Color(0xff393939),
                  Color(0xffbbbbbc),
                  Color(0xff626363),
                ])),
          ),
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'images/PawCaresBg.png',
              fit: BoxFit.scaleDown,
              alignment: Alignment.center,
              color: Colors.grey.withOpacity(0.3),
              colorBlendMode: BlendMode.modulate,
            ),
          ),
          // Page Content
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              height: MediaQuery.of(context).size.height - 5,
              width: double.infinity,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Sign Up',
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Welcome back!',
                          style: TextStyle(fontSize: 25, color: Colors.grey),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 2, right: 2, bottom: 5),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.grey.withOpacity(0.8)),
                              child: Column(
                                children: <Widget>[
                                  inputFile(
                                    label: "Username",
                                    controller: _usernameController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your username';
                                      }
                                      return null;
                                    },
                                  ),
                                  inputFile(
                                    label: "Email",
                                    controller: _emailController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your email';
                                      }
                                      // Add your email validation logic here
                                      return null;
                                    },
                                  ),
                                  inputFile(
                                    label: "Password",
                                    obscureText: _obscurePassword,
                                    suffixIcon: _obscurePassword
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    controller: _passwordController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your password';
                                      }
                                      // Add your password validation logic here
                                      return null;
                                    },
                                    toggleVisibility: () {
                                      setState(() {
                                        _obscurePassword = !_obscurePassword;
                                      });
                                    },
                                  ),
                                  inputFile(
                                    label: "Confirm Password",
                                    obscureText: _obscureConfirmPassword,
                                    suffixIcon: _obscureConfirmPassword
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    controller: _confirmPasswordController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please confirm your password';
                                      }
                                      if (value != _passwordController.text) {
                                        return 'Passwords do not match';
                                      }
                                      return null;
                                    },
                                    toggleVisibility: () {
                                      setState(() {
                                        _obscureConfirmPassword =
                                            !_obscureConfirmPassword;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 110),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 30,
                      ),
                      child: Container(
                        padding: const EdgeInsets.only(top: 3, left: 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          height: 75,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              registerUser(
                                _usernameController.text,
                                _emailController.text,
                                _passwordController.text,
                              );
                            }
                          },
                          color: const Color(0xff013958),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Text(
                            "Sign up",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          "I have an account. ",
                          style: TextStyle(color: Colors.white),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()),
                            );
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget inputFile({
    required String label,
    bool obscureText = false,
    IconData? suffixIcon,
    required TextEditingController controller,
    required String? Function(String?) validator,
    VoidCallback? toggleVisibility,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.white),
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          validator: validator,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            filled: true,
            fillColor: Colors.white,
            suffixIcon: suffixIcon != null
                ? IconButton(
                    icon: Icon(suffixIcon),
                    onPressed: toggleVisibility,
                  )
                : null,
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
