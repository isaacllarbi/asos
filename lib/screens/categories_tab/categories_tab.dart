import 'package:flutter/material.dart';

class CategoriesTab extends StatefulWidget {
  @override
  _CategoriesTabState createState() => _CategoriesTabState();
}

class _CategoriesTabState extends State<CategoriesTab> {
  List<dynamic> categories = [
    {"name": 'NEW IN', "imageUrl": 'assets/images/shoes.jpeg'},
    {"name": 'CLOTHING', "imageUrl": 'assets/images/clothing.jpeg'},
    {"name": 'SHOES', "imageUrl": 'assets/images/shoes.jpeg'},
    {"name": 'ACCESSORIES', "imageUrl": 'assets/images/accessories.jpeg'},
    {"name": 'FACE + BODY', "imageUrl": 'assets/images/makeup.jpeg'},
    {"name": 'BRANDS', "imageUrl": 'assets/images/shoes.jpeg'},
    {"name": 'OUTLET', "imageUrl": 'assets/images/shoes.jpeg'},
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: categories.length, itemBuilder: buildCategories);
  }

  Widget buildCategories(BuildContext context, int i) {
    var catName = categories[i]['name'].toString();
    TextStyle style = TextStyle(
        fontSize: 16, letterSpacing: 1.2, fontWeight: FontWeight.bold);
    Padding categoryText = Padding(
      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
      child: Text(catName, style: style),
    );

    var catUrl = categories[i]['imageUrl'].toString();

    var image = Container(
        width: 90,
        height: double.infinity,
        child: Image.asset(catUrl, fit: BoxFit.cover));

    return Container(
      color: Colors.grey.withOpacity(0.6),
      height: 110,
      margin: EdgeInsets.fromLTRB(12, 16, 12, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [categoryText, image],
      ),
    );
  }
}
