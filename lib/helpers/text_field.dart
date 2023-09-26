import 'package:flutter/material.dart';

class UserInput extends StatelessWidget {
  final String? initialValue;
  final TextInputType keyboardType;
  final Function(String)? onChanged;

  UserInput({
    this.initialValue,
    this.keyboardType = TextInputType.text,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    const greyTextStyle = TextStyle(color: Colors.grey);
    return Row(
      children: [
          Text(
            '€', 
            style: greyTextStyle,
          ),
          SizedBox(width: 2,),
        Container(
          padding: EdgeInsets.only(bottom: 6),
          width: 60,
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
          child: TextFormField(
            style: greyTextStyle,
            initialValue: initialValue,
            keyboardType: keyboardType,
            textAlign: TextAlign.center,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
