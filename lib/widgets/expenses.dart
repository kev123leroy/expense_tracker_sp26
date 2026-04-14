import 'package:expense_tracker_sp26/models/expense.dart';
import 'package:expense_tracker_sp26/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker_sp26/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget{
const Expenses({super.key});

  @override
  State<StatefulWidget> createState(){
    return _ExpensesState();
  }

}
class _ExpensesState extends State<Expenses>{
  void _openAddExpenseOverlay(){
    showModalBottomSheet(
      isScrollControlled: true,
      context: context, 
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }
  void _addExpense(Expense expense){
    setState(() {
      _registeredExpense.add(expense);
    });
  }
  void _removeExpense(Expense expense){
    final expenseIndex = _registeredExpense.indexOf(expense);
    setState(() {
      _registeredExpense.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(
      context
      ).showSnackBar(SnackBar(
        duration: Duration(seconds: 5),
        content: Text("Expense Deleted!"),
        action: SnackBarAction(label: "undo", onPressed: (){
         setState(() {
          _registeredExpense.insert(expenseIndex, expense);
          });
        },
        ),
      ), 
      );
  }
  
  final List<Expense> _registeredExpense = [
  Expense(
    title: 'Ginos Pizza',
    amount: 25.00,
    date: DateTime.now(),
    category: Category.food
  ),
  Expense(
    title: 'LIRR',
    amount: 16.00,
    date: DateTime.now(),
    category: Category.travel
  ),
  Expense(
    title: 'Playstation',
    amount: 16.00,
    date: DateTime.now(),
    category: Category.leisure
  ),
  ];
@override
Widget build(BuildContext context){
Widget mainContent = const Center(
  child: Text("No Expenses, please add something"),
  );
if (_registeredExpense.isNotEmpty){
  mainContent = ExpensesList(
    expenses: _registeredExpense, onRemoveExpense: _removeExpense,
  );
}


  return Scaffold(
appBar: AppBar(
  title:  const Text("Expense Tracker"),
  actions: [
    IconButton(onPressed: _openAddExpenseOverlay, icon: const Icon(Icons.add))
  ],
),

    body: Column(
        children: [
          const Text("Chart"),
          Expanded(
            child: mainContent),
      ],
    ),
  );
}
}