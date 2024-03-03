import 'package:flutter/material.dart';

import '../../core/init/init_app.dart';

void showMyDialog(String? error) {
  showDialog(
      context: InitializeApp.navigatorKey.currentContext!,
      builder: (context) => Center(
            child: Material(
              color: Colors.transparent,
              child: Text(error ?? "An error happend"),
            ),
          ));
}
