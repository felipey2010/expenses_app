import 'package:expenses/data/constants.data.dart';
import 'package:flutter/material.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final void Function(String title, double amount) onAddTransaction;

  TransactionForm(this.onAddTransaction, {super.key});

  addTransaction() {
    final title = titleController.text;
    final amount = double.parse(amountController.text);

    if (title.isEmpty || amount <= 0) {
      return;
    }

    onAddTransaction(title, amount);
    titleController.clear();
    amountController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: defaultPadding),
      child: IconButton(
        onPressed: () {
          WoltModalSheet.show(
              context: context,
              pageListBuilder: (sheetContext) => [
                    SliverWoltModalSheetPage(
                        pageTitle: Padding(
                          padding: const EdgeInsets.all(defaultPadding),
                          child: Text(
                            "Nova Transação",
                            style: TextStyle(
                                fontSize: 24.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        trailingNavBarWidget: Padding(
                          padding: EdgeInsets.all(defaultPadding),
                          child: IconButton(
                              onPressed: Navigator.of(sheetContext).pop,
                              icon: Icon(Icons.close)),
                        ),
                        mainContentSliversBuilder: (context) => [
                              SliverPadding(
                                padding: EdgeInsets.all(defaultPadding),
                                sliver: SliverSafeArea(
                                  sliver: SliverToBoxAdapter(
                                    child: Column(
                                      spacing: defaultPadding,
                                      children: [
                                        TextField(
                                          controller: titleController,
                                          decoration: InputDecoration(
                                              labelText: 'Título'),
                                        ),
                                        TextField(
                                          controller: amountController,
                                          decoration: InputDecoration(
                                              labelText: 'Valor'),
                                          keyboardType:
                                              TextInputType.numberWithOptions(
                                                  decimal: true),
                                        ),
                                        ElevatedButton(
                                          onPressed: () => addTransaction(),
                                          child: const Text('Adicionar'),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ])
                  ]);
        },
        icon: Icon(Icons.add),
        tooltip: 'Adicionar',
      ),
    );
  }
}
