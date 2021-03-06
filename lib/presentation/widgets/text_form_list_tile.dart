import 'package:flutter/material.dart';
import 'package:kumvent/constants/app_styles.dart';
import 'package:kumvent/constants/colours.dart';

class TextFormListTile extends StatelessWidget {
  final String text;
  final TextEditingController textController;
  final Widget? trailing;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool obscureText;

  const TextFormListTile({
    Key? key,
    required this.text,
    required this.textController,
    this.trailing,
    required this.validator,
    required this.keyboardType,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          text,
          style: TextStyles.semiBold(
            color: kNeutralColor,
            fontSize: 16.0,
          ),
        ),
        const Padding(padding: EdgeInsets.only(bottom: 10.0)),
        TextFormField(
          controller: textController,
          validator: validator,
          keyboardType: keyboardType,
          obscureText: obscureText,
          obscuringCharacter: '*',
          textInputAction: TextInputAction.next,
          onSaved: (value) {
            textController.text = value!;
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            suffixIcon: trailing,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 2.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(
                color: kBorderColor,
                width: 1.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(
                color: kBorderColor,
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(
                color: kPrimaryColor,
                width: 1.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
