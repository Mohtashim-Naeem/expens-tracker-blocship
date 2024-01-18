// import 'package:expense_tracker_blocship/views/home/home_viewmodel.dart';
// import 'package:expense_tracker_blocship/views/home/widget/entry_widget.dart';
// import 'package:expense_tracker_blocship/views/home/widget/legend_widget.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
// import 'package:stacked/stacked.dart';

// class homeView extends StatelessWidget {
//   const homeView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ViewModelBuilder.reactive(
//         viewModelBuilder: () => HomeViewModel(),
//         builder: ((context, viewModel, child) {
//           return Scaffold(
//             body: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: MediaQuery.sizeOf(context).height * 0.10,
//                   ),
//                   Row(
//                     children: [
//                       Expanded(
//                         flex: 3,
//                         child: AspectRatio(
//                           aspectRatio: 1.6,
//                           child: PieChart(
//                             PieChartData(
//                               sections: viewModel.getSections(),
//                               borderData: FlBorderData(show: false),
//                               centerSpaceRadius: 80,
//                               sectionsSpace: 5,
//                               centerSpaceColor: Colors.white,
//                             ),
//                             swapAnimationDuration:
//                                 const Duration(milliseconds: 150),
//                             swapAnimationCurve: Curves.linear,
//                           ),
//                         ),
//                       ),
//                       const Expanded(
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             LegendItem(color: Colors.red, label: 'Expense'),
//                             LegendItem(color: Colors.green, label: 'Income'),
//                             LegendItem(color: Colors.grey, label: 'Saving'),
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                   Expanded(
//                     child: ListView.builder(
//                         itemCount: viewModel.entries.length,
//                         itemBuilder: (context, index) {
//                           return EntryWidget(entry: viewModel.entries[index]);
//                         }),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       viewModel.addEntry();
//                     },
//                     child: const Text('Add'),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         }));
//   }
// }
import 'package:expense_tracker_blocship/views/home/home_viewmodel.dart';
import 'package:expense_tracker_blocship/views/home/widget/entry_widget.dart';
import 'package:expense_tracker_blocship/views/home/widget/legend_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class homeView extends StatelessWidget {
  const homeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => HomeViewModel(),
        builder: ((context, viewModel, child) {
          return SafeArea(
            child: Scaffold(
              // appBar: AppBar(
              // title: ElevatedButton(
              //   onPressed: () {
              //     viewModel.addEntryView();
              //   },
              //   child: const Text('Add'),
              // ),
              // ),
              floatingActionButton: ElevatedButton(
                onPressed: () {
                  viewModel.addEntryView();
                },
                child: const Text('Add'),
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.10,
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.3,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: AspectRatio(
                                aspectRatio: 1.6,
                                child: PieChart(
                                  PieChartData(
                                    sections: viewModel.getSections(),
                                    borderData: FlBorderData(show: false),
                                    centerSpaceRadius: 80,
                                    sectionsSpace: 5,
                                    centerSpaceColor: Colors.white,
                                  ),
                                  swapAnimationDuration:
                                      const Duration(milliseconds: 150),
                                  swapAnimationCurve: Curves.linear,
                                ),
                              ),
                            ),
                            const Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  LegendItem(
                                      color: Colors.red, label: 'Expense'),
                                  LegendItem(
                                      color: Colors.green, label: 'Income'),
                                  LegendItem(
                                      color: Colors.grey, label: 'Saving'),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          reverse: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: viewModel.entries.length,
                          itemBuilder: (context, index) {
                            return EntryWidget(entry: viewModel.entries[index]);
                          }),
                    ],
                  ),
                ),
              ),
            ),
          );
        }));
  }
}
