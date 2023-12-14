import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Carousel extends StatelessWidget {
  const Carousel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        // Container(
        //   height: 40,
        //   width: 400,
        //   margin: const EdgeInsets.all(6.0),
        //   child: Row(
        //     children: [
        //       const Column(
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         children: [
        //           Spacer(
        //             flex: 2,
        //           ),
        //           Text(
        //             "Look Awesome",
        //             style: TextStyle(
        //                 color: Color.fromARGB(0, 255, 255, 255),
        //                 fontSize: 16,
        //                 fontWeight: FontWeight.bold,
        //                 letterSpacing: 1),
        //             textAlign: TextAlign.center,
        //           ),
        //           SizedBox(
        //             height: 5,
        //           ),
        //           Text(
        //             "& Save Some",
        //             style: TextStyle(
        //               color: Color(0xffffffff),
        //               fontWeight: FontWeight.bold,
        //               fontStyle: FontStyle.italic,
        //               fontSize: 16,
        //             ),
        //             textAlign: TextAlign.center,
        //           ),
        //           Spacer(),
        //           Btn(text: "Get upto 20% off"),
        //         ],
        //       ),
        //       const Spacer(),
        //       Image.network(
        //         "https://firebasestorage.googleapis.com/v0/b/auth1-c0c5f.appspot.com/o/IMG_4915.JPG?alt=media&token=7fecd7d1-711d-4af9-b475-c76594d4e555",
        //         width: 120,
        //         height: 400,
        //         fit: BoxFit.cover,
        //       ),
        //     ],
        //   ),
        // ),
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                "https://firebasestorage.googleapis.com/v0/b/auth1-c0c5f.appspot.com/o/IMG_4915.JPG?alt=media&token=7fecd7d1-711d-4af9-b475-c76594d4e555",
                // "https://firebasestorage.googleapis.com/v0/b/auth1-c0c5f.appspot.com/o/IMG_4916.JPG?alt=media&token=09e3d58b-4b2c-4dee-bb0c-62127f138131",
                width: 500,
                height: 400,
                fit: BoxFit.cover,
              ),
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spacer(
                  flex: 16,
                ),
                Btn(
                  text: "30% OFF",
                ),
                Spacer(),
                Text(
                  "     Today's Special",
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontStyle: FontStyle.normal,
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1),
                  textAlign: TextAlign.end,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "",
                  style: TextStyle(
                    color: Color.fromARGB(255, 5, 12, 3),
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                Spacer(),
              ],
            ),
            const Spacer(),
          ],
        ),
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                "https://firebasestorage.googleapis.com/v0/b/auth1-c0c5f.appspot.com/o/IMG_4916.JPG?alt=media&token=09e3d58b-4b2c-4dee-bb0c-62127f138131",
                width: 500,
                height: 400,
                fit: BoxFit.cover,
              ),
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spacer(
                  flex: 4,
                ),
                Spacer(),
                // Text(
                //   "Today's Special",
                //   style: TextStyle(
                //       color: Color.fromARGB(255, 255, 255, 255),
                //       fontStyle: FontStyle.normal,
                //       fontSize: 16,
                //       fontWeight: FontWeight.w800,
                //       letterSpacing: 1),
                //   textAlign: TextAlign.end,
                // ),
                SizedBox(
                  height: 5,
                ),
                // Text(
                //   "Now",
                //   style: TextStyle(
                //     color: Color.fromARGB(255, 5, 12, 3),
                //     fontWeight: FontWeight.bold,
                //     fontStyle: FontStyle.italic,
                //     fontSize: 16,
                //   ),
                //   textAlign: TextAlign.center,
                // ),
                // Spacer(),
              ],
            ),
            const Spacer(),
          ],
        ),
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                "https://firebasestorage.googleapis.com/v0/b/auth1-c0c5f.appspot.com/o/IMG_4919.JPG?alt=media&token=007bdcb8-44a8-4dc3-a60a-21a8cf469dc9", // "https://firebasestorage.googleapis.com/v0/b/auth1-c0c5f.appspot.com/o/IMG_4916.JPG?alt=media&token=09e3d58b-4b2c-4dee-bb0c-62127f138131",
                width: 700,
                height: 400,
                fit: BoxFit.cover,
              ),
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spacer(
                  flex: 4,
                ),
                // Btn(
                //   text: "30% OFF",
                // ),
                // Spacer(),
                // Text(
                //   "Today's Special",
                //   style: TextStyle(
                //       color: Color.fromARGB(255, 255, 255, 255),
                //       fontStyle: FontStyle.normal,
                //       fontSize: 16,
                //       fontWeight: FontWeight.w800,
                //       letterSpacing: 1),
                //   textAlign: TextAlign.end,
                // ),
                // SizedBox(
                //   height: 5,
                // ),
                // Text(
                //   "Now",
                //   style: TextStyle(
                //     color: Color.fromARGB(255, 5, 12, 3),
                //     fontWeight: FontWeight.bold,
                //     fontStyle: FontStyle.italic,
                //     fontSize: 16,
                //   ),
                //   textAlign: TextAlign.center,
                // ),
                Spacer(),
              ],
            ),
            const Spacer(),
          ],
        ),
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                "https://firebasestorage.googleapis.com/v0/b/auth1-c0c5f.appspot.com/o/IMG_4917.JPG?alt=media&token=a90052de-6f3f-4feb-8447-dff948e2a942",
                // "https://firebasestorage.googleapis.com/v0/b/auth1-c0c5f.appspot.com/o/IMG_4916.JPG?alt=media&token=09e3d58b-4b2c-4dee-bb0c-62127f138131",
                width: 500,
                height: 400,
                fit: BoxFit.cover,
              ),
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spacer(
                  flex: 4,
                ),
                // Btn(
                //   text: "30% OFF",
                // ),
                // Spacer(),
                // Text(
                //   "Today's Special",
                //   style: TextStyle(
                //       color: Color.fromARGB(255, 255, 255, 255),
                //       fontStyle: FontStyle.normal,
                //       fontSize: 16,
                //       fontWeight: FontWeight.w800,
                //       letterSpacing: 1),
                //   textAlign: TextAlign.end,
                // ),
                // SizedBox(
                //   height: 5,
                // ),
                // Text(
                //   "Now",
                //   style: TextStyle(
                //     color: Color.fromARGB(255, 5, 12, 3),
                //     fontWeight: FontWeight.bold,
                //     fontStyle: FontStyle.italic,
                //     fontSize: 16,
                //   ),
                //   textAlign: TextAlign.center,
                // ),
                Spacer(),
              ],
            ),
            const Spacer(),
          ],
        ),
        //   ),
        //   Container(
        //     height: 40,
        //     width: 400,
        //     margin: const EdgeInsets.all(6.0),
        //     decoration: BoxDecoration(
        //       color: const Color(0xff721c80),
        //       gradient: const LinearGradient(
        //         colors: [
        //           Color(0xff721c80),
        //           Color.fromARGB(255, 196, 103, 169),
        //         ],
        //         begin: Alignment.topLeft,
        //         end: Alignment.bottomRight,
        //       ),
        //       borderRadius: BorderRadius.circular(8.0),
        //     ),
        //     child: Row(
        //       children: [
        //         const Column(
        //           crossAxisAlignment: CrossAxisAlignment.center,
        //           children: [
        //             Spacer(
        //               flex: 2,
        //             ),
        //             Text(
        //               "Look Awesome",
        //               style: TextStyle(
        //                   color: Color(0xffffffff),
        //                   fontSize: 16,
        //                   fontWeight: FontWeight.bold,
        //                   letterSpacing: 1),
        //               textAlign: TextAlign.center,
        //             ),
        //             SizedBox(
        //               height: 5,
        //             ),
        //             Text(
        //               "& Save Some",
        //               style: TextStyle(
        //                 color: Color(0xffffffff),
        //                 fontWeight: FontWeight.bold,
        //                 fontStyle: FontStyle.italic,
        //                 fontSize: 16,
        //               ),
        //               textAlign: TextAlign.center,
        //             ),
        //             Spacer(),
        //             Btn(text: "Get upto 20% off"),
        //           ],
        //         ),
        //         const Spacer(),
        //         Align(
        //           child: Image.network(
        //             "https://firebasestorage.googleapis.com/v0/b/auth1-c0c5f.appspot.com/o/IMG_4919.JPG?alt=media&token=007bdcb8-44a8-4dc3-a60a-21a8cf469dc9",
        //             width: 120,
        //             height: 400,
        //             fit: BoxFit.cover,
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        //   Container(
        //     height: 40,
        //     width: 400,
        //     margin: const EdgeInsets.all(6.0),
        //     decoration: BoxDecoration(
        //       color: const Color.fromARGB(255, 48, 28, 128),
        //       gradient: const LinearGradient(
        //         colors: [
        //           Color.fromARGB(248, 38, 28, 128),
        //           Color.fromARGB(255, 195, 168, 187),
        //         ],
        //         begin: Alignment.topLeft,
        //         end: Alignment.bottomRight,
        //       ),
        //       borderRadius: BorderRadius.circular(8.0),
        //     ),
        //     child: Row(
        //       children: [
        //         const Column(
        //           crossAxisAlignment: CrossAxisAlignment.center,
        //           children: [
        //             Spacer(
        //               flex: 2,
        //             ),
        //             Text(
        //               "Look Awesome",
        //               style: TextStyle(
        //                   color: Color(0xffffffff),
        //                   fontSize: 16,
        //                   fontWeight: FontWeight.bold,
        //                   letterSpacing: 1),
        //               textAlign: TextAlign.center,
        //             ),
        //             SizedBox(
        //               height: 5,
        //             ),
        //             Text(
        //               "& Save Some",
        //               style: TextStyle(
        //                 color: Color(0xffffffff),
        //                 fontWeight: FontWeight.bold,
        //                 fontStyle: FontStyle.italic,
        //                 fontSize: 16,
        //               ),
        //               textAlign: TextAlign.center,
        //             ),
        //             Spacer(),
        //             Btn(text: "Get upto 20% off"),
        //           ],
        //         ),
        //         const Spacer(),
        //         Align(
        //           child: Image.network(
        //             "https://firebasestorage.googleapis.com/v0/b/auth1-c0c5f.appspot.com/o/IMG_4917.JPG?alt=media&token=a90052de-6f3f-4feb-8447-dff948e2a942",
        //             width: 140,
        //             height: 400,
        //             fit: BoxFit.cover,
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
      ],
      options: CarouselOptions(
        // autoPlayInterval: Duration(seconds: 1),
        disableCenter: true,
        reverse: false,
        enableInfiniteScroll: false,
        height: 180.0,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 10 / 8,
        autoPlayCurve: Curves.easeInOut,
        autoPlayAnimationDuration: const Duration(milliseconds: 900),
        viewportFraction: 0.78,
      ),
    );
  }
}

class Btn extends StatelessWidget {
  final String text;
  const Btn({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(1),
      height: 32,
      width: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: const Color.fromARGB(221, 44, 136, 228),
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(255, 103, 115, 69),
            Color.fromARGB(119, 122, 148, 5),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
          child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
            color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700),
      )),
    );
  }
}
