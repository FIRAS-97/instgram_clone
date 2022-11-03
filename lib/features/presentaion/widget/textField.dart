import 'package:flutter/material.dart';

import '../../../utilis/color_const/colors.dart';

class TextFieldWidget extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final TextInputType textInputType;
  final bool isPass;
  final Widget perf;
  final Widget? sufe;

  TextFieldWidget({
    Key? key,
    required this.controller,
    required this.textInputType,
    required this.hint,
    this.isPass = false,
    required this.perf,
    this.sufe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return TextFormField(
      obscureText: isPass,
      controller: controller,
      scrollPadding: EdgeInsets.all(50),
      decoration: InputDecoration(
          prefixIcon: perf,
          suffixIcon: sufe,
          filled: true,
          border: InputBorder.none,
          focusedBorder: inputBorder,
          enabledBorder: inputBorder,
          hintText: hint,
          hintStyle: TextStyle(color: primaryColor)),
      keyboardType: textInputType,
    );
  }
}
