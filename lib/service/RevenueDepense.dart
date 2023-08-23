import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import '../model/model.dart';

class RevenueDepense extends StatelessWidget {
  final Personne personne;
  RevenueDepense({Key? key, required this.personne}) : super(key: key);
  Color grey1 = Color.fromARGB(255, 95, 95, 95);
  Color black1 = Color.fromARGB(255, 32, 32, 32);
  Color green1 = Color.fromARGB(255, 4, 172, 32);
  Color red1 = Color.fromARGB(255, 219, 56, 56);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      child: Card(
        color: Colors.white,
        elevation: 8,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            children: [
              Spacer(),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Spacer(),
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.monetization_on,
                            color: green1,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Revenue',
                                  style: TextStyle(color: grey1, fontSize: 15),
                                ),
                                Text(
                                  'Ar ${personne.totalRevenue}',
                                  style: TextStyle(color: green1, fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              Spacer(),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Spacer(),
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.money_off,
                            color: red1,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Dépenses',
                                  style: TextStyle(color: grey1, fontSize: 15),
                                ),
                                Text(
                                  'Ar ${personne.totalDepense}',
                                  style: TextStyle(color: red1, fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
