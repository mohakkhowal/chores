import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String name = 'Choose task and press Shuffle!!';
  final rand = new Random();
  static const data = <String>[
    "Manan",
    "Mohak",
    "Praveen",
    "Bangali",
    "Anand",
    "Nirbhay",
    "Dhruv",
    "Habibi"
  ];

  String _chosenValue;
  bool trick = false;
  static const menuItems = <String>[
    'Boil Eggs',
    'Clean Flat',
    'Make hookah',
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFa35709),
          leading: IconButton(
            icon: Icon(
              trick ? Icons.people_alt_outlined : Icons.people_alt,
              // Icons.people_outline_outlined,
              color: Color(0xFFf0e3ca),
            ),
            onPressed: () {
              setState(() {
                trick = !trick;
              });
            },
          ),
          centerTitle: true,
          title: Text(
            'Random Chores',
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                color: Color(0xFFf0e3ca),
              ),
            ),
          ),
        ),
        body: Container(
          color: Color(0xFFf0e3ca),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton(
                        elevation: 10,
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            fontSize: 20,
                            color: Color(
                              0xFF1b1a17,
                            ),
                          ),
                        ),
                        hint: Text("Select Task"),
                        value: _chosenValue,
                        items: menuItems
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String value) {
                          setState(() {
                            _chosenValue = value;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 15,
                          primary: Color(0xFFa35709), // background
                          onPrimary: Color(0xFFf0e3ca), // foreground
                        ),
                        onPressed: () {
                          if (trick) {
                            setState(() {
                              while (true) {
                                if (_chosenValue == "Boil Eggs") {
                                  name = data[1 + rand.nextInt(3)];
                                } else if (_chosenValue == "Clean Flat") {
                                  name = data[0 + rand.nextInt(4)];
                                } else if (_chosenValue == "Make hookah") {
                                  name = data[1 + rand.nextInt(7)];
                                }
                                if (name != "Mohak") {
                                  break;
                                }
                              }
                            });
                          } else {
                            setState(() {
                              if (_chosenValue == "Boil Eggs") {
                                name = data[1 + rand.nextInt(3)];
                              } else if (_chosenValue == "Clean Flat") {
                                name = data[0 + rand.nextInt(4)];
                              } else if (_chosenValue == "Make hookah") {
                                name = data[1 + rand.nextInt(7)];
                              }
                            });
                          }
                          print("works");
                        },
                        child: Text(
                          "Shuffle!!",
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: 20,
                              color: Color(0xFFf0e3ca),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '$name',
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            fontSize: 30,
                            color: Color(
                              0xFF1b1a17,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
