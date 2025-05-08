import 'package:flutter/material.dart';
import 'package:inn_subs/core/widgets/circular_icon.dart';

class IconsPresenter extends StatelessWidget {
  const IconsPresenter({super.key, required this.icons});
  final List<String> icons;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      alignment: Alignment.center,
      child: LayoutBuilder(
        builder: (context, constraints) {
          double w = constraints.maxWidth;
          double iconSize = w * .22;
          return Stack(
            children: [
              Positioned(
                left: w * .07,
                child: CircularIcon(size: iconSize, iconPath: icons[0]),
              ),
              Positioned(
                left: w * .23,
                child: CircularIcon(size: iconSize, iconPath: icons[1]),
              ),
              Positioned(
                right: w * .07,
                child: CircularIcon(size: iconSize, iconPath: icons[2]),
              ),
              Positioned(
                right: w * .23,
                child: CircularIcon(size: iconSize, iconPath: icons[3]),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: CircularIcon(size: iconSize, iconPath: icons[4]),
              ),
            ],
          );
        },
      ),
    );
  }
}
