import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:flutter/material.dart';

class AuthField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;

  const AuthField({
    super.key,
    required this.hintText,
    required this.controller,
  });

  @override
  State<AuthField> createState() => _AuthFieldState();
}

class _AuthFieldState extends State<AuthField> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          color: AppPallete.label2Color,
          fontSize: 18,
        ),
        suffixIcon: widget.hintText.toLowerCase().contains('password')
            ? Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: IconButton(
                  icon: Icon(
                    _isObscure ? Icons.visibility_off : Icons.visibility,
                    color: AppPallete.errorColor,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure; // Toggle visibility
                    });
                  },
                ),
              )
            : null,
      ),
      style: const TextStyle(color: AppPallete.label3Color, fontSize: 18),
      validator: (value) {
        if (value!.isEmpty) {
          return "${widget.hintText} is missing";
        }
        return null;
      },
      obscureText: _isObscure,
    );
  }
}
