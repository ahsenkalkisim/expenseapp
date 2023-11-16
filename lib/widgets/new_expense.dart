import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  var selectedDate = DateTime.now();
  var expenseNameController = TextEditingController();
  var expensePriceController = TextEditingController();
  var expenseDateController = TextEditingController();

  Future<void> selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            TextField(
              controller: expenseNameController,
              maxLength: 50,
              decoration: const InputDecoration(labelText: "Harcama Adı"),
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: expensePriceController,
              decoration: const InputDecoration(labelText: "Harcama Miktarı"),
            ),
            IconButton(
                onPressed: () {
                  selectDate();
                },
                icon: const Icon(Icons.calendar_month)),
            Text(DateFormat.yMd().format(selectedDate)),
            ElevatedButton(
              onPressed: () {
                print(
                    "Kaydedilen değer: $expenseNameController Miktar: $expensePriceController");
              },
              child: const Text("Ekle"),
            )
          ],
        ),
      ),
    );
  }
}