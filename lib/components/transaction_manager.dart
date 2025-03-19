import 'package:expenses/components/transaction_form.dart';
import 'package:expenses/components/transaction_list.dart';
import 'package:expenses/data/dummy.data.dart';
import 'package:expenses/models/transaction.model.dart';
import 'package:flutter/material.dart';

class TransactionManager extends StatefulWidget {
  const TransactionManager({super.key});

  @override
  State<TransactionManager> createState() => _TransactionManagerState();
}

class _TransactionManagerState extends State<TransactionManager> {
  final List<Transaction> transactions = dummyTransactions;

  _addTransaction(String title, double amount) {
    final newTransaction = Transaction(
        id: transactions.length + 1,
        title: title,
        amount: amount,
        date: DateTime.now(),
        icon: Icons.money);

    setState(() {
      transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Expenses'),
          actions: [TransactionForm(_addTransaction)],
        ),
        body: TransactionList(transactions));
  }
}
