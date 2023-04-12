import 'package:flutter/material.dart';

class DropdownWidget<T> extends StatefulWidget {
  final String labelText;
  final List<T> items;
  final T selectedItem;
  final void Function(T) onChanged;

  DropdownWidget({
    Key? key,
    required this.labelText,
    required this.items,
    required this.onChanged,
    required this.selectedItem,
  }) : super(key: key);

  @override
  _DropdownWidgetState<T> createState() => _DropdownWidgetState<T>();
}

class _DropdownWidgetState<T> extends State<DropdownWidget<T>> {
  late T _selectedItem;

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.selectedItem;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<T>(
      value: _selectedItem,
      onChanged: (value) {
        setState(() {
          _selectedItem = value!;
        });
        widget.onChanged(value!);
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