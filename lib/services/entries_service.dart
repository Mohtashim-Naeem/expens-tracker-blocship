import 'package:expense_tracker_blocship/models/entry.dart';
import 'package:flutter/material.dart';

/// The `EntryService` class provides a singleton approach for managing financial entries in the expense tracker.
///
/// This class is responsible for storing a list of financial entries, such as income, expenses, and savings.
/// The entries are instances of the `Entry` class, which encapsulates details like entry name, description,
/// date, time, category, and amount.
class EntryService {
  /// A singleton instance of the `EntryService` class.
  static final EntryService _instance = EntryService._internal();

  /// The list of financial entries managed by the service.
  List<Entry> entries = [
    // Initial set of sample entries
    Entry(
      'Salary Deposit',
      'Description for Entry 1. This is an income.',
      DateTime.now(),
      TimeOfDay.now(),
      'Income',
      '50',
    ),
    Entry(
      'Loan Payment',
      'Description for Entry 2. This is an expense.',
      DateTime.now(),
      TimeOfDay.now(),
      'Expense',
      '100',
    ),
    Entry(
      'Salary Deposit',
      'Description for Entry 1. This is a saving.',
      DateTime.now(),
      TimeOfDay.now(),
      'Saving',
      '50',
    ),
    Entry(
      'Loan Payment',
      'Description for Entry 2. This is an expense.',
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
    // Add more entries as needed
  ];

  /// Private constructor to enforce the singleton pattern.
  EntryService._internal();

  /// Factory method to access the singleton instance of the `EntryService`.
  factory EntryService() {
    return _instance;
  }
}
