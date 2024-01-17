import 'package:expense_tracker_blocship/app/app.locator.dart';
import 'package:expense_tracker_blocship/models/entry.dart';
import 'package:expense_tracker_blocship/views/add_entry/add_entry.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  NavigationService navigationService = locator<NavigationService>();
  int counter = 0;
  increamentCounter() {
    counter++;
    rebuildUi();
  }

  addEntry() {
    entries.add(
      Entry(
        'Entry 3',
        'Description for Entry 3. This is an income.',
        DateTime.now(),
        DateTime.now(),
        'Expense',
        '500',
      ),
    );
    rebuildUi();
  }

  List<Entry> entries = [
    Entry(
      'Entry 1',
      'Description for Entry 1. This is an expense.',
      DateTime.now(),
      DateTime.now(),
      'Expense',
      '50',
    ),
    Entry(
      'Entry 2',
      'Description for Entry 2. This is an income.',
      DateTime.now(),
      DateTime.now(),
      'Income',
      '100',
    ),
    // Add more entries as needed
  ];
  List<PieChartSectionData> getSections() {
    // Calculate total amounts for income, expense, and saving
    double totalIncome = 0;
    double totalExpense = 0;
    double totalSaving = 0;

    for (Entry entry in entries) {
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
        title: '${expensePercentage.toStringAsFixed(2)}%',
        radius: 50,
        titleStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      PieChartSectionData(
        color: Colors.green,
        value: incomePercentage,
        title: '${incomePercentage.toStringAsFixed(2)}%',
        radius: 50,
        titleStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      PieChartSectionData(
        color: Colors.white,
        value: savingPercentage,
        title: '${savingPercentage.toStringAsFixed(2)}%',
        radius: 50,
        titleStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    ];
  }
}
