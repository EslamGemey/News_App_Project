import 'package:flutter/material.dart';

class Btn extends StatelessWidget {
  //
  Btn({ @required this.Validate});

   Function Validate;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // controller: controller,

      validator: Validate(),
      decoration: InputDecoration(
        labelText: 'Enter',
        border: OutlineInputBorder(),
        prefixIcon: Icon(
            Icons.camera
        ),
        // suffixIcon: Icon(
        //     iconsuffix
        // )

      ),
    );
  }}