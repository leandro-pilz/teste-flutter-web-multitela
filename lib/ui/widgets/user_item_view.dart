import 'package:flutter/material.dart';
import 'package:teste_widgets_web_app/core/entities/user_entity.dart';
import 'package:teste_widgets_web_app/ui/utils/constants.dart';
import 'package:teste_widgets_web_app/ui/utils/extensions.dart';

import '../utils/text_style_utils.dart';

class UserItemView extends StatelessWidget {
  final UserEntity user;

  const UserItemView({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: kHeightUserItemViewHeight,
          height: kHeightUserItemViewHeight,
          color: user.profile.colorTypeUserProfile(),
        ),
        const SizedBox(width: kSizedBoxMediumSpace),
        Text(
          user.name,
          style: veryLargeW500Style,
        ),
      ],
    );
  }
}
