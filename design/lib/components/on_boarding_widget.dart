import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'model/On_boarding_model.dart';

class OnBoardingWidget extends StatelessWidget {
  final OnBoardingModel model;

  const OnBoardingWidget({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              left: Constants.padding,
              top: Constants.avatarRadius + Constants.padding,
              right: Constants.padding,
              bottom: Constants.padding,
            ),
            margin: EdgeInsets.only(top: Constants.avatarRadius),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(Constants.padding),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: 12),
                Text(
                  model.title,
                  style: theme.textTheme.headline6
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 15),
                Text(
                  model.description,
                  style: theme.textTheme.bodyText2
                      .copyWith(fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 22),
              ],
            ),
          ),
          Positioned(
            left: Constants.padding,
            right: Constants.padding,
            child: CircleAvatar(
              backgroundColor: Color(0xFF232127),
              radius: Constants.avatarRadius,
              child: ClipRRect(
                  borderRadius:
                      BorderRadius.all(Radius.circular(Constants.avatarRadius)),
                  child: SvgPicture.asset(model.localImageSrc)),
            ),
          ),
        ],
      ),
    );
  }
}

class Constants {
  Constants._();

  static const double padding = 8;
  static const double avatarRadius = 45;
}
