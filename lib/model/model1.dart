import 'package:flutter/material.dart';

enum TransactionType { expense, income }

class Transaction {
  final double amount;
  final DateTime date;
  final Category category;
  final TransactionType type;
  final String nom;

  Transaction(
      {required this.amount,
      required this.date,
      required this.category,
      required this.type,
      required this.nom});
}

class Category {
  late final String nom;
  late final Color couleur;
}

class Solde {
  double initialSolde;

  Solde({required this.initialSolde});
}

class MoneyController extends ChangeNotifier {
  late Solde solde;
  List<Transaction> Listetransactions = [];

  void addTransaction(Transaction transaction) {
    Listetransactions.add(transaction);
  }

  double calculTotalSolde() {
    double total = solde.initialSolde;
    for (var transaction in Listetransactions) {
      if (transaction.type == TransactionType.income) {
        total += transaction.amount;
      } else {
        total -= transaction.amount;
      }
    }
    return total;
  }

  List<Transaction> getTransactionsCategoryType(
      Category category, TransactionType type) {
    return Listetransactions.where((transaction) =>
        transaction.category == category && transaction.type == type).toList();
  }
}
