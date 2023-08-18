import 'package:flutter/material.dart';

class suggestionConstantBox extends StatefulWidget {
  final String name, imageUrl, location, follow;
  final int rating;

  const suggestionConstantBox({
    Key? key,
    required this.name,
    required this.rating,
    required this.imageUrl,
    required this.location,
    required this.follow,
  }) : super(key: key);

  @override
  State<suggestionConstantBox> createState() => _suggestionConstantBoxState();
}

class _suggestionConstantBoxState extends State<suggestionConstantBox> {
  var isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 18, top: 5, bottom: 20),
      width: 225,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          // center: Alignment.topLeft,
          colors: [
            Color(0xff6DC8F3),
            Color(0xff73A1F9),
          ],
          begin: Alignment.topLeft,
          end: Alignment.centerRight,
          // radius: 5.0
        ),
        // color: Colors.white70,
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 1),
              color: Colors.black.withOpacity(0.7),
              blurRadius: 5,
              spreadRadius: 0.5)
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: [
            Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                width: 70,
                margin: const EdgeInsets.all(2),
                height: 72,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.lightBlue,
                    image: DecorationImage(
                      image: NetworkImage(widget.imageUrl),
                      fit: BoxFit.cover,
                    )),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            // Place name & Widgets
            Container(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 90,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        widget.name,
                        style: const TextStyle(
                            fontSize: 16,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w500),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 17,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          "${widget.rating}",
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // followers shapes container
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    width: 90,
                    height: 50,
                    // color: Colors.red,
                    child: Stack(
                      children: [
                        Container(
                          // margin: const EdgeInsets.only(left: 5),
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(0xff73A1F9),
                                  // strokeAlign: StrokeAlign.outside,
                                  width: 2),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 18),
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(0xff73A1F9),
                                  // strokeAlign: StrokeAlign.outside,
                                  width: 2),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 36),
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(0xff73A1F9),
                                  // strokeAlign: StrokeAlign.outside,
                                  width: 2),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 54),
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color(0xff73A1F9),
                                // strokeAlign: StrokeAlign.outside,
                                width: 2),
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: Text(
                              widget.follow,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
