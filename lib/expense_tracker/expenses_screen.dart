import 'package:flutter/material.dart';
import 'package:flutter_practice/expense_tracker/models/expense.dart';
import 'package:flutter_practice/expense_tracker/widgets/add_new_expense.dart';
import 'package:flutter_practice/expense_tracker/widgets/expenses_list.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() {
    return _ExpensesScreenState();
  }
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void _openAddExpenseBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return AddNewExpense(
          onSubmit: (Expense expense) {
            _addExpense(expense);
          },
        );
      },
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    setState(() {
      _registeredExpenses.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = _registeredExpenses.isEmpty
        ? Center(child: Text('No expenses found. Start adding some!'))
        : Column(
            children: [
              const Text("The chart"),
              Expanded(
                child: ExpensesList(
                  expenses: _registeredExpenses,
                  onRemoveExpense: _removeExpense,
                ),
              ),
            ],
          );

    return Scaffold(
      appBar: AppBar(
        title: Text('Expenses Tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseBottomSheet,
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: mainContent,
    );
  }
}
