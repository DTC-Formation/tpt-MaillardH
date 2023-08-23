import 'package:flutter/material.dart';

import 'package:tsitsio/model/model.dart';

class ListeCategorieR extends StatefulWidget {
  const ListeCategorieR({super.key, required this.personne});

  final Personne personne;

  @override
  State<ListeCategorieR> createState() => _ListeCategorieRState();
}

class _ListeCategorieRState extends State<ListeCategorieR> {
  @override
  Widget build(BuildContext context) {
    print('liste categorie ${widget.personne.ListeCategorieR.length}');
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            'Liste Categorie Revenue:',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.personne.ListeCategorieR.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 0,
                  child: Container(
                    height: 50,
                    color: widget.personne.ListeCategorieR[index].couleur,
                    child: Row(
                      children: [
                        SizedBox(width: 20),
                        Text(
                          '$index',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Text(
                          widget.personne.ListeCategorieR[index].nom,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              widget.personne.ListeCategorieR.removeAt(index);
                            });
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 20,
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

class ListeCategorieD extends StatefulWidget {
  const ListeCategorieD({super.key, required this.personne});

  final Personne personne;

  @override
  State<ListeCategorieD> createState() => _ListeCategorieDState();
}

class _ListeCategorieDState extends State<ListeCategorieD> {
  TextEditingController categorieControllerD = TextEditingController();
  List<MaterialColor> colorCategorie = Colors.primaries;

  @override
  Widget build(BuildContext context) {
    Color ColorsM;

    void changeColor(Color color) {
      ColorsM = color;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            'Liste Categorie depense:',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.personne.ListeCategorieD.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 8,
                  child: Container(
                    height: 50,
                    color: widget.personne.ListeCategorieD[index].couleur,
                    child: Row(
                      children: [
                        SizedBox(width: 20),
                        Text(
                          '$index',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Text(
                          widget.personne.ListeCategorieD[index].nom,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              widget.personne.ListeCategorieD.removeAt(index);
                            });
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 20,
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
