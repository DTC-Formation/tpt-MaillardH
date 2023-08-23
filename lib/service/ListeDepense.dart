import 'package:flutter/material.dart';
import 'package:tsitsio/model/model.dart';

class ListeDepense extends StatefulWidget {
  final Personne personne;
  const ListeDepense({Key? key, required this.personne}) : super(key: key);
  @override
  State<ListeDepense> createState() => _ListeDepenseState();
}

class _ListeDepenseState extends State<ListeDepense> {
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
            'Liste depense:',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.personne.ListeDepense.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 8,
                  child: Container(
                    height: 50,
                    color:
                        widget.personne.ListeDepense[index].categorie.couleur,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          '${widget.personne.ListeDepense[index].prix}Ar',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        Spacer(),
                        Text(
                          widget.personne.ListeDepense[index].nom,
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
                              widget.personne.deleteDepense(index);
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
