import 'package:flutter/material.dart';
import 'package:flutter_mobile_whiskerway/mating.dart';

class Pet_StatisticPage extends StatelessWidget {
  const Pet_StatisticPage({super.key});

  void main() {
    runApp(MaterialApp(
      home: Pet_StatisticPage(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Color(0xffd9f1fd),
          child: Stack(
            children: <Widget>[
              // Background image
              Positioned.fill(
                child: Image.asset(
                  'images/petdetailsbg.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              // Content on top of the background image
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10, left: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                      iconSize: 30,
                      padding: EdgeInsets.only(right: 8),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MatingPage()));
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pet Details",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Juyon",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
