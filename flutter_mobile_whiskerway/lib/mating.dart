import 'package:flutter/material.dart';
import 'package:flutter_mobile_whiskerway/home.dart';
import 'package:flutter_mobile_whiskerway/home_screen.dart';
import 'package:flutter_mobile_whiskerway/login.dart';
import 'package:flutter_mobile_whiskerway/mapPin.dart';
import 'package:flutter_mobile_whiskerway/messageChat.dart';
import 'package:flutter_mobile_whiskerway/plusCircle.dart';
import 'package:flutter_mobile_whiskerway/profilePage.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class MatingPage extends StatefulWidget {
  @override
  State<MatingPage> createState() => _MatingPageState();
}

class _MatingPageState extends State<MatingPage> {
  // Default selected button
  String _selectedButton = 'All';

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
          padding: EdgeInsets.only(top: 10, bottom: 10, left: 4),
          child: Row(
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
                    "Find a Mate",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Find a mate for your pet",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Spacer(),
              PopupMenuButton(
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: Text('Profile'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomePageProfile()),
                      );
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
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
        padding: EdgeInsets.only(
          top: 10,
          left: 15,
          right: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _buildMaterialButton('All'),
                SizedBox(width: 8),
                _buildMaterialButton('Dog'),
                SizedBox(width: 8),
                _buildMaterialButton('Cat'),
              ],
            ),
            SizedBox(height: 20),
            _buildTabContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildMaterialButton(String label) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedButton = label;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color:
              _selectedButton == label ? Color(0xff013958) : Color(0xff7ecef8),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Text(
          label,
          style: TextStyle(
            color: _selectedButton == label ? Colors.white : Colors.black,
            fontWeight: FontWeight.normal,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildTabContent() {
    switch (_selectedButton) {
      case 'All':
        return AllTab();
      case 'Dog':
        return DogTab();
      case 'Cat':
        return CatTab();
      default:
        return AllTab();
    }
  }
}

class AllTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          width: 400,
          color: Color(0xffd9f1fd),
          padding: const EdgeInsets.all(3.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    'images/dog1.jpg',
                    height: 80,
                    width: 100,
                    fit: BoxFit.scaleDown,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 3),
                        child: Text(
                          'Row Header',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 3),
                        child: Text(
                          'Body copy description',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class DogTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          width: 400,
          color: Color(0xffd9f1fd),
          padding: const EdgeInsets.all(3.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    'images/dog2.jpg',
                    height: 80,
                    width: 100,
                    fit: BoxFit.scaleDown,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 3),
                        child: Text(
                          'Dog Row Header',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 3),
                        child: Text(
                          'Dog Body copy description',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class CatTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          width: 400,
          color: Color(0xffd9f1fd),
          padding: const EdgeInsets.all(3.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    'images/dog3.jpg',
                    height: 80,
                    width: 100,
                    fit: BoxFit.scaleDown,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 3),
                        child: Text(
                          'Cat Row Header',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 3),
                        child: Text(
                          'Cat Body copy description',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

/////////////bottom navbar

class HomePageMating extends StatefulWidget {
  @override
  State<HomePageMating> createState() => _HomePageMatingState();
}

class _HomePageMatingState extends State<HomePageMating> {
  int _selectedIndex = 1;
  static List<Widget> _widgetOptions = <Widget>[
    HomeScreenPage(), // Example of actual widget
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
