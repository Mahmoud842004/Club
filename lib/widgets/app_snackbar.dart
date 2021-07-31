import 'package:club/constants.dart';
import 'package:flutter/material.dart';

SnackBar showsnackbar(String content) {
  return SnackBar(
    content: Text(
      content,
      style: textstyles['snack bar style'],
    ),
    backgroundColor: theme['white'],
  );
}
