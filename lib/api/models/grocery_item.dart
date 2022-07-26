// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/painting.dart';

/// This reperesents the level of importance of a [GroceryItem]
enum Importance {
  low,
  medium,
  high,
}

/// This represents a grocery item that can be added to a grocery List
class GroceryItem extends Equatable {
  final String id;
  final String name;
  final Importance importance;
  final Color colour;
  final bool isComplete;
  final DateTime date;
  final int quantity;

  const GroceryItem({
    required this.id,
    required this.name,
    required this.importance,
    required this.colour,
    this.isComplete = false,
    required this.date,
    required this.quantity,
  });

  GroceryItem copyWith({
    String? name,
    Importance? importance,
    Color? colour,
    bool? isComplete,
    DateTime? date,
    int? quantity,
  }) {
    return GroceryItem(
      id: id,
      name: name ?? this.name,
      importance: importance ?? this.importance,
      colour: colour ?? this.colour,
      isComplete: isComplete ?? this.isComplete,
      date: date ?? this.date,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  List<Object?> get props => [id, name, importance, colour, isComplete, date, quantity];

  @override
  String toString() {
    return 'GroceryItem(id: $id, name: $name, $isComplete)';
  }
}
