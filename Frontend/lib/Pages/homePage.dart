import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';

import 'package:session2/Utils/suggestionConstantBox.dart';
import 'package:session2/placeDetails.dart';
import '../Utils/details.dart';
import '../Utils/placeConstantBox.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String name = "Dilum";
  var isTab = false;
  late Color changeColor = Colors.blue;

  var searchController = TextEditingController();

  void callPlace() {
    // print("object");
    Get.to(
      // navigation page class name
      const PlaceDetails(),
      transition: Transition.rightToLeft,
      duration: const Duration(milliseconds: 500),
    );
  }

  void logout() {
    print("Logout");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 15, right: 5),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hello,",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black.withOpacity(0.8),
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    " $name",
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.blue,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Expanded(
                    // flex: 1,
                    child: SizedBox(),
                  ),
                  IconButton(
                    onPressed: () {
                      logout();
                    },
                    icon: const Icon(
                      CupertinoIcons.location_fill,
                      color: Color(0xff063970),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
              decoration: BoxDecoration(
                  // color: Colors.blue,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      offset: const Offset(0, 8),
                      blurRadius: 120,
                      spreadRadius: 0,
                    ),
                  ]),
              child: TextFormField(
                controller: searchController,
                validator: (value) =>
                    value == "" ? "Please Enter First name" : null,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {},
                  ),
                  // prefixIcon: Icon(
                  //   Icons.search,
                  //   color: Colors.black,
                  // ),
                  hintText: "Search a Places Here...",
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                    borderSide: BorderSide(color: Colors.white60),
                  ),
                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(color: Colors.white60)),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                    borderSide: BorderSide(color: Colors.white60),
                  ),
                  disabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(color: Colors.white60)),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 17),
              width: double.infinity,
              height: 45,
              // color: Colors.grey,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                // padding: const EdgeInsets.all(8),
                children: [
                  GestureDetector(
                    onTap: () {
                      callPlace();
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 10),
                      // padding: EdgeInsets.all(50),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                        gradient: LinearGradient(
                          colors: [
                            Color(0xff063970),
                            Color(0xff464A90),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.centerRight,
                          // radius: 5.0
                        ),
                      ),
                      // height: 80,
                      width: 130,

                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'Best place',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      callPlace();
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 10),
                      // padding: EdgeInsets.all(50),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        gradient: LinearGradient(
                          colors: [
                            Color(0xff063970),
                            Color(0xff464A90),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.centerRight,
                          // radius: 5.0
                        ),
                      ),
                      height: 80,
                      width: 130,

                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'Place',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      callPlace();
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 10),
                      // padding: EdgeInsets.all(50),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        gradient: LinearGradient(
                          colors: [
                            Color(0xff063970),
                            Color(0xff464A90),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.centerRight,
                          // radius: 5.0
                        ),
                      ),
                      height: 80,
                      width: 130,

                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'Place',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      callPlace();
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 10),
                      // padding: EdgeInsets.all(50),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xff063970),
                            Color(0xff464A90),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.centerRight,
                          // radius: 5.0
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      height: 80,
                      width: 130,

                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'Place',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            const Text(
                              "Travel Places",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "Show more >",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black.withOpacity(0.4),
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 225,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: Details.topPlaces.length,
                          itemBuilder: (context, index) {
                            return placeConstantBox(
                              name: Details.topPlaces[index]["name"] as String,
                              rating: Details.topPlaces[index]["rating"] as int,
                              imageUrl: Details.topPlaces[index]["imageUrl"]
                                  as String,
                              location: Details.topPlaces[index]["location"]
                                  as String,
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            const Text(
                              "Best Destination",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "Show more >",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black.withOpacity(0.4),
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // width: double.infinity,
                        height: 150,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: Details.topPlaces.length,
                          itemBuilder: (context, index) {
                            return suggestionConstantBox(
                              name: Details.topPlaces[index]["name"] as String,
                              rating: Details.topPlaces[index]["rating"] as int,
                              imageUrl: Details.topPlaces[index]["imageUrl"]
                                  as String,
                              location: Details.topPlaces[index]["location"]
                                  as String,
                              follow: Details.topPlaces[index]["followers"]
                                  as String,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
