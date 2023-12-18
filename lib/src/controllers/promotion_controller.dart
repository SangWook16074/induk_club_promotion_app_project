import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/data/repository/promotion_repository.dart';

import '../data/model/promotion.dart';

class PromotionController extends GetxController {
  final Rx<List<Promotion>> _promotions = Rx<List<Promotion>>([]);
  final PromotionRepository promotionRepository;
  PromotionController({required this.promotionRepository});

  List<Promotion> get promotions => _promotions.value;
  @override
  void onReady() {
    super.onReady();
    _fetchData();
  }

  void _fetchData() async {
    promotionRepository
        .getPromotions()
        .then((data) => _promotions.value = data)
        .then((_) {
      print(_promotions.value);
    });
  }

  void createPromotion() {
    final data = {
      "userName": "한상욱",
      "club": "A&I",
      "createAt": DateTime.now().toString(),
      "closeAt": DateTime.now().toString(),
      "title": "A&I 신규 동아리원 모집",
      "content":
          "2022학년도에 진행한 스터디그룹 활동으로 처음 모여 모바일 앱 개발 공부 및 협업 프로젝트를 진행했으며, 플레이스토어와 앱스토어에 정식 출시까비 했습니다. 그리고 현재는 새로운 프로젝트를 준비하고 있습니다.",
      "requiredPeople": 10,
      "begin": DateTime.now().toString(),
      "end": DateTime.now().toString(),
      "contentOfActivity":
          "UI/UX 디자인  프로젝트 화면 (UI)을 디자인하고, 이를 위한 미디어 파일 제작합니다.",
    };

    promotionRepository.postPromotion(data).then((result) {
      if (result != null) {
        _promotions.value.add(result);
        _promotions.refresh();
      }
    });
  }
}
