import 'package:flutter/material.dart';

class ValidateText extends StatelessWidget {
  final double inputValidate;
  final double randomNumber;
  String text;
  ValidateText(this.inputValidate, this.randomNumber);
  void validate() {
    if (inputValidate < randomNumber)
      text = 'You tried $inputValidate Try lower';
    else if (inputValidate > randomNumber)
      text = 'You tried $inputValidate try higher';
    else if (inputValidate == randomNumber)
      text = 'You tried $inputValidate You guessed right.';
    else if (inputValidate == -1 && randomNumber == -1) text = 'Da';
  }

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}
