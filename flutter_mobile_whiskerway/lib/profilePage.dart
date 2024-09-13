import 'package:flutter/material.dart';
import 'package:flutter_mobile_whiskerway/editprofile.dart';
import 'package:flutter_mobile_whiskerway/home.dart';
import 'package:flutter_mobile_whiskerway/login.dart';
import 'package:flutter_mobile_whiskerway/mapPin.dart';
import 'package:flutter_mobile_whiskerway/mating.dart';
import 'package:flutter_mobile_whiskerway/messageChat.dart';
import 'package:flutter_mobile_whiskerway/plusCircle.dart';
import 'package:flutter_mobile_whiskerway/viewpets.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffd9f1fd),
      appBar: AppBar(
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xffd9f1fd),
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.only(top: 10, bottom: 10, left: 8),
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                iconSize: 30,
                padding: EdgeInsets.only(right: 8),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              Spacer(),
              PopupMenuButton(
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: Text('View Pets'),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Viewpets()));
                    },
                  ),
                  PopupMenuItem(
                    child: Text(
                      'Log Out',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.only(top: 40, left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 70,
              child: Icon(
                Icons.person_2_outlined,
                size: 90,
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomePageEditProfile()));
                },
                child: Text("Edit Profile",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ))),
            SizedBox(height: 30), // Add spacing between avatar and inputs
            inputFile(label: "First Name"),
            inputFile(label: "Last Name"),
            inputFile(label: "Email"),
            inputFile(
              label: "Password",
              obscureText: true,
              suffixIcon: Icons.visibility_off,
            ),

            inputFile(label: "City"),
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: Container(
                width: 200, // Adjust the width here
                padding: EdgeInsets.only(top: 3, right: 3),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(50)),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget inputFile({label, obscureText = false, IconData? suffixIcon}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10),
        Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            filled: true,
            fillColor: Colors.white,
            suffixIcon: obscureText ? Icon(suffixIcon) : null,
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
              borderSide: BorderSide(color: Colors.green),
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

/////////////bottom navbar

class HomePageProfile extends StatefulWidget {
  @override
  State<HomePageProfile> createState() => _HomePageProfileState();
}

class _HomePageProfileState extends State<HomePageProfile> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    ProfilePage(), // Example of actual widget
    MatingPage(), // Example of actual widget
    PetListScreen(), // Example of actual widget
    ChatScreen(),
    NearMePage(), // Example of actual widget
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffd9f1fd),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: GNav(
              backgroundColor: Color(0xffd9f1fd),
              rippleColor: Colors.black,
              hoverColor: Color(0xff013958),
              gap: 8,
              activeColor: Colors.white,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Color(0xff013958),
              color: Colors.black,
              tabs: [
                GButton(icon: LineIcons.home),
                GButton(icon: LineIcons.heart),
                GButton(icon: LineIcons.plusCircle),
                //IconButton(icon: Icon(Icons.message)),
                GButton(icon: LineIcons.facebookMessenger),
                GButton(icon: LineIcons.mapPin),
                // Add more tabs here if needed
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
