import 'package:flutter/material.dart';
import 'package:flutter_mobile_whiskerway/home.dart';
import 'package:flutter_mobile_whiskerway/login.dart';

class EmailVerificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffd9f1fd),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Centered logo
              Icon(
                Icons.email_outlined,
                size: 100,
                color: Colors.black,
              ),

              SizedBox(height: 30),

              // Text below the logo
              Text(
                'Verify your email address.',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              const Text(
                'We have just sent an email verification link to your email. Please check your email and click on that link to verify your email address.',
                style: TextStyle(
                  color: Color.fromARGB(255, 102, 102, 102),
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              const Text(
                'If not auto-redirected after verification, click on the Continue button.',
                style: TextStyle(
                  color: Color.fromARGB(255, 102, 102, 102),
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),

              // "Verify Email Address" button
              SizedBox(
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 75,
                  onPressed: () {
                    // Add your verification logic here
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  elevation: 0,
                  color: Color(0xff013958), // Button color
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    'Verify Email Address',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 30),

              // "Resend Email" text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: [
                      TextButton(
                        onPressed: () {
                          // Add your resend email logic here
                        },
                        child: const Text(
                          'Resend Email',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff4b92d4),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.keyboard_backspace_rounded,
                            color: Color(0xff4b92d4),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                            },
                            child: Text('back to login',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff4b92d4),
                                )),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
