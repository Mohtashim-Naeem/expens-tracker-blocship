import 'package:expense_tracker_blocship/views/add_entry/add_entry_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class AddEntry extends StatelessWidget {
  const AddEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => AddEntryViewModel(),
        builder: (context, viemodel, child) {
          return const Scaffold();
        });
  }
}
