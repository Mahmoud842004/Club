import 'package:club/constants.dart';
import 'package:club/widgets/app_textfield.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ConfirmTextField extends StatelessWidget {
  const ConfirmTextField({required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(2.0),
        color: theme['white']!.withOpacity(0.5),
        child: AppTextField(
          controller: controller,
          hinttext: 'enter a story caption'.tr(),
        ),
      ),
    );
  }
}
