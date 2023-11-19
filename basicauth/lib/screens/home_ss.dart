import 'package:basicauth/widgets/carousel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen1 extends StatelessWidget {
  const HomeScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 1,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Align(
                  alignment: Alignment.center,
                  heightFactor: 1,
                  child: Container(
                    height: 240,
                    width: double.infinity,
                    decoration: const BoxDecoration(color: Colors.white),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment,
                      children: [
                        Row(
                          children: const [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              CupertinoIcons.person_alt_circle_fill,
                              color: Colors.black,
                              size: 50,
                            ),
                            SizedBox(
                              width: 13,
                            ),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Good Morning",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w200),
                                  ),
                                  Text(
                                    "Sushma Shukla",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  )
                                ]),
                            Spacer(),
                            Icon(
                              CupertinoIcons.bell,
                              color: Colors.black,
                              size: 30,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              CupertinoIcons.bookmark,
                              color: Colors.black,
                              size: 30,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                        CustomSearchBar(),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 120,
                  left: 0,
                  right: 0,
                  child: Carousel(),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 90),
              child: Column(
                children: [
                  const HorizontalText(),
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('services')
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator(
                          color: Colors.white,
                        );
                      }

                      if (snapshot.connectionState == ConnectionState.active) {
                        return SizedBox(
                          height: 100,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data!.size,
                            itemBuilder: (BuildContext context, int index) {
                              return CategoryCard(
                                  e: snapshot.data!.docs[index]);
                            },
                          ),
                        );
                      }

                      return Container();
                    },
                  ),
                ],
              ),
            ),
            //  HorizontalText()
            Padding(
              padding: const EdgeInsets.only(left: 18, top: 16),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Text(
                        "Best Specialists",
                        style: TextStyle(
                            color: Color(0xff721c80),
                            //letterSpacing: 1.07,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Spacer(
                        flex: 8,
                      ),
                      Text(
                        "View all",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      Icon(
                        Icons.double_arrow_rounded,
                        color: Colors.grey,
                        size: 18,
                      ),
                      Spacer(
                        flex: 1,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('workers')
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator(
                          color: Colors.purple,
                        );
                      }
                      if (snapshot.hasData) {
                        return SizedBox(
                          height: 160,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data!.size,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                margin: const EdgeInsets.only(right: 12.0),
                                height: 160,
                                width: 120,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          snapshot.data?.docs[index]["img"],
                                        ),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(14)),
                                child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: SizedBox(
                                      width: 80,
                                      height: 22,
                                      child: Text(
                                        snapshot.data?.docs[index]["name"],
                                        style: const TextStyle(
                                            color: Colors.white),
                                        textAlign: TextAlign.center,
                                      ),
                                    )),
                              );
                            },
                          ),
                        );
                      }

                      return Container();
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 18),
              height: 20,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color.fromARGB(255, 220, 218, 218),
                    width: 0.9,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 12, right: 18, left: 18, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: const [
                      Icon(
                        Icons.south_america_outlined,
                        size: 28,
                        color: Color(0xff721c80),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'website',
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                  Column(
                    children: const [
                      Icon(
                        Icons.discount,
                        size: 28,
                        color: Color(0xff721c80),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Offers',
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                  Column(
                    children: const [
                      Icon(
                        Icons.phone_in_talk_sharp,
                        size: 28,
                        color: Color(0xff721c80),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Call',
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HorizontalText extends StatelessWidget {
  const HorizontalText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 18, bottom: 12),
      child: Row(
        children: const [
          Text(
            "Best Services",
            style: TextStyle(
                color: Color(0xff721c80),
                //letterSpacing: 1.07,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          Spacer(),
          Text(
            "View all",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          Icon(
            Icons.double_arrow_rounded,
            color: Colors.grey,
            size: 18,
          )
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final QueryDocumentSnapshot<Object?> e;
  const CategoryCard({
    Key? key,
    required this.e,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 18),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10.0, // soften the shadow
                    spreadRadius: 0.5, //extend the shadow
                    offset: Offset(
                      3.0, // Move to right 5  horizontally
                      3.0, // Move to bottom 5 Vertically
                    ),
                  )
                ],
                image: DecorationImage(
                    image: NetworkImage(e["img"]), fit: BoxFit.cover)),
          ),
          Text(
            e["name"],
            style: const TextStyle(color: Colors.deepPurple),
          ),
        ],
      ),
    );
  }
}

class CustomSearchBar extends StatelessWidget {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(13, 1, 13, 0),
        child: AppBar(
          shadowColor: Colors.white60,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          backgroundColor: Colors.white10,
          elevation: 1.0, // Remove the shadow
          leading:
              Icon(CupertinoIcons.search, color: Colors.black26), // Search icon
          title: TextField(
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              hintText: 'Search', // Hint text
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(CupertinoIcons.line_horizontal_3_decrease_circle,
                  color: Colors.black26), // Settings icon
              onPressed: () {
                // Handle settings icon tap
              },
            ),
          ],
        ));
  }
}
