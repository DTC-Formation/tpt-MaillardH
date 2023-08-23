import 'package:flutter/material.dart';

class Depense {
  double prix = 0;
  String nom = '';
  DateTime date = DateTime.now();

  late Categorie categorie;
}

class Revenue {
  double prix = 0;
  String nom = '';
  DateTime date = DateTime.now();
  late Categorie categorie;
}

class Categorie {
  String nom;
  Color couleur;
  Icon icon;

  Categorie({required this.nom, required this.couleur, required this.icon});
}

enum TransactionType { depense, revenu }

class Transaction {
  late DateTime date;
  late String nom;
  late TransactionType type;
  late double prix;
}

class Personne extends ChangeNotifier {
  List<Transaction> ListeTransaction = [];
  List<Depense> ListeDepense = [];
  List<Revenue> ListeRevenue = [];
  List<Categorie> ListeCategorieR = [
    Categorie(
      nom: 'Salaire',
      couleur: Color.fromARGB(255, 39, 190, 34),
      icon: Icon(
        Icons.money,
        color: Colors.white,
      ),
    ),
    Categorie(
      nom: 'Prime',
      couleur: Color.fromARGB(255, 7, 129, 13),
      icon: Icon(
        Icons.directions_bus,
        color: Colors.white,
      ),
    ),
    Categorie(
      nom: 'Ivestissements',
      couleur: Color.fromARGB(255, 52, 156, 86),
      icon: Icon(
        Icons.directions_bus,
        color: Colors.white,
      ),
    ),
    Categorie(
      nom: 'Cadeaux',
      couleur: Color.fromARGB(255, 111, 156, 5),
      icon: Icon(
        Icons.directions_bus,
        color: Colors.white,
      ),
    )
  ];
  List<Categorie> ListeCategorieD = [
    Categorie(
      nom: 'Factures',
      couleur: Color.fromARGB(255, 105, 7, 109),
      icon: Icon(
        Icons.restaurant,
        color: Colors.white,
      ),
    ),
    Categorie(
      nom: 'Loyer',
      couleur: const Color.fromARGB(255, 1, 92, 167),
      icon: Icon(
        Icons.directions_bus,
        color: Colors.white,
      ),
    ),
    Categorie(
      nom: 'Voyage',
      couleur: Color.fromARGB(255, 207, 152, 1),
      icon: Icon(
        Icons.restaurant,
        color: Colors.white,
      ),
    ),
    Categorie(
      nom: 'Voiture',
      couleur: Colors.pink,
      icon: Icon(
        Icons.directions_bus,
        color: Colors.white,
      ),
    ),
  ];
  List<double> prixR = [];
  List<double> pirxD = [];
  String nom = '';
  String prenom = '';
  double totalRevenue = 0.0;
  double totalDepense = 0.0;

  void AjoutRevenue(String nom, double prix, Categorie categories) {
    Revenue revenue = Revenue();
    revenue.nom = nom;
    revenue.prix = prix;

    revenue.categorie = categories;
    revenue.date = DateTime.now();
    prixR.add(prix);
    ListeRevenue.add(revenue);

    Transaction transaction = Transaction();
    transaction.nom = nom;
    transaction.prix = prix;
    transaction.date = DateTime.now();
    transaction.type = TransactionType.revenu;
    ListeTransaction.add(transaction);

    totalRevenue += prix;
    notifyListeners();
  }

  void AjoutDepense(String nom, double prix, Categorie categories) {
    Depense depense = Depense();
    depense.nom = nom;
    depense.prix = prix;
    depense.date = DateTime.now();

    depense.categorie = categories;
    // ListeCategorieD.add(categories);
    pirxD.add(prix);
    ListeDepense.add(depense);

    Transaction transaction = Transaction();
    transaction.nom = nom;
    transaction.date = DateTime.now();
    transaction.type = TransactionType.depense;
    transaction.prix = prix;
    ListeTransaction.add(transaction);

    totalDepense += prix;
    notifyListeners();
  }

  void deleteDepense(int index) {
    totalDepense -= ListeDepense[index].prix;
    ListeDepense.removeAt(index);
    notifyListeners();
  }

  void deleteRevenue(int index) {
    totalRevenue -= ListeRevenue[index].prix;

    ListeRevenue.removeAt(index);
    notifyListeners();
  }
}
