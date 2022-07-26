import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildTimeField extends StatelessWidget {
  const BuildTimeField({
    Key? key,
    required this.onSetTime,
    required this.timeOfDay,
  }) : super(key: key);

  final void Function()? onSetTime;
  final TimeOfDay timeOfDay;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Time of Day',
              style: GoogleFonts.lato(fontSize: 28.0),
            ),
            TextButton(
              onPressed: onSetTime,
              child: const Text('Select'),
            ),
          ],
        ),
        Text(timeOfDay.format(context)),
      ],
    );
  }
}
