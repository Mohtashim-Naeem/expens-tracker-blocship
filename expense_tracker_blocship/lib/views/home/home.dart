// import 'package:expense_tracker_blocship/app/app.router.dart';
// import 'package:expense_tracker_blocship/views/home/home_viewmodel.dart';
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
//             body: Column(
//               children: [
//                 PieChart(
//                   PieChartData(),
//                   swapAnimationDuration:
//                       Duration(milliseconds: 150), // Optional
//                   swapAnimationCurve: Curves.linear, // Optional
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     viewModel.navigationService.navigateToAddEntry();
//                   },
//                   child: const Text('Next'),
//                 ),
//               ],
//             ),
//           );
//         }));
//   }
// }

import 'package:expense_tracker_blocship/app/app.router.dart';
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
          return Scaffold(
            body: Column(
              children: [
                //
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: AspectRatio(
                        aspectRatio: 1.3,
                        child: PieChart(
                          PieChartData(
                            sections: viewModel.getSections(),
                            borderData: FlBorderData(show: false),
                            centerSpaceRadius: 40,
                            sectionsSpace: 0,
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
                      children: [
                        LegendItem(color: Colors.red, label: 'Expense'),
                        LegendItem(color: Colors.green, label: 'Income'),
                        LegendItem(color: Colors.blue, label: 'Saving'),
                      ],
                    ))
                  ],
                ),
                // FutureBuilder(future: viewModel.getSections, builder: (context, data){
                //   return ListView.builder(itemBuilder: (context, index) {
                //   return const ListTile();
                // }),
                // })
                Expanded(
                  child: ListView.builder(
                      itemCount: viewModel.entries.length,
                      itemBuilder: (context, index) {
                        return EntryWidget(entry: viewModel.entries[index]);
                      }),
                ),
                // ElevatedButton(
                //   onPressed: () {
                //     viewModel.navigationService.navigateToAddEntry();
                //   },
                //   child: const Text('Next'),
                // ),
                ElevatedButton(
                  onPressed: () {
                    viewModel.addEntry();
                  },
                  child: const Text('Add'),
                ),
              ],
            ),
          );
        }));
  }
}
