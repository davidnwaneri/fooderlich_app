import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class BuildDateField extends StatelessWidget {
  const BuildDateField({
    Key? key,
    required DateTime date,
    required this.onSetDate
  })  : _dueDate = date,
        super(key: key);
  final DateTime _dueDate;
  final void Function() onSetDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Date',
              style: GoogleFonts.lato(fontSize: 28.0),
            ),
            TextButton(
              onPressed: onSetDate,
              child: const Text('Select'),
            ),
          ],
        ),
        Text(DateFormat('yyyy-MM-dd').format(_dueDate)),
      ],
    );
  }
}
