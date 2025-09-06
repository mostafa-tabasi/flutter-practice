import 'package:flutter/widgets.dart';
import 'package:flutter_practice/expense_tracker/models/expense.dart';
import 'package:flutter_practice/expense_tracker/widgets/expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final List<Expense> expenses;

  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) {
        var item = expenses[index];

        return Dismissible(
          key: ValueKey(item),
          child: ExpenseItem(item),
          onDismissed: (direction) {
            onRemoveExpense(item);
          },
        );
      },
    );
  }
}
