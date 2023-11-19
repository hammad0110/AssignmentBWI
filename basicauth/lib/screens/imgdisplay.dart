import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class Imagedisplay extends StatefulWidget {
  const Imagedisplay({super.key});

  @override
  State<Imagedisplay> createState() => _ImagedisplayState();
}

class _ImagedisplayState extends State<Imagedisplay> {
  late String imageurl;
  final storage = FirebaseStorage.instance;
  @override
  void initState() {
    super.initState();
    imageurl = '';
    getImageUrl();
  }

  Future<void> getImageUrl() async {
    final ref = storage.ref().child('IMG_4915.JPG');
    final url = await ref.getDownloadURL();
    setState(() {
      imageurl = url;
    });
  }

  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
