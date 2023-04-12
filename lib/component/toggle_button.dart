import 'package:flutter/material.dart';

class ToggleButton extends StatefulWidget {
  final String trueText;
  final String falseText;
  final Function(bool) onChanged;

  ToggleButton({required this.trueText, required this.falseText, required this.onChanged});

  @override
  _ToggleButtonState createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
    );
  }
}