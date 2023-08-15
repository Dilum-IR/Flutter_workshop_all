import 'package:flutter/material.dart';
import 'package:get/get.dart';

class placeConstantBox extends StatefulWidget {
  final String name, imageUrl, location;
  final int rating;

  const placeConstantBox({
    Key? key,
    required this.name,
    required this.rating,
    required this.imageUrl,
    required this.location,
  }) : super(key: key);

  @override
  State<placeConstantBox> createState() => _placeConstantBoxState();
}

class _placeConstantBoxState extends State<placeConstantBox> {
  var isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 18, top: 5, bottom: 20),
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          // center: Alignment.topLeft,
          colors: [
            // Colors.black26,
            // Colors.lightBlue,
            // Colors.indigoAccent,
            Colors.white,
            Color(0xff6DC8F3),
            Color(0xff73A1F9)
          ],
          begin: Alignment.topLeft,
          end: Alignment.centerRight,
          // radius: 5.0
        ),
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
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 135,
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
                Positioned(
                  height: 35,
                  width: 35,
                  top: 7,
                  left: 97,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(50)),
                    child: Center(
                      child: IconButton(
                          onPressed: () {
                            setState(() {
                              isFavourite = !isFavourite;
                            });
                          },
                          icon: isFavourite
                              ? const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: 16,
                                )
                              : const Icon(
                                  Icons.favorite_border,
                                  color: Colors.white,
                                  size: 16,
                                )),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            // Place name & Widgets
            Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 5),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.baseline,
                // textBaseline: TextBaseline.alphabetic,
                children: [
                  Expanded(
                    child: Text(
                      "${widget.name}",
                      // maxLines: 1,
                      // overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 15,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 15,
                  ),
                  Text(
                    " ${widget.rating}",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(child: SizedBox()),
            // location Widgets
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Row(
                children: [
                  const Icon(
                    Icons.location_on_rounded,
                    color: Color(0xffcc0033),
                    size: 17,
                  ),
                  Text(
                    " ${widget.location}",
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 15,
                      color: Colors.black.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
