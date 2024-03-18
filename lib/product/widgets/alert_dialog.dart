import 'package:flutter/material.dart';

import '../../core/init/init_app.dart';

void showMyDialog(String? error) {
  final SnackBar snackBar = SnackBar(
    content: Text(
      error ?? 'An error happend',
      style: const TextStyle(color: Colors.white, fontSize: 15),
    ),
    backgroundColor: Colors.red,
  );
  InitializeApp.snackbarKey.currentState?.showSnackBar(snackBar);
}
