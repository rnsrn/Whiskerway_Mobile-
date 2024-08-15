import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_mobile_whiskerway/home.dart';
import 'package:flutter_mobile_whiskerway/login.dart';
import 'package:flutter_mobile_whiskerway/profilePage.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
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
                    "Community Forum",
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
      body: const ChatMessages(), // Set the background color
    );
  }
}

class ChatMessages extends StatelessWidget {
  const ChatMessages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: const [
        ChatBubble(
          text: 'Message 1: Lorem ipsum dolor sit amet...',
          timestamp: '9:30',
        ),
        ChatBubble(
          text: 'Image placeholder',
          timestamp: '9:31',
        ),
        ChatBubble(
          text: 'Message 2: Lorem ipsum dolor sit amet...',
          timestamp: '9:32',
        ),
        ChatBubble(
          text: 'Message 3: Lorem ipsum dolor sit amet...',
          timestamp: '9:33',
        ),
        ChatBubble(
          text: 'Message 4: Lorem ipsum dolor sit amet...',
          timestamp: '9:34',
        ),
      ],
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String text;
  final String timestamp;

  const ChatBubble({
    Key? key,
    required this.text,
    required this.timestamp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final randomHeight =
        Random().nextInt(300) + 100.0; // Random height between 100 and 400

    return Align(
      alignment: Alignment.centerLeft, // Align text boxes to the left
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        padding: const EdgeInsets.all(16.0), // Increased padding for height
        constraints: BoxConstraints(
          maxWidth: 270,
          minHeight: randomHeight, // Set a minimum height with random value
          maxHeight: 400, // Set a maximum height for the text boxes
        ),
        decoration: BoxDecoration(
          color: Colors.white, // Set text box color to white
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                timestamp,
                style: const TextStyle(
                    fontSize: 12.0,
                    color: Colors.white,
                    backgroundColor: Colors.grey),
              ),
            ),
            const SizedBox(height: 8.0),
            Center(
              child: Icon(
                Icons.image,
                size: 32.0,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8.0),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                text,
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
