/* import 'package:flutter/material.dart';

import '../model/model.dart';

class AjouterDepense extends StatefulWidget {
  final Personne personne;
  AjouterDepense({super.key, required this.personne});

  @override
  State<AjouterDepense> createState() => _AjouterDepenseState();
}

class _AjouterDepenseState extends State<AjouterDepense> {
  
  TextEditingController depenseController1 = TextEditingController();
  TextEditingController depenseController2 = TextEditingController();
  Color red1 = Color.fromARGB(255, 219, 56, 56);
  late Categorie categorieDepense;

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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: depenseController1,
                        decoration:
                            InputDecoration(labelText: 'Nom de la dépense'),
                      ),
                      TextField(
                        controller: depenseController2,
                        decoration: InputDecoration(labelText: 'Prix'),
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                      ),

                      //ajout categorie commence
                      Text('Categorie :'),
                      Container(
                        height: 200,
                        child: Wrap(children: [
                          for (Categorie cat in widget.personne.ListeCategorieD)
                            InkWell(
                              onTap: () {
                                categorieDepense = cat;
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
                            String nom = depenseController1.text;
                            double prix = double.parse(depenseController2.text);

                            widget.personne
                                .AjoutDepense(nom, prix, categorieDepense);

                            depenseController1.clear();
                            depenseController2.clear();

                            Navigator.pop(context);
                          },
                        );
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
      child: Container(
        height: 90,
        width: 150,
        decoration: BoxDecoration(
          color: red1,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Spacer(),
            Icon(
              Icons.add,
              size: 50,
              color: Colors.white,
            ),
            Text(
              'Ajouter depense',
              style: TextStyle(color: Colors.white),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

 */

import 'package:flutter/material.dart';

import '../model/model.dart';

class AjouterDepense extends StatefulWidget {
  final Personne personne;
  AjouterDepense({super.key, required this.personne});

  @override
  State<AjouterDepense> createState() => _AjouterDepenseState();
}

class _AjouterDepenseState extends State<AjouterDepense> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController depenseController1 = TextEditingController();
  TextEditingController depenseController2 = TextEditingController();
  Color red1 = Color.fromARGB(255, 219, 56, 56);
  Categorie categorieDepense =
      Categorie(nom: 'voituree', couleur: Colors.amber, icon: Icon(Icons.abc));

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
                          controller: depenseController2,
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
                          controller: depenseController1,
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
                                  in widget.personne.ListeCategorieD)
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      categorieDepense = cat;
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
                          if (categorieDepense == null) {
                            // Aucune catégorie sélectionnée, afficher un message d'erreur
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(
                                      'Veuillez sélectionner une catégorie.')),
                            );
                          } else {
                            setState(() {
                              String nom = depenseController1.text;
                              double prix =
                                  double.parse(depenseController2.text);

                              widget.personne
                                  .AjoutDepense(nom, prix, categorieDepense);

                              depenseController1.clear();
                              depenseController2.clear();
                              // Réinitialiser la catégorie sélectionnée

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
      child: Container(
        height: 50,
        width: 170,
        decoration: BoxDecoration(
          color: red1,
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(10)),
        ),
        child: Row(
          children: [
            Spacer(),
            Text(
              'Ajouter depense',
              style: TextStyle(color: Colors.white),
            ),
            Icon(
              Icons.add,
              size: 30,
              color: Colors.white,
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
