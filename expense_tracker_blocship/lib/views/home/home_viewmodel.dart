import 'package:expense_tracker_blocship/app/app.locator.dart';
import 'package:expense_tracker_blocship/app/app.router.dart';
import 'package:expense_tracker_blocship/models/entry.dart';
import 'package:expense_tracker_blocship/services/entries_service.dart';
import 'package:expense_tracker_blocship/views/add_entry/add_entry.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  NavigationService navigationService = locator<NavigationService>();
  EntryService entryService = locator<EntryService>();

  int counter = 0;
  increamentCounter() {
    counter++;
    rebuildUi();
  }

  navigateTaddEntryView() {
    navigationService.navigateToAddEntry();
  }

  List<PieChartSectionData> getSections() {
    double totalIncome = 0;
    double totalExpense = 0;
    double totalSaving = 0;

    for (Entry entry in entryService.entries) {
      if (entry.expense == 'Income') {
        totalIncome += double.parse(entry.ammount);
      } else if (entry.expense == 'Expense') {
        totalExpense += double.parse(entry.ammount);
      } else if (entry.expense == 'Saving') {
        totalSaving += double.parse(entry.ammount);
      }
      // You can add more conditions for different categories if needed
    }

    // Calculate percentages
    double total = totalIncome + totalExpense + totalSaving;
    double incomePercentage = (totalIncome / total) * 100;
    double expensePercentage = (totalExpense / total) * 100;
    double savingPercentage = (totalSaving / total) * 100;

    return [
      PieChartSectionData(
        color: Colors.red,
        value: expensePercentage,
        title: '',

        // title: '${expensePercentage.toStringAsFixed(2)}%',
        radius: 25,
        titleStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      PieChartSectionData(
        color: Colors.green,
        value: incomePercentage,
        title: '',
        // title: '${incomePercentage.toStringAsFixed(2)}%',
        radius: 25,
        titleStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      PieChartSectionData(
        color: Colors.grey,
        value: savingPercentage,
        title: '',
        // title: '${savingPercentage.toStringAsFixed(2)}%',
        radius: 25,
        titleStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    ];
  }
}
