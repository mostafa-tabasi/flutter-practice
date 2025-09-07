import 'package:flutter/material.dart';
import 'package:flutter_practice/expense_tracker/models/expense.dart';
import 'package:flutter_practice/expense_tracker/widgets/add_new_expense.dart';
import 'package:flutter_practice/expense_tracker/widgets/chart/chart.dart';
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

  void _insertExpense(Expense expense, int position) {
    setState(() {
      _registeredExpenses.insert(position, expense);
    });
  }

  void _removeExpense(Expense expense) {
    int expenseIndex = _registeredExpenses.indexOf(expense);

    setState(() {
      _registeredExpenses.remove(expense);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Expense deleted'),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            _insertExpense(expense, expenseIndex);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    Widget mainContent = _registeredExpenses.isEmpty
        ? Center(child: Text('No expenses found. Start adding some!'))
        : (width < height)
        ? Column(
            children: [
              Chart(expenses: _registeredExpenses),
              Expanded(
                child: ExpensesList(
                  expenses: _registeredExpenses,
                  onRemoveExpense: _removeExpense,
                ),
              ),
            ],
          )
        : Row(
            children: [
              Expanded(child: Chart(expenses: _registeredExpenses)),
              Expanded(
                child: ExpensesList(
                  expenses: _registeredExpenses,
                  onRemoveExpense: _removeExpense,
                ),
              ),
            ],
          );

    return MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorScheme,
        cardTheme: const CardThemeData().copyWith(
          color: kDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primaryContainer,
          ),
        ),
      ),
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: const CardThemeData().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: kColorScheme.onSecondaryContainer,
            fontSize: 16,
          ),
        ),
      ),
      home: Scaffold(
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
      ),
    );
  }
}

var kColorScheme = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 101, 110, 145),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: Color.fromARGB(255, 45, 52, 87),
);
