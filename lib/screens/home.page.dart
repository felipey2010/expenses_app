import 'package:expenses/components/transaction_list.dart';
import 'package:expenses/data/constants.data.dart';
import 'package:expenses/providers/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<TransactionProvider>(
        builder: (context, value, child) {
          final transactionContext = context.read<TransactionProvider>();

          return Scaffold(
            appBar: AppBar(
              title: const Text('Expenses'),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: defaultPadding),
                  child: IconButton(
                    onPressed: () => transactionContext
                        .openTransactionFormModal(context, null),
                    icon: Icon(Icons.add),
                    tooltip: 'Adicionar',
                  ),
                )
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TransactionList(transactionContext.transactions,
                  transactionContext.deleteTransaction),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () =>
                  transactionContext.openTransactionFormModal(context, null),
              child: Icon(Icons.add),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
        },
      ),
    );
  }
}
