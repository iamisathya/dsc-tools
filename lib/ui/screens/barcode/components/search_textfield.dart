import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchTextfield extends StatelessWidget {
  const SearchTextfield({
    Key? key,
    required this.textFieldController,
    required this.onSubmit,
    required this.onScan,
    required this.labelText,
    required this.icon,
  }) : super(key: key);

  final TextEditingController textFieldController;
  final Function onSubmit;
  final Function onScan;
  final String labelText;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 94,
      color: const Color(0xFF76E5DE),
      child: Container(
        margin: const EdgeInsets.all(20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: const Color(0xFFFFFFFF),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: textFieldController,
                onSubmitted: (val) => onSubmit(),
                textInputAction: TextInputAction.go,
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFFFFFFF), width: 0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFFFFFFF), width: 0),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFFFFFFF), width: 0),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 50,
              child: GestureDetector(
                  onTap: () => onScan(),
                  child: SvgPicture.asset(icon, width: 20, height: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
