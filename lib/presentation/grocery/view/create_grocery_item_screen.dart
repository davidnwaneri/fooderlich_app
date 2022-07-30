// packages
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';
// views
import '../widgets/widgets.dart';
import 'grocery_item_tile.dart';
//
import 'package:fooderlich_app/api/models/models.dart';
import 'package:fooderlich_app/presentation/grocery/bloc/grocery_list_bloc.dart';

/// A route where an already exising [GroceryItem] is edited, or a new one is created.
class CreateGroceryItemScreen extends StatefulWidget {

  const CreateGroceryItemScreen({
    Key? key,
    this.groceryItemToEdit,
  })  : isEditing = (groceryItemToEdit != null),
        super(key: key);

  final GroceryItem? groceryItemToEdit;
  // if true, the screen is in edit mode, otherwise it is in create mode.
  final bool isEditing;

  @override
  State<CreateGroceryItemScreen> createState() => _CreateGroceryItemScreenState();
}

class _CreateGroceryItemScreenState extends State<CreateGroceryItemScreen> {
  late final TextEditingController _nameController;
  String _name = '';
  Importance _importance = Importance.low;
  Color _currentColour = Colors.green;
  int _sliderValue = 0;
  DateTime _dueDate = DateTime.now();
  TimeOfDay _timeOfDay = TimeOfDay.now();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(
      text: widget.groceryItemToEdit?.name,
    );
    final groceryItem = widget.groceryItemToEdit;
    if (groceryItem != null) {
      _name = groceryItem.name;
      _importance = groceryItem.importance;
      _currentColour = groceryItem.colour;
      _sliderValue = groceryItem.quantity;
      _dueDate = groceryItem.date;
      _timeOfDay = TimeOfDay.fromDateTime(groceryItem.date);
    }

    _nameController.addListener(() {
      setState(() {
        _name = _nameController.text;
      });
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void onUpdateOrCreateGroceryItem(BuildContext context) {
    final groceryItem = GroceryItem(
      id: widget.groceryItemToEdit?.id ?? const Uuid().v4(),
      name: _name,
      importance: _importance,
      colour: _currentColour,
      date: DateTime(
        _dueDate.year,
        _dueDate.month,
        _dueDate.day,
        _timeOfDay.hour,
        _timeOfDay.minute,
      ),
      quantity: _sliderValue,
    );
    if (widget.isEditing) {
      context.read<GroceryListBloc>().add(EditGroceryItem(groceryItem: groceryItem));
      context.router.pop();
    } else {
      context.read<GroceryListBloc>().add(AddGroceryItem(groceryItem: groceryItem));
      context.router.pop();
    }
  }

  void onSetDate() async {
    final currentDate = DateTime.now();

    final selectedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: currentDate,
      lastDate: DateTime(currentDate.year + 5),
    );

    setState(() {
      if (selectedDate != null) {
        _dueDate = selectedDate;
      }
    });
  }

  void onSetTime() async {
    final timeOfDay = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );

    setState(() {
      if (timeOfDay != null) {
        _timeOfDay = timeOfDay;
      }
    });
  }

  void onSelectColour(color) {
    setState(() => _currentColour = color);
  }

  void onSliderValueChanged(double value) {
    setState(() => _sliderValue = value.toInt());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          widget.isEditing ? 'Edit Grocery Item' : 'Create Grocery Item',
          style: GoogleFonts.lato(fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () => onUpdateOrCreateGroceryItem(context),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          BuildNameField(controller: _nameController, colour: _currentColour),
          BuildImportantField(
            importance: _importance,
            onLowSelected: (_) {
              setState(() => _importance = Importance.low);
            },
            onMediumSelected: (_) {
              setState(() => _importance = Importance.medium);
            },
            onHighSelected: (_) {
              setState(() => _importance = Importance.high);
            },
          ),
          BuildDateField(
            date: _dueDate,
            onSetDate: onSetDate,
          ),
          BuildTimeField(
            onSetTime: onSetTime,
            timeOfDay: _timeOfDay,
          ),
          BuildColourPickerField(
            colour: _currentColour,
            onSelectColour: onSelectColour,
          ),
          BuildQuantityField(
            colour: _currentColour,
            sliderValue: _sliderValue,
            onSliderValueChanged: onSliderValueChanged,
          ),
          GroceryItemTile(
            item: GroceryItem(
              id: widget.groceryItemToEdit?.id ?? const Uuid().v4(),
              name: _name,
              importance: _importance,
              colour: _currentColour,
              quantity: _sliderValue,
              date: DateTime(
                _dueDate.year,
                _dueDate.month,
                _dueDate.day,
                _timeOfDay.hour,
                _timeOfDay.minute,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
