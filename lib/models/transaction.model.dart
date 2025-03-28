import 'package:flutter/material.dart';

class Transaction {
  final int id;
  final String title;
  final double amount;
  final DateTime date;
  final IconData? icon;

  Transaction(
      {required this.id,
      required this.title,
      required this.amount,
      required this.date,
      this.icon});
}
