import 'package:flutter/material.dart';

class AddTaskComponents extends StatelessWidget {
  const AddTaskComponents(
      {super.key,
      required this.title,
      required this.titleHint,
      this.controller,
      this.suffixIcon,
      this.readOnly = false});
  final String title;
  final String titleHint;
  final TextEditingController? controller;
  final IconButton? suffixIcon;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.displaySmall,
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: controller,
          decoration:
              InputDecoration(labelText: titleHint, suffixIcon: suffixIcon),
          readOnly: readOnly,
        ),
      ],
    );
  }
}
