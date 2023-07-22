import 'package:flutter/material.dart';

class ProductTextField extends StatelessWidget {
  final double width;
  final double height;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType? keyboardType;
  final String hintText;
  final Function validator;
  final EdgeInsets? contentPadding;
  final int? maxLength;

  const ProductTextField(
      {Key? key,
      required this.controller,
      required this.obscureText,
      required this.validator,
      required this.hintText,
      this.contentPadding,
       this.maxLength,
       this.keyboardType,
      required this.width,
      required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextFormField(
          controller: controller,
          obscureText: obscureText,
          cursorColor: Colors.black,
          keyboardType: keyboardType,
          maxLength: maxLength,
          validator: (value) => validator(value),
          decoration: InputDecoration(
            contentPadding: contentPadding,
            fillColor: const Color.fromRGBO(248, 248, 248, 1),
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.withOpacity(0.2),
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
              ),
            ),
          )),
    );
  }
}
