import 'package:expenseapp/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {Key? key}) : super(key: key);
  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          children: [
            Text(expense.name),
            Row(
              children: [
                Text("₺${expense.price.toStringAsFixed(2)}"),
                const Spacer(), // mainaxisaligment between ile hemen hemen aynı
                Text(DateFormat.yMd().format(expense.date)),
              ],
            )
          ],
        ),
      ),
    );
  }
}