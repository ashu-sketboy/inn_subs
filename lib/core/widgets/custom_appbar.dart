import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key, required this.controller});
  final CustomSegmentedController<int> controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: CustomSlidingSegmentedControl<int>(
              controller: controller,
              initialValue: 0,
              children: {
                0: CustomTab(value: 0, controller: controller, text: "General"),
                1: CustomTab(value: 1, controller: controller, text: "My Sabs"),
              },
              decoration: BoxDecoration(
                color: Color(0xff242526),
                borderRadius: BorderRadius.circular(50),
              ),
              thumbDecoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(50),
              ),
              duration: Duration(milliseconds: 100),
              curve: Curves.easeInToLinear,
              onValueChanged: (v) {
                // print(v);
              },
            ),
          ),
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.notifications_none)),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60);
}

class CustomTab extends StatefulWidget {
  const CustomTab({
    super.key,
    required this.value,
    required this.controller,
    required this.text,
  });
  final int value;
  final CustomSegmentedController<int> controller;
  final String text;

  @override
  State<CustomTab> createState() => _CustomTabState();
}

class _CustomTabState extends State<CustomTab> {
  bool selected = false;

  @override
  void initState() {
    selected = widget.value == (widget.controller.value ?? 0);
    widget.controller.addListener(() {
      setState(() {
        selected = widget.value == widget.controller.value;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.widgets_outlined),
        if (selected) ...{
          const SizedBox(width: 5),
          Text(
            widget.text,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        },
      ],
    );
  }
}
