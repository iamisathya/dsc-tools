import 'package:flutter/material.dart';
/*
  DropdownPicker(
    menuOptions: list of dropdown options in key value pairs,
    selectedOption: menu option string value,
    onChanged: (value) => print('changed'),
  ),
*/

class DropdownPicker extends StatelessWidget {
  const DropdownPicker(
      {required this.menuOptions,
      required this.selectedOption,
      required this.onChanged});

  final List<dynamic> menuOptions;
  final String selectedOption;
  final void Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
        items: menuOptions
            .map((data) => DropdownMenuItem<String>(
                  value: data.key as String,
                  child: Text(
                    data.value as String,
                  ),
                ))
            .toList(),
        value: selectedOption,
        onChanged: onChanged);
  }
}
