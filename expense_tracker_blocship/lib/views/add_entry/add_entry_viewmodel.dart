import 'package:expense_tracker_blocship/app/app.locator.dart';
import 'package:expense_tracker_blocship/models/entry.dart';
import 'package:expense_tracker_blocship/services/entries_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AddEntryViewModel extends BaseViewModel {
  EntryService entryService = locator<EntryService>();

  NavigationService _navigationService = locator<NavigationService>();
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
        'Saving',
        ammountController.text,
      ),
    );
  }
}
