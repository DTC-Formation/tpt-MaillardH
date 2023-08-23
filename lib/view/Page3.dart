import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tsitsio/model/theme.dart';

import 'package:tsitsio/service/ListeCategorie.dart';

import 'package:tsitsio/view/NavBar.dart';
import 'package:tsitsio/model/model.dart';

class Page3 extends StatefulWidget {
  final Personne personne;
  Page3({super.key, required this.personne});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  TextEditingController categorieControllerD = TextEditingController();
  static List<Text> titre = const [Text('Revenue'), Text('Depense')];

  String nom = '';
  List<Tab> tabs = titre
      .map((title) => Tab(
            child: title,
          ))
      .toList();
  TabBar tabBar() => TabBar(tabs: tabs);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: titre.length,
      child: Scaffold(
        bottomNavigationBar: NavBar(
          currentPageIndex: 2,
          pers: widget.personne,
        ),
        appBar: AppBar(
          backgroundColor: context.watch<ColorProvider>().color,
          title: Row(
            children: [
              Icon(Icons.menu_open),
              SizedBox(
                width: 5,
              ),
              Text('Catégories'),
            ],
          ),
          bottom: tabBar(),
        ),
        body: TabBarView(
          children: [
            ListeCategorieR(personne: widget.personne),
            ListeCategorieD(personne: widget.personne),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Ajouter Nouveau categorie'),
                    content: Container(
                      height: 200,
                      child: Column(
                        children: [
                          TextField(
                            controller: categorieControllerD,
                            decoration: InputDecoration(
                              labelText: 'Nom Categorie',
                            ),
                          ),
                          Text('Choisir icon'),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          setState(
                            () {
                              String nom = categorieControllerD.text;

                              Categorie cat = Categorie(
                                  nom: nom,
                                  couleur: Colors.pink,
                                  icon: Icon(Icons.house));
                              widget.personne.ListeCategorieD.add(cat);

                              Navigator.pop(context);
                            },
                          );
                        },
                        child: Text('Ajouter dépense'),
                      ),
                    ],
                  );
                });
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
