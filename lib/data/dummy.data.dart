import 'package:expenses/models/transaction.model.dart';
import 'package:flutter/material.dart';

List<Transaction> dummyTransactions = [
  Transaction(
      id: 1,
      title: "Pizza",
      amount: 35.0,
      date: DateTime.now().subtract(Duration(days: 3)),
      icon: Icons.food_bank),
  Transaction(
      id: 2,
      title: "Shoes",
      amount: 200.0,
      date: DateTime.now().subtract(Duration(days: 4)),
      icon: Icons.shopping_bag),
  Transaction(
      id: 3,
      title: "Groceries",
      amount: 150.0,
      date: DateTime.now(),
      icon: Icons.local_grocery_store),
  Transaction(
      id: 4,
      title: "Electricity Bill",
      amount: 75.0,
      date: DateTime.now(),
      icon: Icons.electrical_services),
  Transaction(
      id: 5,
      title: "Internet Bill",
      amount: 50.0,
      date: DateTime.now(),
      icon: Icons.wifi),
];
