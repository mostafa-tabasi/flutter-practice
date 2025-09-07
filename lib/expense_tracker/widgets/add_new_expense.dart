import 'package:flutter/material.dart';
import 'package:flutter_practice/expense_tracker/models/expense.dart';

class AddNewExpense extends StatefulWidget {
  const AddNewExpense({super.key, required this.onSubmit});

  final void Function(Expense expense) onSubmit;

  @override
  State<AddNewExpense> createState() {
    return _AddNewExpenseState();
  }
}

class _AddNewExpenseState extends State<AddNewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.food;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _showDatePicker() async {
    var now = DateTime.now();
    var lastYear = DateTime(now.year - 1, now.month, now.day);
    var selectedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: lastYear,
      lastDate: now,
    );

    setState(() {
      _selectedDate = selectedDate;
    });

    // another way to get the selected date without async/await
    // .then((onValue){
    // });
  }

  void _submitExpenseData() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;
    final titleIsInvalid = _titleController.text.trim().isEmpty;
    final dateIsInvalid = _selectedDate == null;

    if (amountIsInvalid || titleIsInvalid || dateIsInvalid) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid input'),
          content: const Text(
            'Please make sure a valid title, amount, date and category was entered.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: Text('Okay'),
            ),
          ],
        ),
      );
      return;
    }

    widget.onSubmit(
      Expense(
        title: _titleController.text,
        amount: enteredAmount,
        date: _selectedDate!,
        category: _selectedCategory,
      ),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, 16, 16, keyboardSpace + 16),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              maxLength: 50,
              decoration: const InputDecoration(label: Text('Title')),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _amountController,
                    maxLength: 10,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      label: Text('Amount'),
                      prefixText: '\$ ',
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        _selectedDate == null
                            ? 'No Date Selected'
                            : formatter.format(_selectedDate!),
                      ),
                      SizedBox(width: 8),
                      IconButton(
                        onPressed: _showDatePicker,
                        icon: Icon(Icons.calendar_month),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                DropdownButton(
                  value: _selectedCategory,
                  items: Category.values
                      .map(
                        (category) => DropdownMenuItem(
                          value: category,
                          child: Text(category.name.toUpperCase()),
                        ),
                      )
                      .toList(),
                  onChanged: (item) {
                    if (item == null) return;

                    setState(() {
                      _selectedCategory = item;
                    });
                  },
                ),
                Spacer(),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel'),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _submitExpenseData,
                  child: const Text('Save Expense'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
