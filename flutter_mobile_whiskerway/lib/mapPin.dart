import 'package:flutter/material.dart';
import 'package:flutter_mobile_whiskerway/home.dart';
import 'package:flutter_mobile_whiskerway/login.dart';
import 'package:flutter_mobile_whiskerway/profilePage.dart';

class NearMePage extends StatefulWidget {
  @override
  _NearMePageState createState() => _NearMePageState();
}

class _NearMePageState extends State<NearMePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
                    "Near Me",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
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
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        color: const Color(0xFFd9f1fd), // Match the background color
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildTab('Veterinary Clinic', fontSize: 16, index: 0),
                  SizedBox(width: 10),
                  _buildTab('Shelter', fontSize: 16, index: 1),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildContent('Veterinary Clinic', 5),
                  _buildContent('Shelter', 5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String text, {double fontSize = 16, required int index}) {
    return SizedBox(
      height: 40,
      child: ElevatedButton(
        onPressed: () {
          _tabController.animateTo(index);
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 20), // Adjust padding
          minimumSize: Size(80, 40),
          backgroundColor: const Color(0xFF7ecef8), // Change button color
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.black, // Change text color
            fontSize: fontSize, // Change text size
          ),
        ),
      ),
    );
  }

  Widget _buildContent(String title, int itemCount) {
    return ListView.builder(
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: _buildCard(title, index),
        );
      },
    );
  }

  Widget _buildCard(String title, int index) {
    return Container(
      height: 400,
      child: Card(
        color: const Color(0xFFd9f1fd), // Match the background color
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Icon(
                        Icons.image, // Use image holder icon
                        size: 100,
                        color: Colors.grey,
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Icon(
                        Icons.more_vert,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  // Handle Card Header click
                },
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Card Header $index',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios, size: 16),
                  ],
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Description',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.star, size: 20),
                  Icon(Icons.star, size: 20),
                  Icon(Icons.star, size: 20),
                  Icon(Icons.star, size: 20),
                  Icon(Icons.star, size: 20),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
