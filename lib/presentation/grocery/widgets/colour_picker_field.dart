import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';

/// This uses a third party library widget [BlockPicker] which presents the user
/// with a colour palette to select a colour.
class BuildColourPickerField extends StatelessWidget {
  const BuildColourPickerField({
    Key? key,
    required this.colour,
    required this.onSelectColour,
  }) : super(key: key);

  final Color colour;
  final void Function(Color) onSelectColour;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 50.0,
              width: 10.0,
              color: colour,
            ),
            const SizedBox(width: 8.0),
            Text(
              'Color',
              style: GoogleFonts.lato(fontSize: 28.0),
            ),
          ],
        ),
        TextButton(
          child: const Text('Select'),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: BlockPicker(
                    pickerColor: Colors.white,
                    onColorChanged: onSelectColour,
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
