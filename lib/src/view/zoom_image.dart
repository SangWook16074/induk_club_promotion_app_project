import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class ZoomImage extends StatelessWidget {
  final String tag;
  final Uint8List? webImage;
  final File? image;
  const ZoomImage({super.key, required this.tag, this.webImage, this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Hero(
        tag: tag,
        child: Center(
          child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              child: (kIsWeb) ? Image.memory(webImage!) : Image.file(image!)),
        ),
      ),
    );
  }
}
