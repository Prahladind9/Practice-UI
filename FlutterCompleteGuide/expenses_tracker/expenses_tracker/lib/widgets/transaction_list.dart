import 'package:flutter/material.dart';

import 'package:expenses_tracker/model/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 300,
        //ListView(children: []) - loads almost all the elements > leads to Memory Constraints
        //ListView.builder() - loads only the visible elements > saves memory > performance improvement
        child: transactions.isEmpty
            ? Column(
                children: [
                  Text(
                    'No transactions added yet!',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      height: 200,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      )),
                ],
              )
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 5,
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                            padding: EdgeInsets.all(6),
                            child: Text(
                                '\$${transactions[index].amount.toString()}')),
                      ),
                      title: Text(
                        transactions[index].title,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      subtitle: Text(
                        DateFormat.yMMMd().format(transactions[index].date),
                      ),
                    ),
                  );
                },
                itemCount: transactions.length,
              ),
      ),
    );
  }
}
