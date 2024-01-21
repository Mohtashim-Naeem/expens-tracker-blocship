import 'package:flutter/material.dart';

class Entry {
  final String title;
  final String description;
  final DateTime date;
  final TimeOfDay time;
  final String expense;
  final String ammount;

  Entry(this.title, this.description, this.date, this.time, this.expense,
      this.ammount);
}
