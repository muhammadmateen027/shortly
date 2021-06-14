import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppLabel extends StatelessWidget {
  final String assetName = 'assets/logo.svg';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      alignment: Alignment.center,
      child: SvgPicture.asset(assetName),
    );
  }
}
