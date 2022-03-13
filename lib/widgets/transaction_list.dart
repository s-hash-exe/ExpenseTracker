import 'package:flutter/material.dart';
import "../models/transaction.dart";
import 'package:intl/intl.dart';
import "transaction_item.dart";

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);
  @override
  Widget build(BuildContext context) {
    return (transactions.length == 0)
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: [
                Text("No transaction to display!",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                SizedBox(height: 10),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset("assets/images/waiting.png",
                      fit: BoxFit.cover),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            );
          })
        : ListView(children: [
            ...transactions
                .map((tx) => TransactionItem(
                    key: ValueKey(tx.id), transaction: tx, deleteTx: deleteTx))
                .toList()
          ]);
  }
}
