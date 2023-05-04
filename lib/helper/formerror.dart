import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormError extends StatelessWidget {
  const FormError({
    Key? key,
    required this.errors,
  }) : super(key: key);

  final List<String?> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          errors.length, (index) => formErrorText(error: errors[index]!)),
    );
  }

  Row formErrorText({required String error}) {
    return Row(
      children: [
        // SvgPicture.asset(
        //   "assets/icons/Error.svg",
        //   height: 14,
        //   width:  14,
        // ),
         Icon(Icons.error_outline,
           size: 14,

         ),
        SizedBox(
          width: 10,
        ),
        Text(error),
      ],
    );
  }
}