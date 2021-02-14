import 'package:flutter/material.dart';

class BotonFlecha extends StatelessWidget {
  final Function onPressed;
  final Widget child;

  BotonFlecha({this.onPressed, this.child});
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          child,
          Icon(Icons.arrow_right),
        ],
      ),
    );
  }
}
