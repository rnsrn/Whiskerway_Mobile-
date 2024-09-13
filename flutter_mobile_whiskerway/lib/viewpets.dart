import 'package:flutter/material.dart';
import 'package:flutter_mobile_whiskerway/editprofile.dart';
import 'package:flutter_mobile_whiskerway/home.dart';
import 'package:flutter_mobile_whiskerway/login.dart';
import 'package:flutter_mobile_whiskerway/mapPin.dart';
import 'package:flutter_mobile_whiskerway/mating.dart';
import 'package:flutter_mobile_whiskerway/messageChat.dart';
import 'package:flutter_mobile_whiskerway/petdetails.dart';
import 'package:flutter_mobile_whiskerway/plusCircle.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:image_picker/image_picker.dart'; // for image picker
import 'package:line_icons/line_icons.dart';
import 'dart:io'; // for File handling

class Viewpets extends StatefulWidget {
  const Viewpets({super.key});

  @override
  _ViewpetsState createState() => _ViewpetsState();
}

class _ViewpetsState extends State<Viewpets> {
  String? selectedType;
  String? neuteredStatus;
  String? openForDatesStatus;
  File? _image; // to hold the selected image

  // Function to pick an image
  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

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
              Text(
                "Pets",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Spacer(),
              PopupMenuButton(
                itemBuilder: (context) => [
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
        padding: EdgeInsets.only(
          top: 10,
          left: 10,
          right: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 15,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.end,
                //crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PetPageProfile()));
                      },
                      color: Color(0xff013958),
                      textColor: Colors.white,
                      child: Text("Add Pet"),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ]),
            SizedBox(height: 10),
            SizedBox(
              height: 700,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return _buildSection3Card(index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

///////////////////Section Header 3///////////////////

  Widget _buildSection3Card(int index) {
    List<String> list_image = [
      'images/dog1.jpg',
      'images/dog2.jpg',
      'images/dog3.jpg',
      'images/dog4.jpg',
      'images/dog5.jpg'
    ];

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
                          'Pet1',
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
                          'Pet Details',
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
                  IconButton(
                    iconSize: 30,
                    padding: EdgeInsets.only(left: 150),
                    icon:
                        const Icon(Icons.arrow_right_alt, color: Colors.black),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PetPageProfile()));
                    },
                  ),
                ],
              )
            ],
          ),
        ),
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
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          'Pet2',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          'Pet Details',
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
                  IconButton(
                    iconSize: 30,
                    padding: EdgeInsets.only(left: 150),
                    icon:
                        const Icon(Icons.arrow_right_alt, color: Colors.black),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PetPageProfile()));
                    },
                  ),
                ],
              )
            ],
          ),
        ),
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
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          'Pet3',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          'Pet Details',
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
                  IconButton(
                    iconSize: 30,
                    padding: EdgeInsets.only(left: 150),
                    icon:
                        const Icon(Icons.arrow_right_alt, color: Colors.black),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PetPageProfile()));
                    },
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

class ViewPetPage extends StatefulWidget {
  @override
  State<ViewPetPage> createState() => _ViewPetPageState();
}

class _ViewPetPageState extends State<ViewPetPage> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    Viewpets(), // Example of actual widget
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
