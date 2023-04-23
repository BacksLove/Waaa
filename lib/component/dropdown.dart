import 'package:flutter/material.dart';

import '../core/theme/colors.dart';

class WaaaDropdownWidget<T> extends StatefulWidget {
  final String labelText;
  final List<T> items;
  final T selectedItem;
  final void Function(T) onChanged;

  const WaaaDropdownWidget({
    Key? key,
    required this.labelText,
    required this.items,
    required this.onChanged,
    required this.selectedItem,
  }) : super(key: key);

  @override
  DropdownWidgetState<T> createState() => DropdownWidgetState<T>();
}

class DropdownWidgetState<T> extends State<WaaaDropdownWidget<T>> {
  late T _selectedItem;

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.selectedItem;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: TextStyle(
          color: lightGrayColor,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: lightGrayColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(50.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: lightGrayColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
      value: _selectedItem,
      onChanged: (value) {
        if (value != null) {
          setState(() {
            _selectedItem = value;
          });
          widget.onChanged(value);
        }
      },
      items: widget.items.map((item) {
        return DropdownMenuItem<T>(
          value: item,
          child: Text(item.toString()),
        );
      }).toList(),
      isExpanded: true,
      hint: Text(widget.labelText),
    );
  }
}
