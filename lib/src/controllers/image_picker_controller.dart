import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class ImagePickerController extends GetxController {
  final Rx<List<XFile>> _images = Rx<List<XFile>>([]);
  final Rx<List<Uint8List>> _webImages = Rx<List<Uint8List>>([]);
  final ImagePicker picker;
  ImagePickerController({
    required this.picker,
  });

  List<XFile> get images => _images.value;
  List<Uint8List> get webImages => _webImages.value;

  Future<void> pickImages() async {
    try {
      if (kIsWeb) {
        picker.pickImage(source: ImageSource.gallery).then((XFile? image) {
          if (image != null) {
            image.readAsBytes().then((memory) {
              _webImages.value.add(memory);
              _webImages.refresh();
            });
          }
        });
      } else {
        picker.pickImage(source: ImageSource.gallery).then((XFile? image) {
          if (image != null) {
            _images.value.add(image);
            _images.refresh();
          }
        });
      }
    } catch (e) {
      throw Exception("Load Image Failed...");
    }
  }

  void deleteImage(int index) {
    if (kIsWeb) {
      _webImages.value.removeAt(index);
      _webImages.refresh();
    } else {
      _images.value.removeAt(index);
      _images.refresh();
    }
  }
}
