import 'package:flutter/material.dart';

import '../model/model.dart';

class AjouterRevenue extends StatefulWidget {
  final Personne personne;
  const AjouterRevenue({super.key, required this.personne});

  @override
  State<AjouterRevenue> createState() => _AjouterRevenueState();
}

class _AjouterRevenueState extends State<AjouterRevenue> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController revenueController1 = TextEditingController();
  TextEditingController revenueController2 = TextEditingController();
  Color green1 = Color.fromARGB(255, 4, 172, 32);

  late Categorie categorieRevenue;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Ajouter une dépense'),
              content: Container(
                height: 200,
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: revenueController2,
                          decoration: InputDecoration(labelText: 'Prix'),
                          keyboardType:
                              TextInputType.numberWithOptions(decimal: true),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Ce champ est requis.';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: revenueController1,
                          decoration: InputDecoration(labelText: 'Description'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Ce champ est requis.';
                            }
                            return null;
                          },
                        ),
                        Text('Categorie:'),
                        Container(
                          height: 200,
                          child: Wrap(
                            children: [
                              for (Categorie cat
                                  in widget.personne.ListeCategorieR)
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      categorieRevenue = cat;
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 2, vertical: 3),
                                    decoration: BoxDecoration(
                                      color: cat.couleur,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Text(
                                      '${cat.nom}',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              actions: [
                Row(
                  children: [
                    Spacer(),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Annuler')),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState != null &&
                            _formKey.currentState!.validate()) {
                          if (categorieRevenue == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(
                                      'Veuillez sélectionner une catégorie.')),
                            );
                          } else {
                            setState(() {
                              String nom = revenueController1.text;
                              double prix =
                                  double.parse(revenueController2.text);

                              widget.personne
                                  .AjoutRevenue(nom, prix, categorieRevenue);

                              revenueController1.clear();
                              revenueController2.clear();

                              Navigator.pop(context);
                            });
                          }
                        }
                      },
                      child: Text('Ajouter dépense'),
                    ),
                    Spacer(),
                  ],
                ),
              ],
            );
          },
        );
      },

      /* onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Ajouter Revenue'),
              content: Container(
                height: 200,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: revenueController1,
                        decoration:
                            InputDecoration(labelText: 'Nom du Revenue'),
                      ),
                      TextField(
                        controller: revenueController2,
                        decoration: InputDecoration(labelText: 'Prix'),
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                      ),

                      //ajout categorie commence
                      Text('Categorie :'),
                      Container(
                        height: 200,
                        child: Wrap(children: [
                          for (Categorie cat in widget.personne.ListeCategorieR)
                            InkWell(
                              onTap: () {
                                categorieRevenue = cat;
                              },
                              child: (Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 2, vertical: 3),
                                padding: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 15),
                                decoration: BoxDecoration(
                                    color: cat.couleur,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Text(
                                  '${cat.nom}',
                                  style: TextStyle(color: Colors.white),
                                ),
                              )),
                            ),
                        ]),
                      )
                      //ajout categorie terminer
                    ],
                  ),
                ),
              ),
              actions: [
                Row(
                  children: [
                    Spacer(),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Annuler')),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        setState(
                          () {
                            String nom = revenueController1.text;
                            double prix = double.parse(revenueController2.text);

                            widget.personne
                                .AjoutRevenue(nom, prix, categorieRevenue);

                            revenueController1.clear();
                            revenueController2.clear();

                            Navigator.pop(context);
                          },
                        );
                      },
                      child: Text('Ajouter revenue'),
                    ),
                    Spacer(),
                  ],
                ),
              ],
            );
          },
        );
      }, */
      child: Container(
        height: 50,
        width: 170,
        decoration: BoxDecoration(
          color: green1,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10)),
        ),
        child: Row(
          children: [
            Spacer(),
            Icon(
              Icons.add,
              size: 30,
              color: Colors.white,
            ),
            Text(
              'Ajouter revenue',
              style: TextStyle(color: Colors.white),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
