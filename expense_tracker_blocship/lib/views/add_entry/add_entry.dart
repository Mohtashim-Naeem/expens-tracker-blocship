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
  AddEntry({super.key});
  // final HomeViewModel vm = HomeViewModel();

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
                    // print(vm.entries.length);
                    viemodel.entryService.entries.add(
                      Entry(
                        'Salary Deposit',
                        'Description for Entry 1. This is an expense.',
                        DateTime.now(),
                        DateTime.now(),
                        'Expense',
                        '50',
                      ),
                    );
                    print(viemodel.entryService.entries.length);

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
                          CustomTextField(
                            controller: viemodel.ammountController,
                            currentFocus: viemodel.ammountFocus,
                            hint: 'Ammount',
                            maxLines: 1,
                          ),
                          // Container(
                          //   child: Text('${viemodel.value}'),
                          // ),

                          NumericKeypad(
                            controller: viemodel.ammountController,
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
