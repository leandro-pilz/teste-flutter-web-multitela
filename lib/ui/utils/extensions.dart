import 'package:flutter/material.dart';

import '../../core/entities/user_entity.dart';

extension UserProfileTypes on UserProfile {
  Color colorTypeUserProfile() {
    return switch (this) {
      UserProfile.admin => Colors.red,
      UserProfile.manager => Colors.green,
      UserProfile.sales => Colors.blue,
    };
  }
}
