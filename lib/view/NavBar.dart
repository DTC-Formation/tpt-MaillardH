import 'package:flutter/material.dart';
import 'package:tsitsio/model/model.dart';
import "package:tsitsio/view/Page3.dart";
import "package:tsitsio/view/page2.dart";
import 'package:tsitsio/view/page1.dart';

class NavBar extends StatefulWidget {
  final int currentPageIndex;
  final Personne pers;
  NavBar({super.key, required this.currentPageIndex, required this.pers});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      destinations: [
        NavigationDestination(icon: Icon(Icons.menu), label: 'Transactions'),
        NavigationDestination(icon: Icon(Icons.analytics), label: 'Rapports'),
        NavigationDestination(icon: Icon(Icons.category), label: 'Catégorie'),
      ],
      selectedIndex: widget.currentPageIndex,
      onDestinationSelected: (int index) {
        setState(() {
          if (index == 0) {
            Navigator.pushAndRemoveUntil(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    Page1(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return child;
                },
              ),
              (route) => false,
            );
          } else if (index == 1) {
            Navigator.pushAndRemoveUntil(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => Page2(
                  pers: widget.pers,
                ),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return child;
                },
              ),
              (route) => false,
            );
          } else {
            Navigator.pushAndRemoveUntil(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    Page3(personne: widget.pers),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return child;
                },
              ),
              (route) => false,
            );
          }
        });
      },
    );
  }
}
