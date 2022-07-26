import 'package:flutter/material.dart';
import 'package:fooderlich_app/api/models/grocery_item.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

/// Displays a [GroceryItem].
class GroceryItemTile extends StatelessWidget {
  GroceryItemTile({
    Key? key,
    required this.item,
    this.onToggleIsComplete,
  })  : textDecoration = item.isComplete ? TextDecoration.lineThrough : TextDecoration.none,
        super(key: key);

  final GroceryItem item;
  final void Function(bool? value)? onToggleIsComplete;
  final TextDecoration textDecoration;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(width: 5.0, color: item.colour),
              const SizedBox(width: 16.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: (GoogleFonts.lato(
                      decoration: textDecoration,
                      fontSize: 21.0,
                      fontWeight: FontWeight.bold,
                    )),
                  ),
                  const SizedBox(height: 4.0),
                  _buildDate(),
                  const SizedBox(height: 4.0),
                  _buildImportance(),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                item.quantity.toString(),
                style: GoogleFonts.lato(decoration: textDecoration, fontSize: 21.0),
              ),
              _buildCheckbox(),
            ],
          ),
        ],
      ),
    );
  }

  Text _buildImportance() {
    if (item.importance == Importance.low) {
      return Text('Low', style: GoogleFonts.lato(decoration: textDecoration));
    } else if (item.importance == Importance.medium) {
      return Text('Medium', style: GoogleFonts.lato(fontWeight: FontWeight.w800, decoration: textDecoration));
    } else {
      return Text(
        'High',
        style: GoogleFonts.lato(
          color: Colors.red,
          fontWeight: FontWeight.w900,
          decoration: textDecoration,
        ),
      );
    }
  }

  Text _buildDate() {
    final dateFormatter = DateFormat('MMMM dd h:mm a');
    final dateString = dateFormatter.format(item.date);
    return Text(
      dateString,
      style: TextStyle(decoration: textDecoration),
    );
  }

  Checkbox _buildCheckbox() {
    return Checkbox(
      value: item.isComplete,
      onChanged: onToggleIsComplete,
    );
  }

  //
}
