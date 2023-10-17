import 'package:get/get.dart';

class AppController extends GetxController {
  final RxInt _pageIndex = 0.obs;

  int get pageIndex => _pageIndex.value;
}
