import 'package:flutter/material.dart';

class TermsCheckBox extends StatefulWidget {
  final double lenght;
  final void Function()? moveToNext;
  const TermsCheckBox({super.key, required this.lenght, this.moveToNext});

  @override
  State<TermsCheckBox> createState() => _TermsCheckBoxState();
}

class _TermsCheckBoxState extends State<TermsCheckBox> {
  bool isAgree = false;
  final ScrollController _controller = ScrollController();

  void agree(value) {
    setState(() {
      isAgree = true;
    });
  }

  void disagree(value) {
    setState(() {
      isAgree = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.lenght,
      height: widget.lenght,
      padding: const EdgeInsets.all(30.0),
      decoration: BoxDecoration(
          border: Border.all(width: 3.0, color: Colors.white),
          borderRadius: BorderRadius.circular(24.0),
          color: Colors.white.withOpacity(0.1)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 8,
            child: Column(
              children: [
                _header(),
                _terms(),
                _check(),
              ],
            ),
          ),
          Expanded(flex: 2, child: _button()),
        ],
      ),
    );
  }

  Widget _terms() {
    return Flexible(
      child: Container(
        padding: const EdgeInsets.all(2.0),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 1.0, color: Colors.black)),
        child: SingleChildScrollView(child: Text('약관내용' * 10000)),
      ),
    );
  }

  Widget _header() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        '약관 내용',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _check() {
    return Row(
      children: [
        Checkbox(value: (isAgree) ? true : false, onChanged: agree),
        const Text('동의'),
        Checkbox(value: (isAgree) ? false : true, onChanged: disagree),
        const Text('동의하지 않음')
      ],
    );
  }

  Widget _button() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              onPressed: (isAgree) ? widget.moveToNext : null,
              child: const Text('다음'))),
    );
  }
}
