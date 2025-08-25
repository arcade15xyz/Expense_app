import 'package:expense_app/models/expense.dart';
import 'package:flutter/material.dart';

class ExpansesList extends StatelessWidget {
  const ExpansesList({super.key, required this.expenses});

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Text(expenses[index].title),
    );
  }
}
