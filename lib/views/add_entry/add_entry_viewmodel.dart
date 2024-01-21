import 'package:expense_tracker_blocship/app/app.locator.dart';
import 'package:expense_tracker_blocship/models/entry.dart';
import 'package:expense_tracker_blocship/services/entries_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class AddEntryViewModel extends BaseViewModel {
  EntryService entryService = locator<EntryService>();
  var selectGender = 'Select gender';

  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  final formKey = GlobalKey<FormState>();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController ammountController = TextEditingController();

  final FocusNode titleFocus = FocusNode();
  final FocusNode descriptionFocus = FocusNode();
  final FocusNode ammountFocus = FocusNode();

  addEntry() {
    entryService.entries.add(
      Entry(
        titleController.text,
        descriptionController.text,
        selectedDate!,
        selectedTime!,
        selectGender,
        ammountController.text,
      ),
    );
  }

  void setSelectGender(String value) {
    selectGender = value;
    rebuildUi();
  }

  void validateFields(BuildContext context) {
    if (selectedDate == null ||
        selectedTime == null ||
        selectGender == 'Select gender' ||
        titleController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        ammountController.text.isEmpty) {
      // Show a pop-up or handle the validation error in some way
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Validation Error'),
            content: const Text('Please fill in all required fields.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      // All fields are valid, proceed with the next steps
      // Add your logic here
    }
  }
}
