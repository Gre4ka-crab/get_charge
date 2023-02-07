import 'package:flutter/material.dart';

class DefaultInput extends StatelessWidget {
  final TextEditingController? controller;
  final String? placeholder;
  final bool? readOnly;

  const DefaultInput({Key? key, this.controller, this.placeholder, this.readOnly}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.black26),
      decoration: InputDecoration(
        label: Text(placeholder ?? ''),
        labelStyle: const TextStyle(fontSize: 12),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
      readOnly: readOnly ?? false,
    );
  }
}
