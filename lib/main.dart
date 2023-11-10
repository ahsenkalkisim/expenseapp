import 'package:expenseapp/pages/expense_list.dart';
import 'package:flutter/material.dart';

// Single Responsibility
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 29, 161, 128),
        title: const Text("ExpenseApp"),
      ),
      body: const ExpenseList(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 34, 116, 95),
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    ),
  ));
}
