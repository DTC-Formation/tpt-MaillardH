import 'package:flutter/material.dart';
import 'package:tsitsio/model/model.dart';

class ListeTransaction extends StatefulWidget {
  final Personne personne;
  const ListeTransaction({Key? key, required this.personne}) : super(key: key);
  @override
  State<ListeTransaction> createState() => _ListeTransactionState();
}

class _ListeTransactionState extends State<ListeTransaction> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Liste Transaction: ',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        SizedBox(
          height: 25,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: widget.personne.ListeTransaction.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 3),
                decoration: BoxDecoration(
                    color: (widget.personne.ListeTransaction[index].type ==
                            TransactionType.depense)
                        ? Colors.red
                        : Colors.green,
                    borderRadius: BorderRadius.circular(7)),
                height: 50,
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      '12',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Text(
                      widget.personne.ListeTransaction[index].nom,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '${widget.personne.ListeTransaction[index].prix} Ar',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 25,
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
