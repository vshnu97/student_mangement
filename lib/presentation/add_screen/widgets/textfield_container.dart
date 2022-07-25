import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controllr;
  final String name;
  const TextFieldWidget({Key? key, required this.controllr, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controllr,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: (name),
        ),
      ),
    );
  }
}
