import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  const TextFieldInput({super.key});

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context)
    );
    return TextField(
      controller: ,
      decoration: InputDecoration(
        hintText: inputBorder,
        border: inputBorder,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        filled:true,
        contentPadding: EdgeInsets.all(8)
      ),
      keyboardType: ,
      obscureText: ,
    );
  }
}