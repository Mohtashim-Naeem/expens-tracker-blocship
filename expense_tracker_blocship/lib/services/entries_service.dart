import 'package:expense_tracker_blocship/models/entry.dart';

class EntryService {
  List<Entry> entries = [
    Entry(
      'Salary Deposit',
      'Description for Entry 1. This is an expense.',
      DateTime.now(),
      DateTime.now(),
      'Expense',
      '50',
    ),

    Entry(
      'Loan Payment',
      'Description for Entry 2. This is an income.',
      DateTime.now(),
      DateTime.now(),
      'Income',
      '100',
    ),
    Entry(
      'Salary Deposit',
      'Description for Entry 2. This is an income.',
      DateTime.now(),
      DateTime.now(),
      'Saving',
      '100',
    ),
    Entry(
      'Loan Payment',
      'Description for Entry 2. This is an income.',
      DateTime.now(),
      DateTime.now(),
      'Saving',
      '100',
    ),
    // Add more entries as needed
  ];
}
