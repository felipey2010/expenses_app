import 'package:expenses/components/empty_transaction_state.dart';
import 'package:expenses/data/colors.data.dart';
import 'package:expenses/data/constants.data.dart';
import 'package:expenses/models/transaction.model.dart';
import 'package:expenses/providers/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(int id) onDelete;

  const TransactionList(this.transactions, this.onDelete, {super.key});

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? EmptyTransactionState()
        : Consumer<TransactionProvider>(
            builder: (context, value, child) {
              final transactionContext = context.read<TransactionProvider>();
              return ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (BuildContext context, int index) {
                  final transaction = transactions[index];
                  return ListTile(
                    title: Text(transaction.title),
                    subtitle: Text(
                        DateFormat('dd-MM-yyyy').format(transaction.date),
                        style: TextStyle(fontSize: defaultFontSize * 0.75)),
                    trailing: Text(
                      'R\$ ${NumberFormat('###.00', 'pt-BR').format(transaction.amount)}',
                      style: TextStyle(
                          fontSize: defaultFontSize,
                          color: const Color.fromARGB(255, 126, 0, 63)),
                    ),
                    leading: Icon(
                      transaction.icon,
                      size: 36.0,
                      color: primaryColor,
                    ),
                    onLongPress: () => onDelete(transaction.id),
                    onTap: () => transactionContext.openTransactionFormModal(
                        context, transaction),
                  );
                },
              );
            },
          );
  }
}
