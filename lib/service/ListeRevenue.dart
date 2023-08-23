import 'package:flutter/material.dart';
import 'package:tsitsio/model/model.dart';

class ListeRevenue extends StatefulWidget {
  final Personne personne;
  const ListeRevenue({Key? key, required this.personne}) : super(key: key);
  @override
  State<ListeRevenue> createState() => _ListeRevenueState();
}

class _ListeRevenueState extends State<ListeRevenue> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 25,
          ),
          Text(
            'Liste Revenue:',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.personne.ListeRevenue.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 8,
                  child: Container(
                    height: 50,
                    color:
                        widget.personne.ListeRevenue[index].categorie.couleur,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          '${widget.personne.ListeRevenue[index].prix}Ar',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        Spacer(),
                        Text(
                          widget.personne.ListeRevenue[index].nom,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              widget.personne.deleteRevenue(index);
                            });
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
