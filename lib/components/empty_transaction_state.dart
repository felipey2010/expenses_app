import 'package:expenses/data/constants.data.dart';
import 'package:flutter/material.dart';

class EmptyTransactionState extends StatelessWidget {
  const EmptyTransactionState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: defaultPadding,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Nenhuma transação cadastrada"),
          Container(
            height: 200,
            width: 200,
            color: Colors.transparent,
            child: Image(
              image: AssetImage('assets/images/empty.png'),
            ),
          )
        ],
      ),
    );
  }
}
