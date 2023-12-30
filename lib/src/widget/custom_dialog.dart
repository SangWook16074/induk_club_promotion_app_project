import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final Widget? title;
  final Widget? content;
  final void Function()? confirm;
  final void Function()? cancel;
  const CustomDialog({
    super.key,
    this.title,
    this.content,
    this.confirm,
    this.cancel,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      backgroundColor: Colors.white,
      child: SizedBox(
        width: 350,
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: title,
            ),
            const Divider(),
            Expanded(
                child: Container(
              child: content,
            )),
            Container(
              color: const Color(0xff731eff),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 8.0),
                    child: GestureDetector(
                      onTap: confirm,
                      child: const Text(
                        "확인",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 8.0),
                    child: GestureDetector(
                      onTap: cancel,
                      child: const Text(
                        "취소",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
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
