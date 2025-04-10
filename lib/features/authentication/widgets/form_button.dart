import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class FormButton extends StatelessWidget {
  const FormButton({super.key, required this.disabled, this.formtext = "Next"});

  final bool disabled;
  final String formtext;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: AnimatedContainer(
        padding: EdgeInsets.symmetric(vertical: Sizes.size16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.size5),
          color:
              disabled
                  ? Colors.grey.withAlpha(50)
                  : Theme.of(context).primaryColor,
        ),
        duration: Duration(milliseconds: 300),
        child: AnimatedDefaultTextStyle(
          duration: Duration(milliseconds: 300),
          style: TextStyle(
            color: disabled ? Colors.grey.withAlpha(40) : Colors.white,
            fontWeight: FontWeight.w400,
          ),
          child: Text(formtext, textAlign: TextAlign.center),
        ),
      ),
    );
  }
}
