import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildQuantityField extends StatelessWidget {
  const BuildQuantityField({
    Key? key,
    required this.colour,
    required this.sliderValue,
    required this.onSliderValueChanged,
  }) : super(key: key);

  final int sliderValue;
  final Color colour;
  final void Function(double value) onSliderValueChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              'Quantity',
              style: GoogleFonts.lato(fontSize: 28.0),
            ),
            const SizedBox(width: 16.0),
            Text(
              sliderValue.toString(),
              style: GoogleFonts.lato(fontSize: 18.0),
            ),
          ],
        ),
        Slider(
          inactiveColor: colour.withOpacity(0.5),
          activeColor: colour,
          value: sliderValue.toDouble(),
          min: 0.0,
          max: 50.0,
          divisions: 100,
          label: sliderValue.toString(),
          onChanged: onSliderValueChanged,
        ),
      ],
    );
  }
}
