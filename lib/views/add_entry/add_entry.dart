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
    var width = MediaQuery.sizeOf(context).width;
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
                    viemodel.validateFields(context);
                    viemodel.addEntry();

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
                            maxLength: 30,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            controller: viemodel.descriptionController,
                            focusNode: viemodel.descriptionFocus,
                            textInputAction: TextInputAction.done,
                            maxLines: 6,
                            maxLength: 100,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              hintText: 'Description',
                              counterText: '',
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
                              width: width,
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
                              width: width,
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
                          PopupMenuButton(
                            color: Colors.white,
                            shape: const RoundedRectangleBorder(
                                side: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            constraints: BoxConstraints(
                              minWidth: width * 0.9,
                            ),
                            surfaceTintColor: Colors.white,
                            position: PopupMenuPosition.under,
                            itemBuilder: (context) => [
                              const PopupMenuItem(
                                  value: 'Income', child: Text('Income')),
                              const PopupMenuItem(
                                  value: 'Expense', child: Text('Expense')),
                              const PopupMenuItem(
                                  value: 'Saving', child: Text('Saving'))
                            ],
                            initialValue: viemodel.selectGender,
                            // onCanceled: () => print('on canceled'),
                            onSelected: (value) {
                              viemodel.setSelectGender(value);

                              debugPrint('pop up selected $value');
                            },
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              alignment: Alignment.centerLeft,
                              height: 48,
                              width: width,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    viemodel.selectGender,
                                    style: const TextStyle(
                                      color: Color(0xffa1a1a1),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const Icon(Icons.arrow_drop_down,
                                      color: Color(0xffa1a1a1))
                                ],
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
                            maxLength: 6,
                            enable: true,
                            keyboardType: TextInputType.none,
                          ),
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
