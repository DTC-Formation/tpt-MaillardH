import "package:flutter/material.dart";
import 'package:tsitsio/model/model.dart';
import 'package:tsitsio/model/theme.dart';
import 'package:tsitsio/service/ListeCategorie.dart';
import 'package:tsitsio/service/ListeTransaction.dart';
import 'package:tsitsio/service/RevenueDepense.dart';
import 'package:tsitsio/service/ajoutDepense.dart';
import 'package:tsitsio/service/ajoutRevenue.dart';
import 'package:tsitsio/service/money.dart';
import "package:tsitsio/view/NavBar.dart";
import 'package:provider/provider.dart';
import 'package:tsitsio/view/theme.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  TextEditingController depenseController1 = TextEditingController();
  TextEditingController depenseController2 = TextEditingController();
  TextEditingController revenueController1 = TextEditingController();
  TextEditingController revenueController2 = TextEditingController();

  String nom = '';
  double prix = 0.0;
  Color colo = Color(0xFFFF1100);
  late Categorie categorieDepense;

  late Categorie categorieRevenue;

  @override
  Widget build(BuildContext context) {
    Personne p1 = Provider.of<Personne>(context);
    return Scaffold(
      bottomNavigationBar: NavBar(
        currentPageIndex: 0,
        pers: p1,
      ),
      appBar: AppBar(
        backgroundColor: context.watch<ColorProvider>().color,
        title: Row(
          children: [
            Icon(Icons.menu_open),
            SizedBox(
              width: 5,
            ),
            Text('Transactions'),
          ],
        ),
      ),
      endDrawer: draw(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              Money(personne: p1),
              SizedBox(
                height: 10,
              ),
              RevenueDepense(personne: p1),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 5),
                    AjouterRevenue(personne: p1),
                    Spacer(),
                    AjouterDepense(personne: p1),
                    SizedBox(width: 5),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(height: 300, child: ListeTransaction(personne: p1)),
            ],
          ),
        ),
      ),
    );
  }

  Drawer draw() {
    return Drawer(
      child: Container(
        margin: EdgeInsets.only(right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 60,
            ),
            SizedBox(
              height: 80,
            ),
            ListTile(
              leading: Icon(Icons.edit_document),
              title: Text('Gerer compte'.toUpperCase()),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.color_lens),
              title: Text('Theme'.toUpperCase()),
              onTap: () {
                Navigator.pop(context);
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                          title: Text('Choisissez une couleur:'),
                          content: Container(
                              width: 300, height: 300, child: ColorTheme()));
                    });
              },
            ),
            ListTile(
              leading: Icon(Icons.manage_accounts),
              title: Text('Modifier profil'.toUpperCase()),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.money_off),
              title: Text('Reinitialiser Solde'.toUpperCase()),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.devices_other),
              title: Text('Autres'.toUpperCase()),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
