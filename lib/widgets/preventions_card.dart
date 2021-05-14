import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

class PreventionsCard extends StatelessWidget {
  final String title, image;
  const PreventionsCard({
    Key key,
    this.title,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: kBackgroundColor,
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(image),
        ),
        Text(
          title,
          style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
