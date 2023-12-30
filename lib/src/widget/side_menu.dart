import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideMenu extends StatefulWidget {
  final List<Widget> items;
  final List<Widget> expandItems;
  const SideMenu({
    super.key,
    required this.items,
    required this.expandItems,
  });

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  bool isExpand = true;

  void toggle() => setState(() {
        isExpand = !isExpand;
      });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          width: (isExpand) ? 200 : 100,
          height: double.infinity,
          color: const Color(0xff713eff),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(children: [
                Row(
                  children: [
                    Text('IDCP', style: Get.textTheme.displayLarge),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                ...(isExpand) ? widget.expandItems : widget.items
              ]),
            ),
          ),
        ),
        Positioned(
            top: 3.0,
            right: 3.0,
            child: GestureDetector(
              onTap: toggle,
              child: (isExpand)
                  ? const Icon(
                      Icons.remove,
                      color: Colors.white,
                    )
                  : const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
            )),
      ],
    );
  }
}
