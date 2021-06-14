import 'package:design/components/components.dart';
import 'package:design/routes/routes.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnBoardingPage> {
  final _controller = PageController();
  int _currentPage = 0;
  ThemeData theme;

  AnimatedContainer _buildDots({int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        color: _currentPage == index ? Color(0xFF9E9AA7) : Colors.transparent,
        border: Border.all(color: Color(0xFF9E9AA7)),
      ),
      margin: const EdgeInsets.only(right: 5),
      height: 10,
      width: _currentPage == index ? 10 : 10,
      curve: Curves.easeInCirc,
    );
  }

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(flex: 2, child: AppLabel()),
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: _controller,
                      itemCount: splashData.length,
                      itemBuilder: (BuildContext context, int index) {
                        return OnBoardingWidget(model: splashData[index]);
                      },
                      onPageChanged: (value) =>
                          setState(() => _currentPage = value),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (int index) => _buildDots(index: index),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 32),
                  FlatButton(
                    onPressed: () {
                      if (_currentPage + 1 != splashData.length) {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeIn,
                        );

                        return;
                      }
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        Routes.dashboardPage,
                        (route) => false,
                      );
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF232127),
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
