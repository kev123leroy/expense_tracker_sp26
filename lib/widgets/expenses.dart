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
      context: context, 
      builder: (ctx) => NewExpense()
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
  return Scaffold(
appBar: AppBar(
  title:  const Text("Expense Tracker"),
  actions: [
    IconButton(onPressed: _openAddExpenseOverlay, icon: const Icon(Icons.add))
  ],
),

    body: Column(
      children: [
        Text("CHART"),
        SizedBox(height: 30,),
        SizedBox(
          height: 300,
          child: ExpensesList(expenses: _registeredExpense))
      ],
    ),
  );
}
}