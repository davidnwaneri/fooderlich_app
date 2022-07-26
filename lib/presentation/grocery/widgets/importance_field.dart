import 'package:flutter/material.dart';
import 'package:fooderlich_app/api/models/models.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildImportantField extends StatelessWidget {
  const BuildImportantField({
    Key? key,
    required this.importance,
    required this.onLowSelected,
    required this.onMediumSelected,
    required this.onHighSelected,
  }) : super(key: key);

  final Importance importance;
  final void Function(bool _) onLowSelected;
  final void Function(bool _) onMediumSelected;
  final void Function(bool _) onHighSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Importance',
          style: GoogleFonts.lato(fontSize: 28.0),
        ),
        Wrap(
          spacing: 10.0,
          children: [
            ChoiceChip(
              selectedColor: Colors.black,
              selected: importance == Importance.low,
              label: const Text(
                'low',
                style: TextStyle(color: Colors.white),
              ),
              onSelected: onLowSelected,
            ),
            ChoiceChip(
                selectedColor: Colors.black,
                selected: importance == Importance.medium,
                label: const Text(
                  'medium',
                  style: TextStyle(color: Colors.white),
                ),
                onSelected: onMediumSelected),
            ChoiceChip(
              selectedColor: Colors.black,
              selected: importance == Importance.high,
              label: const Text(
                'high',
                style: TextStyle(color: Colors.white),
              ),
              onSelected: onHighSelected,
            ),
          ],
        )
      ],
    );
  }
}
