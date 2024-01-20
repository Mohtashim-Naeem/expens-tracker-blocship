import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:expense_tracker_blocship/app/app.router.dart';
import 'package:expense_tracker_blocship/models/entry.dart';
import 'package:expense_tracker_blocship/views/add_entry/add_entry_viewmodel.dart';
import 'package:expense_tracker_blocship/views/add_entry/widgets/custom_texfield.dart';
import 'package:expense_tracker_blocship/views/add_entry/widgets/numeric_keypad.dart';
import 'package:expense_tracker_blocship/views/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AddEntry extends StatelessWidget {
  const AddEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => AddEntryViewModel(),
        builder: (context, viemodel, child) {
          return GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: SafeArea(
              child: Scaffold(
                backgroundColor: const Color(0xffeae8e9),
                floatingActionButton: FloatingActionButton(
                  shape: const CircleBorder(),
                  onPressed: () async {
                    viemodel.addEntry();
                    // viemodel.entryService.entries.add(
                    //   Entry(
                    //     'Salary Deposit',
                    //     'Description for Entry 1. This is an expense.',
                    //     DateTime.now(),
                    //     DateTime.now(),
                    //     'Expense',
                    //     '50',
                    //   ),
                    // );

                    NavigationService().navigateToHomeView();
                  },
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  child: const Icon(Icons.check),
                ),
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Form(
                    key: viemodel.formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          CustomTextField(
                            controller: viemodel.titleController,
                            currentFocus: viemodel.titleFocus,
                            nextFocus: viemodel.descriptionFocus,
                            hint: 'Tittle',
                            maxLines: 1,
                          ),
                          const SizedBox(
                            height: 10,
                          ),

                          TextField(
                            controller: viemodel.descriptionController,
                            focusNode: viemodel.descriptionFocus,
                            textInputAction: TextInputAction.done,
                            maxLines: 6,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              hintText: 'Description',
                              hintStyle:
                                  const TextStyle(color: Color(0xffa1a1a1)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () async {
                              final pickedDate = await showDatePicker(
                                builder: (context, child) {
                                  return Theme(
                                      data: Theme.of(context).copyWith(
                                          colorScheme: const ColorScheme.light(
                                        primary: Colors.indigo,
                                      )),
                                      child: child!);
                                },
                                context: context,
                                initialDate:
                                    viemodel.selectedDate ?? DateTime.now(),
                                firstDate: DateTime(1960),
                                lastDate: DateTime.now(),
                              );
                              if (pickedDate != null) {
                                viemodel.selectedDate = pickedDate;
                                viemodel.rebuildUi();
                              }
                            },
                            child: Container(
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              height: 52,
                              width: MediaQuery.sizeOf(context).width,
                              child: Text(
                                viemodel.selectedDate != null
                                    ? '${viemodel.selectedDate!.day}/${viemodel.selectedDate!.month}/${viemodel.selectedDate!.year}'
                                    : 'Choose date',
                                style:
                                    const TextStyle(color: Color(0xffa1a1a1)),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () async {
                              final pickedTime = await showTimePicker(
                                builder: (context, child) {
                                  return Theme(
                                      data: Theme.of(context).copyWith(
                                          colorScheme: const ColorScheme.light(
                                        primary: Colors.indigo,
                                      )),
                                      child: child!);
                                },
                                context: context,
                                initialTime:
                                    viemodel.selectedTime ?? TimeOfDay.now(),
                              );
                              if (pickedTime != null) {
                                viemodel.selectedTime = pickedTime;
                                viemodel.rebuildUi();
                              }
                            },
                            child: Container(
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              height: 52,
                              width: MediaQuery.sizeOf(context).width,
                              child: Text(
                                viemodel.selectedTime != null
                                    ? '${viemodel.selectedTime!.hour}:${viemodel.selectedTime!.minute} ${viemodel.selectedTime!.period == DayPeriod.am ? 'AM' : 'PM'} '
                                    : 'Choose Time',
                                style:
                                    const TextStyle(color: Color(0xffa1a1a1)),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                            controller: viemodel.ammountController,
                            currentFocus: viemodel.ammountFocus,
                            hint: 'Ammount',
                            maxLines: 1,
                            enable: false,
                          ),
                          // Container(
                          //   child: Text('${viemodel.value}'),
                          // ),
                          const SizedBox(
                            height: 10,
                          ),
                          NumericKeypad(
                            controller: viemodel.ammountController,
                          ),
                          const SizedBox(
                            height: 100,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
