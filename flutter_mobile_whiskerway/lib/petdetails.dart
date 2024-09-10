import 'package:flutter/material.dart';
import 'package:flutter_mobile_whiskerway/editprofile.dart';
import 'package:flutter_mobile_whiskerway/home.dart';
import 'package:flutter_mobile_whiskerway/login.dart';
import 'package:flutter_mobile_whiskerway/mapPin.dart';
import 'package:flutter_mobile_whiskerway/mating.dart';
import 'package:flutter_mobile_whiskerway/messageChat.dart';
import 'package:flutter_mobile_whiskerway/plusCircle.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:image_picker/image_picker.dart'; // for image picker
import 'package:line_icons/line_icons.dart';
import 'dart:io'; // for File handling

class Petdetails extends StatefulWidget {
  const Petdetails({super.key});

  @override
  _PetdetailsState createState() => _PetdetailsState();
}

class _PetdetailsState extends State<Petdetails> {
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
                "Pet Details",
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
        padding: EdgeInsets.only(top: 40, left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 70,
              backgroundImage: _image != null
                  ? FileImage(_image!) // Display selected image
                  : null,
              child: _image == null
                  ? Icon(
                      Icons.person_2_outlined,
                      size: 90,
                    )
                  : null,
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
            SizedBox(height: 30),
            inputFile(label: "Pet Name"),
            dropdownField(
              label: "Type",
              value: selectedType,
              onChanged: (newValue) {
                setState(() {
                  selectedType = newValue;
                });
              },
              items: ['Dog', 'Cat', 'Other'],
            ),
            inputFile(label: "Breed"),
            inputFile(label: "Age"),
            dropdownField(
              label: "Neutered",
              value: neuteredStatus,
              onChanged: (newValue) {
                setState(() {
                  neuteredStatus = newValue;
                });
              },
              items: ['Yes', 'No'],
            ),
            inputFile(label: "Personality"),
            dropdownField(
              label: "Open for Dates",
              value: openForDatesStatus,
              onChanged: (newValue) {
                setState(() {
                  openForDatesStatus = newValue;
                });
              },
              items: ['Yes', 'No'],
            ),
            inputFile(label: "Bio"),
            inputFile(label: "Image"), // Image input field
            inputFile(label: "Generate QR"),
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: Container(
                width: 200,
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

  // Modified inputFile function with special case for "Image" label
  Widget inputFile(
      {required String label, bool obscureText = false, IconData? suffixIcon}) {
    if (label == "Image") {
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
          const SizedBox(height: 5),
          GestureDetector(
            onTap: _pickImage, // Open image picker on tap
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(32),
                border: Border.all(color: Colors.grey),
              ),
              child: Center(
                child: _image != null
                    ? Image.file(_image!)
                    : Icon(Icons.add_photo_alternate,
                        size: 50, color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      );
    } else {
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
          const SizedBox(height: 5),
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
          const SizedBox(height: 10),
        ],
      );
    }
  }

  Widget dropdownField({
    required String label,
    String? value,
    required void Function(String?) onChanged,
    required List<String> items,
  }) {
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
        const SizedBox(height: 5),
        DropdownButtonFormField<String>(
          value: value,
          onChanged: onChanged,
          items: items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            filled: true,
            fillColor: Colors.white,
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
        const SizedBox(height: 10),
      ],
    );
  }
}

/////////////bottom navbar

class PetPageProfile extends StatefulWidget {
  @override
  State<PetPageProfile> createState() => _PetPageProfileState();
}

class _PetPageProfileState extends State<PetPageProfile> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    Petdetails(), // Example of actual widget
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
