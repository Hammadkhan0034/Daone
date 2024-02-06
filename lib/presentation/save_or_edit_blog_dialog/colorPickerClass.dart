import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';


class ColorPickerButton extends StatelessWidget {
  final Color color;
  final ValueChanged<Color> onColorChanged;

  ColorPickerButton({required this.color, required this.onColorChanged});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _pickColor(context);
      },
      style: ElevatedButton.styleFrom(primary: color),
      child: Text('Pick Color'),
    );
  }

  Future<void> _pickColor(BuildContext context) async {
    final Color? pickedColor = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pick a color'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: color,
              onColorChanged: onColorChanged,
              showLabel: true,
              pickerAreaHeightPercent: 0.8,
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(color);
              },
              child: const Text('Done'),
            ),
          ],
        );
      },
    );
    if (pickedColor != null && pickedColor != color) {
      onColorChanged(pickedColor);
    }
  }
}
