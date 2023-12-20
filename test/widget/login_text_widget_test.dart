import 'package:flutter_test/flutter_test.dart';
import 'package:induk_club_promotion_app_project/src/widget/login_text_field.dart';

void main() {
  group("로그인 텍스트 필드 위젯 테스트", () {
    test("로그인 텍스트 필드는 힌트 레이블이 존재함.", () {
      const widget = LoginTextField(
        hintText: "hint",
      );
      expect(widget.hintText, "hint");
    });
  });
}
