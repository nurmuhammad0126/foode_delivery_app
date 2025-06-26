import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_for_uicgroup/core/extensions/num_extensions.dart';

class WScreensAppbar extends StatelessWidget {
  final String? title;
  final SvgPicture? picture;

  WScreensAppbar({super.key, this.title, this.picture});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 36.w,
          height: 36.w,
        ),
      ],
    );
  }
}