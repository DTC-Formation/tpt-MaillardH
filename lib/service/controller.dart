/* import 'package:flutter/material.dart';
import 'package:tsitsio/model/model.dart';

class ListeDepens extends StatefulWidget {
  final Personne personne;
  const ListeDepens({Key? key, required this.personne}) : super(key: key);
  @override
  State<ListeDepens> createState() => _ListeDepenseState();
}

class _ListeDepenseState extends State<ListeDepens> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Liste depense'),
        Expanded(
          child: ListView.builder(
            itemCount: widget.personne.ListeDepense.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                elevation: 8,
                child: Container(
                  height: 50,
                  color: widget.personne.ListeDepense[index].categorie.couleur,
                  child: Row(
                    children: [
                      Spacer(),
                      Text(
                        '$index',
                        style: TextStyle(color: Colors.white),
                      ),
                      Spacer(),
                      Text(
                        widget.personne.ListeDepense[index].nom,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Spacer(),
                      Text(
                        '${widget.personne.ListeDepense[index].prix}',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Spacer(),
                      Text(
                        '${widget.personne.ListeDepense[index].categorie.nom}',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            print('delete $index');
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
        Divider(),
        Container(
          color: (((widget.personne.totalRevenue) -
                      (widget.personne.totalDepense)) >=
                  0
              ? Colors.green
              : Colors.red),
          child: Text(
            'total Revenue : ${widget.personne.totalRevenue} depense : ${widget.personne.totalDepense} reste : ${(widget.personne.totalRevenue) - (widget.personne.totalDepense)}',
          ),
        ),
        Divider(),
        Text('Liste Revenue'),
        Expanded(
          child: ListView.builder(
            itemCount: widget.personne.ListeRevenue.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                elevation: 8,
                child: Container(
                  height: 50,
                  color: widget.personne.ListeRevenue[index].categorie.couleur,
                  child: Row(
                    children: [
                      Spacer(),
                      Text(
                        '$index',
                        style: TextStyle(color: Colors.white),
                      ),
                      Spacer(),
                      Text(
                        '${widget.personne.ListeRevenue[index].prix}',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Spacer(),
                      Text(
                        widget.personne.ListeRevenue[index].nom,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Spacer(),
                      Spacer(),
                      Text(
                        '${widget.personne.ListeRevenue[index].categorie.nom}',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            widget.personne.deleteRevenue(index);
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
    );
  }
}
 */