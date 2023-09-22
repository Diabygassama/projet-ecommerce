import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Produit {
  final String nom;
  final String description;
  final double prix;
  final String image;

  Produit({
    required this.nom,
    required this.description,
    required this.prix,
    required this.image,
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BoutiquePage(),
    );
  }
}

class BoutiquePage extends StatefulWidget {
  @override
  _BoutiquePageState createState() => _BoutiquePageState();
}

class _BoutiquePageState extends State<BoutiquePage> {
  List<Produit> produits = [
    Produit(
      nom: "Tomate",
      description: "Description du produit 1",
      prix: 1000,
      image: "images/product-5.jpg",
    ),
    Produit(
      nom: "Carotte",
      description: "Description du produit 2",
      prix:1500,
      image: "images/product-7.jpg",
    ),
    
     Produit(
      nom: "Poivron",
      description: "Description du produit 2",
      prix:1500,
      image: "images/product-1.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SAMANDUGU'), 
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Ajouter une fonctionnalité de recherche
            },
          ),
          IconButton(
            icon: Icon(Icons.filter_list), 
            onPressed: () {
              // Ajouter une fonctionnalité de filtrage
            },
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        padding: EdgeInsets.all(10),
        itemCount: produits.length,
        itemBuilder: (ctx, index) {
          return Card(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Image.network(
                    produits[index].image,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        produits[index].nom,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        produits[index].description,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '${produits[index].prix.toStringAsFixed(2)} FCFA',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
  
}
 