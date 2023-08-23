import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import '../model/model.dart';

class Money extends StatelessWidget {
  final Personne personne;
  Money({Key? key, required this.personne}) : super(key: key);

  Color grey1 = Color.fromARGB(255, 95, 95, 95);
  Color black1 = Color.fromARGB(255, 32, 32, 32);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 150,
          width: double.infinity,
          child: Card(
            color: Colors.white,
            elevation: 8,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(),
                  Text(
                    'Solde total',
                    style: TextStyle(color: grey1, fontSize: 13),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text.rich(TextSpan(
                      text: 'Ar ',
                      style: TextStyle(fontSize: 25, color: black1),
                      children: [
                        TextSpan(
                          text:
                              '${(personne.totalRevenue) - (personne.totalDepense)}',
                          style: TextStyle(
                              color: black1,
                              fontWeight: FontWeight.w900,
                              fontSize: 35),
                        )
                      ])),
                  SizedBox(
                    height: 5,
                  ),
                  Divider(thickness: 0.4, color: grey1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.edit,
                        color: grey1,
                        size: 25,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Gérer les comptes',
                        style: TextStyle(
                            color: grey1,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
