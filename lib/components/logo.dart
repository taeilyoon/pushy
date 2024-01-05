import 'package:flutter/material.dart';
import 'package:pushy/global.dart';

import '../colors.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key, this.size = 80}) : super(key: key);
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(shape: BoxShape.circle, color: Theme.of(context).primaryColor),
        child: Image.asset(
            Global.flavor == "boss"
 ?            "assets/icon/prime.png" : "assets/icon/LINE_ICON.png",  width: size, height: size));
  }
}
