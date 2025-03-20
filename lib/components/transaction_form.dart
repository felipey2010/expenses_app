import 'package:expenses/data/constants.data.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final void Function(
          BuildContext context, String title, double amount, DateTime date)
      onSubmitTransaction;

  const TransactionForm(this.onSubmitTransaction, {super.key});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  DateTime _selectedDate = DateTime.now();

  void addTransaction(BuildContext context) {
    final title = titleController.text;
    final amount = double.tryParse(amountController.text) ?? 0;

    if (title.isEmpty || amount <= 0) {
      return;
    }

    widget.onSubmitTransaction(context, title, amount, _selectedDate);
    titleController.clear();
    amountController.clear();
  }

  void openDatePicker(BuildContext context) {
    var currentDate = DateTime.now();
    showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(2025),
      lastDate: DateTime(currentDate.year + 1),
    ).then((pickedDate) {
      if (pickedDate != null) {
        setState(() {
          _selectedDate = pickedDate;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: defaultPadding,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: titleController,
          autofocus: true,
          onSubmitted: (textContext) => addTransaction(context),
          decoration: const InputDecoration(labelText: 'Título'),
        ),
        TextField(
          controller: amountController,
          onSubmitted: (textContext) => addTransaction(context),
          decoration: const InputDecoration(labelText: 'Valor'),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
        ),
        SizedBox(
          height: 70,
          child: Row(
            spacing: defaultPadding,
            children: [
              Text(DateFormat('dd-MM-yyyy').format(_selectedDate)),
              TextButton(
                onPressed: () => openDatePicker(context),
                child: Text(
                  "Selecionar data",
                ),
              )
            ],
          ),
        ),
        Center(
          child: ElevatedButton(
            onPressed: () => addTransaction(context),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(defaultBorderRadius),
              ),
            ),
            child: const Text('Salvar'),
          ),
        ),
      ],
    );
  }
}
