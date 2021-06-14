import 'package:design/components/components.dart';
import 'package:design/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends StatelessWidget {
  final String assetName = 'assets/illustration.svg';
  TextTheme textTheme;
  @override
  Widget build(BuildContext context) {
    textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 32),
            AppLabel(),
            Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(vertical: 4.0),
              alignment: Alignment.center,
              child: SvgPicture.asset(assetName),
            ),
            _getHeading(),
            SizedBox(height: 62),
            CustomButton(
              label: 'Start',
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.onBoarding);
              },
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }


  Widget _getHeading() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: Text(
            'More than just shorter links',
            textAlign: TextAlign.center,
            style: textTheme.headline4.copyWith(
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(height: 2),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Build your brand\'s recognition and get detailed insight on how'
                'your links are performing',
            textAlign: TextAlign.center,
            style: textTheme.bodyText1.copyWith(
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
