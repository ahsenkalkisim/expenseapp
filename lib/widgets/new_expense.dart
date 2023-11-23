import 'package:expenseapp/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewExpense extends StatefulWidget {
  final void Function(Expense expense) onAdd;
  const NewExpense({required this.onAdd, Key? key}) : super(key: key);

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  var selectedDate = DateTime.now();
  var expenseNameController = TextEditingController();
  var expensePriceController = TextEditingController();
  var expenseDateController = TextEditingController();
  Category _category = Category.food;

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

  void addNewExpense() {
    final amount = double.tryParse(expensePriceController.text);
    if (amount == null || amount < 0 || expenseNameController.text.isEmpty) {
      showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            title: const Text("Validation Error"),
            content: const Text("Please fill all blank areas."),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("OK"))
            ],
          );
        }),
      );
    } else {
      widget.onAdd(Expense(
          name: expenseNameController.text,
          price: amount,
          date: selectedDate,
          category: _category));
      Navigator.pop(context);
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
            Row(
              children: [
                Text(
                  "Kategori Seçiniz",
                ),
                Spacer(),
                DropdownButton(
                    value: _category,
                    items: Category.values.map((category) {
                      return DropdownMenuItem(
                          value: category,
                          child: Text(
                            category.name.toString(),
                            style: Theme.of(context).textTheme.titleSmall,
                          ));
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        if (value != null) {
                          _category = value;
                        }
                      });
                    })
              ],
            ),
            ElevatedButton(
              onPressed: () {
                addNewExpense();
              },
              child: const Text("Ekle"),
            )
          ],
        ),
      ),
    );
  }
}
