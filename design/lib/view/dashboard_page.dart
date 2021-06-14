import 'package:design/bloc/bloc.dart';
import 'package:design/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'history_page.dart';

// ignore: must_be_immutable
class DashboardPage extends StatelessWidget {
  final String assetName = 'assets/illustration.svg';
  TextTheme textTheme;
  Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height * 0.75,
            child: BlocConsumer<ShortlyBloc, ShortlyState>(
              listener: (_, state) {
                if (state is LinkShortened) {
                  context.read<ShortlyBloc>()..add(LoadShortlyLink());
                }
              },
              builder: (_, state) {
                if (state is ShortlyInitial) {
                  return ListView(
                    children: [
                      SizedBox(height: 32),
                      AppLabel(),
                      SizedBox(height: 8),
                      Container(
                        width: double.maxFinite,
                        padding: EdgeInsets.symmetric(vertical: 4.0),
                        alignment: Alignment.centerRight,
                        child: SvgPicture.asset(assetName, height: size.height * 0.4),
                      ),
                      SizedBox(height: 12),
                      _getHeading(),
                    ],
                  );
                }

                return HistoryPage();
              },
            ),
          ),

          Container(height: size.height ,child: CustomEditor()),
        ],
      ),
    );
  }
  Widget _getHeading() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: Text(
            'Let\'s get started!',
            textAlign: TextAlign.center,
            style: textTheme.headline6.copyWith(
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(height: 2),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 64),
          child: Text(
            'Paste your first link into the field to shorten it',
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