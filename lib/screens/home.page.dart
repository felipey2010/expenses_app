import 'package:expenses/components/transaction_form.dart';
import 'package:expenses/components/transaction_list.dart';
import 'package:expenses/data/constants.data.dart';
import 'package:expenses/data/dummy.data.dart';
import 'package:expenses/models/transaction.model.dart';
import 'package:flutter/material.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _transactions = dummyTransactions;

  _addTransaction(
      BuildContext context, String title, double value, DateTime date) {
    final newTransaction = Transaction(
        id: _transactions.length + 1,
        title: title,
        amount: value,
        date: date,
        icon: Icons.monetization_on);

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  _deleteTransaction(int id) {
    setState(() {
      _transactions.removeWhere((transaction) => transaction.id == id);
    });
  }

  _openTransactionFormModal(BuildContext context) {
    WoltModalSheet.show(
      context: context,
      pageListBuilder: (sheetContext) => [
        SliverWoltModalSheetPage(
          pageTitle: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Text(
              "Nova Transação",
              style: TextStyle(
                fontSize: defaultFontSize * 1.5,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          trailingNavBarWidget: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: IconButton(
              onPressed: () => Navigator.of(sheetContext).pop(),
              icon: const Icon(Icons.close),
            ),
          ),
          mainContentSliversBuilder: (context) => [
            SliverPadding(
              padding: const EdgeInsets.all(defaultPadding),
              sliver: SliverSafeArea(
                sliver: SliverToBoxAdapter(
                  child: TransactionForm(_addTransaction),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Expenses'),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: defaultPadding),
              child: IconButton(
                onPressed: () => _openTransactionFormModal(context),
                icon: Icon(Icons.add),
                tooltip: 'Adicionar',
              ),
            )
          ],
        ),
        body: TransactionList(_transactions, _deleteTransaction),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _openTransactionFormModal(context),
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
