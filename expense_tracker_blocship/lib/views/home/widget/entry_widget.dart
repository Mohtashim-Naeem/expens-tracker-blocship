import 'package:expense_tracker_blocship/models/entry.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EntryWidget extends StatelessWidget {
  final Entry entry;

  const EntryWidget({super.key, required this.entry});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              entry.title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              DateFormat("d MMMM yyyy 'at' h:mm a")
                  .format(entry.date.add(entry.time.timeZoneOffset)),
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            Text(
              entry.description.length > 100
                  ? '${entry.description.substring(0, 100)}...'
                  : entry.description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  'Type: ${entry.expense}',
                  style: const TextStyle(fontSize: 16, color: Colors.red),
                ),
                const SizedBox(width: 16),
                Text(
                  'Amount: \$${entry.ammount}',
                  style: const TextStyle(fontSize: 16, color: Colors.green),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
