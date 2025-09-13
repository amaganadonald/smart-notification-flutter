
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String value;
  final bool isPassword;
  final String label;
  final Widget? icon;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;

  const TextFieldWidget({
    super.key,
    required this.value,
    this.isPassword = false,
    required this.controller,
    this.onChanged, 
    required this.label, this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: value,
          hintStyle: const TextStyle(color: Colors.grey),
          border: InputBorder.none,
          labelText: label,
          prefixIcon: icon
        ),
      ),
    );
  }
}