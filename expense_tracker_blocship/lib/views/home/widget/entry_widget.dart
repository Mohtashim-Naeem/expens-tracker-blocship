import 'package:expense_tracker_blocship/models/entry.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EntryWidget extends StatelessWidget {
  final Entry entry;

  const EntryWidget({super.key, required this.entry});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              // spreadRadius: ,
              offset: const Offset(0, 10),
              color: Colors.grey.withOpacity(0.50),
            ),
          ],
          borderRadius: BorderRadius.circular(25)),
      // elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Color.fromARGB(255, 222, 221, 221),
              radius: 40,
              child: entry.expense == 'Expense'
                  ? const Icon(
                      Icons.arrow_back,
                      size: 39,
                      color: Colors.red,
                    )
                  : const Icon(
                      Icons.arrow_forward_rounded,
                      size: 39,
                      color: Colors.green,
                    ),
            ),
            const SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  entry.title,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 55, 55, 55)),
                ),
                SizedBox(
                  width: 200,
                  child: Text(
                    entry.description.length > 100
                        ? '${entry.description.substring(0, 100)}...'
                        : entry.description,
                    style: const TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 107, 105, 105)),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                // Row(
                //   children: [
                Text(
                  // DateFormat("d MMMM yyyy 'at' h:mm a")
                  //     .format(entry.date.add(entry.time)),
                  "${entry.date.day} ${entry.date.month}, ${entry.date.year}",
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                // Text(
                //   // DateFormat("d MMMM yyyy 'at' h:mm a")
                //   //     .format(entry.date.add(entry.time)),
                //   entry.time.toString(),
                //   style: const TextStyle(fontSize: 14, color: Colors.grey),
                // ),
                //   ],
                // ),
              ],
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              '${entry.ammount}',
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color.fromARGB(255, 55, 55, 55)),
            ),
          ],
        ),
      ),
    );
  }
}
