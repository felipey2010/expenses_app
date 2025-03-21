import 'package:expenses/components/transaction_form.dart';
import 'package:expenses/data/constants.data.dart';
import 'package:expenses/models/transaction.model.dart';
import 'package:flutter/material.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class TransactionProvider extends ChangeNotifier {
  final List<Transaction> transactions = [];

  addTransaction(
      BuildContext context, String title, double value, DateTime date) {
    final newTransaction = Transaction(
        id: transactions.length + 1,
        title: title,
        amount: value,
        date: date,
        icon: Icons.monetization_on);

    transactions.add(newTransaction);

    Navigator.of(context).pop();
    notifyListeners();
  }

  deleteTransaction(int id) {
    transactions.removeWhere((transaction) => transaction.id == id);
    notifyListeners();
  }

  openTransactionFormModal(BuildContext context) {
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
                  child: TransactionForm(addTransaction),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
