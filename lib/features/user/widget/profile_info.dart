import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class ProfileInfo extends StatelessWidget {
  final String numberText;
  final String infoText;
  const ProfileInfo({
    super.key,
    required this.numberText,
    required this.infoText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          numberText,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: Sizes.size20),
        ),
        Gaps.v3,
        Text(infoText, style: TextStyle(color: Colors.grey.shade500)),
      ],
    );
  }
}
