import 'package:expense_tracker_blocship/models/entry.dart';
import 'package:flutter/material.dart';

class EntryService {
  List<Entry> entries = [
    Entry(
      'Salary Deposit',
      'Description for Entry 1. This is an expense.',
      DateTime.now(),
      TimeOfDay.now(),
      'Income',
      '50',
    ),

    Entry(
      'Loan Payment',
      'Description for Entry 2. This is an income.',
      DateTime.now(),
      TimeOfDay.now(),
      'Expense',
      '100',
    ),
    Entry(
      'Salary Deposit',
      'Description for Entry 2. This is an income.',
      DateTime.now(),
      TimeOfDay.now(),
      'Income',
      '100',
    ),
    Entry(
      'Loan Payment',
      'Description for Entry 2. This is an income.',
      DateTime.now(),
      TimeOfDay.now(),
      'Expense',
      '100',
    ),
    // Add more entries as needed
  ];
}
