import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final TextInputType textInputType;
  const TextFieldInput({
    Key? key, 
    required this.textEditingController, 
    required this.isPass,
    required this.hintText,
    required this.textInputType
  }): super(key: key);

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