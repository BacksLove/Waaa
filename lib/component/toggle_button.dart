import 'package:flutter/material.dart';
import 'package:waaa/core/theme/colors.dart';

class WaaaToggleButton extends StatefulWidget {
  final String trueText;
  final String falseText;
  final Function(bool) onChanged;

  const WaaaToggleButton(
      {super.key,
      required this.trueText,
      required this.falseText,
      required this.onChanged});

  @override
  ToggleButtonState createState() => ToggleButtonState();
}

class ToggleButtonState extends State<WaaaToggleButton> {
  final List<bool> _isSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      isSelected: _isSelected,
      onPressed: (int index) {
        setState(() {
          for (int buttonIndex = 0;
              buttonIndex < _isSelected.length;
              buttonIndex++) {
            if (buttonIndex == index) {
              _isSelected[buttonIndex] = true;
            } else {
              _isSelected[buttonIndex] = false;
            }
          }
        });
        widget.onChanged(_isSelected[index]);
      },
      color: Colors.black,
      selectedColor: Colors.white,
      fillColor: primaryColor,
      borderColor: lightGrayColor,
      borderRadius: BorderRadius.circular(50.0),
      children: <Widget>[
        SizedBox(
          width: MediaQuery.of(context).size.width / 2.2,
          child: Text(
            widget.trueText,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 2.2,
          child: Text(
            widget.falseText,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );

    /*GestureDetector(
      onTap: () {
        setState(() {
          _value = !_value;
          widget.onChanged(_value);
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: _value ? Colors.green : Colors.grey,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Text(
          _value ? widget.trueText : widget.falseText,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );*/
  }
}
