import 'package:expenses/components/transaction_form.dart';
import 'package:expenses/data/constants.data.dart';
import 'package:expenses/models/transaction.model.dart';
import 'package:flutter/material.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class TransactionProvider extends ChangeNotifier {
  final List<Transaction> transactions = [];

  addTransaction(BuildContext context, Transaction transaction) {
    final existingTransactionIndex =
        transactions.indexWhere((trx) => trx.id == transaction.id);

    final newTransaction = Transaction(
      id: transaction.id == 0 ? transactions.length + 1 : transaction.id,
      title: transaction.title,
      amount: transaction.amount,
      date: transaction.date,
      icon: Icons.monetization_on,
    );

    if (existingTransactionIndex >= 0) {
      transactions[existingTransactionIndex] = newTransaction;
    } else {
      transactions.add(newTransaction);
    }

    Navigator.of(context).pop();
    notifyListeners();
  }

  deleteTransaction(int id) {
    transactions.removeWhere((transaction) => transaction.id == id);
    notifyListeners();
  }

  openTransactionFormModal(BuildContext context, Transaction? transaction) {
    bool isNewTransaction = transaction == null;
    WoltModalSheet.show(
      context: context,
      pageListBuilder: (sheetContext) => [
        SliverWoltModalSheetPage(
          pageTitle: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Text(
              isNewTransaction ? "Nova Transação" : 'Atualizar Transação',
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
                  child: TransactionForm(transaction, addTransaction),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
