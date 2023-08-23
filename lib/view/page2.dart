import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tsitsio/model/theme.dart';

import 'package:tsitsio/service/ListeDepense.dart';
import 'package:tsitsio/service/ListeRevenue.dart';

import 'package:tsitsio/view/NavBar.dart';
import 'package:tsitsio/model/model.dart';

class Page2 extends StatefulWidget {
  final Personne pers;
  const Page2({super.key, required this.pers});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
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
          currentPageIndex: 1,
          pers: widget.pers,
        ),
        appBar: AppBar(
          backgroundColor: context.watch<ColorProvider>().color,
          title: Row(
            children: [
              Icon(Icons.menu_open),
              SizedBox(
                width: 5,
              ),
              Text('Rapports'),
            ],
          ),
          bottom: tabBar(),
        ),
        body: TabBarView(children: [
          ListeRevenue(personne: widget.pers),
          ListeDepense(personne: widget.pers),
        ]),
      ),
    );
  }
}
