import 'dart:typed_data';
import 'package:flutter/foundation.dart'; // for kIsWeb
import 'package:flutter/material.dart';
import 'package:flutter_mobile_whiskerway/viewpets.dart';
import 'package:image_picker/image_picker.dart'; // for picking images
import 'package:flutter_mobile_whiskerway/home.dart';
import 'package:flutter_mobile_whiskerway/login.dart';
import 'package:flutter_mobile_whiskerway/profilePage.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // List to store messages (both text and image)
  final List<Map<String, dynamic>> messages = [];

  // Function to handle text message submission
  void _handleSendMessage(String message) {
    setState(() {
      messages.add({
        'type': 'text',
        'data': message,
        'timestamp': '9:45', // You can update this to get real-time
      });
    });
  }

  // Function to handle image submission (as bytes)
  void _handleSendImage(Uint8List imageBytes) {
    setState(() {
      messages.add({
        'type': 'image',
        'data': imageBytes,
        'timestamp': '9:46', // You can update this to get real-time
      });
    });
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
                    child: Text('View Pets'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ViewPetPage()));
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
      // Pass messages to ChatMessages widget
      body: ChatMessages(messages: messages),
      bottomNavigationBar: ChatInputBar(
        onSendMessage: _handleSendMessage,
        onSendImage: _handleSendImage,
      ), // Pass callbacks for sending text and images
    );
  }
}

// Widget for input bar
class ChatInputBar extends StatefulWidget {
  final Function(String) onSendMessage;
  final Function(Uint8List) onSendImage; // Callback for sending images

  const ChatInputBar({
    Key? key,
    required this.onSendMessage,
    required this.onSendImage,
  }) : super(key: key);

  @override
  State<ChatInputBar> createState() => _ChatInputBarState();
}

class _ChatInputBarState extends State<ChatInputBar> {
  final TextEditingController _controller = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  // Function to pick image and send
  void _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      if (kIsWeb) {
        // If on Flutter Web, convert to bytes and use Image.memory
        final bytes = await pickedFile.readAsBytes();
        widget.onSendImage(bytes); // Send image bytes
      } else {
        // On mobile, read as bytes for consistency
        final bytes = await pickedFile.readAsBytes();
        widget.onSendImage(bytes);
      }
    }
  }

  // Function to send text message
  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      widget.onSendMessage(_controller.text);
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.image),
            onPressed: _pickImage, // Trigger image picker
          ),
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Type your message...',
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: _sendMessage, // Send message
          ),
        ],
      ),
    );
  }
}

// Widget to display chat messages
class ChatMessages extends StatelessWidget {
  final List<Map<String, dynamic>> messages;

  const ChatMessages({Key? key, required this.messages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        if (message['type'] == 'text') {
          // If the message is text
          return ChatBubble(
            text: message['data'],
            timestamp: message['timestamp'],
          );
        } else if (message['type'] == 'image') {
          // If the message is an image
          return ChatImageBubble(
            imageBytes: message['data'], // image data as bytes
            timestamp: message['timestamp'],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

// Widget for displaying text messages
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
    return Align(
      alignment: Alignment.centerLeft, // Align text boxes to the left
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // Added margin to the container for the text bubble
            margin: const EdgeInsets.only(left: 10, top: 5),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Text(
              text,
              style: const TextStyle(color: Colors.black),
            ),
          ),
          const SizedBox(height: 4.0), // Space between message and timestamp
          // Moved the timestamp outside and below the text bubble
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 15),
                child: Text(
                  timestamp,
                  style: const TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Widget for displaying image messages
class ChatImageBubble extends StatelessWidget {
  final Uint8List imageBytes; // Image data in bytes
  final String timestamp;

  const ChatImageBubble({
    Key? key,
    required this.imageBytes,
    required this.timestamp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // Added margin to the container for the image bubble
            margin: const EdgeInsets.only(left: 10, top: 5),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Image.memory(
              imageBytes,
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 4.0), // Space between image and timestamp
          // Moved the timestamp outside and below the image bubble
          Container(
            margin: const EdgeInsets.only(left: 15),
            child: Text(
              timestamp,
              style: const TextStyle(
                fontSize: 12.0,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
