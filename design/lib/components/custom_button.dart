import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  bool isCopied;

  CustomButton({
    Key key,
    @required this.label,
    @required this.onPressed,
    this.isCopied =  false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: RaisedButton(
          onPressed: onPressed,
          color: !isCopied ? Theme.of(context).buttonColor : Color(0xFF232127),
          padding: const EdgeInsets.symmetric(vertical: 6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            label.toUpperCase(),
            style: Theme.of(context).textTheme.headline6.copyWith(
                  color: Colors.white,
                ),
          ),
        ),
      ),
    );
  }
}
