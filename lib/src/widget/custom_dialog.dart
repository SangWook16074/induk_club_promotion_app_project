import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final double? width;
  final Widget? content;
  final void Function()? confirm;
  final void Function()? cancel;
  const CustomDialog({
    super.key,
    required this.title,
    this.content,
    this.confirm,
    this.cancel,
    this.width = 400,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      backgroundColor: Colors.white,
      alignment: Alignment.center,
      child: SizedBox(
        width: width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.error_outline,
                      color: Color(0xff713eff),
                    ),
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 14,
                        color: Colors.purple,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            const Divider(),
            Container(
              child: content,
            ),
            Container(
              decoration: const BoxDecoration(
                  color: Color(0xff713eff),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12.0),
                      bottomRight: Radius.circular(12.0))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
