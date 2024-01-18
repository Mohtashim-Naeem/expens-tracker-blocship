import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class AddEntryViewModel extends BaseViewModel {
  int value = 0;

  final formKey = GlobalKey<FormState>();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController ammountController = TextEditingController();

  final FocusNode titleFocus = FocusNode();
  final FocusNode descriptionFocus = FocusNode();
  final FocusNode ammountFocus = FocusNode();
}
