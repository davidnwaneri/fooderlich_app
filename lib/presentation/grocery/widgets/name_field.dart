import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Display a text field that displays the name of the [GroceryItem] being edited or created.
class BuildNameField extends StatelessWidget {
  const BuildNameField({
    Key? key,
    required this.controller,
    required this.colour,
  }) : super(key: key);
  final TextEditingController controller;
  final Color colour;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Item Name',
          style: GoogleFonts.lato(fontSize: 28.0),
        ),
        TextField(
          controller: controller,
          cursorColor: colour,
          decoration: InputDecoration(
            hintText: 'E.g. Tomatoe, Banana, Avocado',
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: colour),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: colour),
            ),
          ),
        ),
      ],
    );
  }
}
