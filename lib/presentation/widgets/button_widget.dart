import 'package:flutter/material.dart';

class ButtonWidget extends FlatButton {
  ButtonWidget.primary(
    BuildContext context, {
    String title,
    void Function() onPressed,
  }) : super(
          child: Text(title),
          onPressed: onPressed,
          color: Theme.of(context).primaryColor,
        );
}
