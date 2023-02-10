// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:spotify_quiz/custom_widgets/text.dart';
import 'package:spotify_quiz/utilities.dart' as utilities;

class CustomProfileUsername extends StatelessWidget {
  double sizeRadius;
  double widthRadius;
  CustomText usernameText;

  CustomProfileUsername({
    Key? key,
    this.widthRadius = 2.5,
    this.sizeRadius = 10.0,
    required this.usernameText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: utilities.primaryColor,
          width: widthRadius,
        ),
        borderRadius: BorderRadius.circular(sizeRadius),
      ),
      child: usernameText,
    );
  }
}
