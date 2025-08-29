import 'package:expense_app/widgets/chart/chart.dart';
import 'package:expense_app/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_app/models/expense.dart';
import 'package:expense_app/widgets/expenses_list/expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: EnumCategory.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: EnumCategory.leisure,
    ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    // to get the index of a data in a list using indexOf.
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    // Clears all the SnackBar for the context i.e builder
    ScaffoldMessenger.of(context).clearSnackBars();
    // Shows SnackBar for the context
    ScaffoldMessenger.of(context).showSnackBar(
      // a widget which is like toaster message kinda not fully.
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense deleted.'),
        // what to do action on clicking action
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              // .insert, inserts the expense to a specific index.So, that  the undo works for same index the data is deleted from.
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = (MediaQuery.of(context).size.width);
    Widget mainContent = const Center(
      child: Text('No expenses found, Start adding some!'),
    );
    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpansesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Expense Report"),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: width < 600
          ? Column(
              children: [
                Chart(expenses: _registeredExpenses),
                Expanded(child: mainContent),
              ],
            )
          : Row(
              children: [
                Expanded(child: Chart(expenses: _registeredExpenses)),
                Expanded(child: mainContent),
              ],
            ),
    );
  }
}
