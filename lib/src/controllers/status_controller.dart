import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/constants/status.dart';

class StatusController extends GetxController {
  final Rx<Status> _status = Rx<Status>(Status.LOADED);

  Status get status => _status.value;

  void setStatus(Status status) {
    _status(status);
  }
}
