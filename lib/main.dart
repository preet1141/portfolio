import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> sections = [
    'Home',
    'About Me',
    'Work',
    'Education',
    'Contact Me'
  ];
  int selectedSectionIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;

    return MaterialApp(
      title: 'Personal Portfolio',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: 110,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Text(
                          'Preet',
                          style: GoogleFonts.monsieurLaDoulaise(
                              fontSize: 30, fontWeight: FontWeight.w200),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: SizedBox(
                          height: 80, // or whatever fits your layout
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            padding: const EdgeInsets.only(
                                right: 20), // optional padding
                            itemBuilder: (context, index) {
                              String sectionName = sections[index];
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedSectionIndex = index;
                                  });
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '0${index + 1}',
                                      style: GoogleFonts.dmSans(
                                        fontSize: 10,
                                        color: selectedSectionIndex == index
                                            ? const Color(0xFF111827)
                                            : const Color(0xFF9CA3AF),
                                        fontWeight:
                                            selectedSectionIndex == index
                                                ? FontWeight.w800
                                                : FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      sectionName,
                                      style: GoogleFonts.dmSans(
                                        fontSize: 16,
                                        color: selectedSectionIndex == index
                                            ? const Color(0xFF111827)
                                            : const Color(0xFF9CA3AF),
                                        fontWeight:
                                            selectedSectionIndex == index
                                                ? FontWeight.w800
                                                : FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) => SizedBox(
                              width: MediaQuery.of(context).size.width /
                                  (sections.length * 2.8),
                            ),
                            itemCount: sections.length,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 1,
                color: Color(0xFFEEF1F5),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            height: deviceSize.height * (850 / 1080),
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: List.generate(
                                7,
                                (index) => Expanded(
                                  child: Column(
                                    children: [
                                      Expanded(child: Container()),
                                      Container(
                                        width: 1,
                                        height:
                                            deviceSize.height * (850 / 1080),
                                        color: const Color(0xFFEEF1F5),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: deviceSize.width * 0.214, top: 170),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Hello! I'm Preet Patel",
                                  style: GoogleFonts.playfairDisplay(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              (22 / 1080),
                                      color: const Color(0xFF9CA3AF),
                                      fontStyle: FontStyle.italic),
                                ),
                                Text(
                                  "Mobile App Developer",
                                  style: GoogleFonts.playfairDisplay(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              (74 / 1080),
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: 'Currently Working on ',
                                        style: GoogleFonts.dmSans(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                (22 / 1080),
                                            color: const Color(0xFF9CA3AF))),
                                    TextSpan(
                                        text: 'Flutter Application',
                                        style: GoogleFonts.dmSans(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                (22 / 1080),
                                            fontWeight: FontWeight.bold,
                                            color: const Color(0xFF9CA3AF))),
                                  ]),
                                )
                              ],
                            ),
                          ),
                          // Positioned(
                          //   top: deviceSize.height * (15 / 1080),
                          //   right: deviceSize.width * (330 / 1080),
                          //   child: RotatingTextWidget(
                          //     text: 'Preet Patel | Mobile App Developer',
                          //     radius: 150,
                          //     textStyle: GoogleFonts.dmSans(
                          //         fontSize: 18, color: Colors.black),
                          //     rotationDuration: Duration(seconds: 15),
                          //   ),
                          // ),
                          Positioned(
                            bottom: 0,
                            right: 150,
                            child: Image.asset(
                              'assets/images/bhai_photo.png',
                              width: deviceSize.width * (660 / 1080),
                              height: deviceSize.height * (800 / 1080),
                            ),
                          )
                        ],
                      ),
                      const Divider(
                        height: 1,
                        color: Color(0xFFEEF1F5),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
