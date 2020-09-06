import 'package:flutter/material.dart';

class NewInTab extends StatefulWidget {
  @override
  _NewInTabState createState() => _NewInTabState();
}

class _NewInTabState extends State<NewInTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: [
      greyDivider(),
      buildViewAllCard(context),
      buildCategories(),
      buildNewEdits()
    ]));
  }

  greyDivider() {
    return Container(height: 22, color: Colors.grey.withOpacity(0.2));
  }

  Container buildViewAllCard(BuildContext context) {
    var textStyleBig = TextStyle(fontSize: 32, fontWeight: FontWeight.bold);
    var number = Text('284', style: textStyleBig);

    var smallStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
    var newItemsText = Text('New items'.toUpperCase(), style: smallStyle);
    var hoursText =
        Text('In the last 24 hours'.toUpperCase(), style: smallStyle);

    var textColumn = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [number, SizedBox(height: 8), newItemsText, hoursText],
    );

    var image = CircleAvatar(backgroundColor: Colors.indigoAccent, radius: 50);

    var row = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [textColumn, image],
    );

    var viewAll = 'VIEW ALL';
    var btnText =
        Text(viewAll.toUpperCase(), style: TextStyle(color: Colors.white));

    var viewAllButton = Container(
        margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
        width: double.infinity,
        height: 48,
        child: RaisedButton(
            onPressed: () {},
            child: btnText,
            color: Colors.black.withOpacity(0.7)));

    return Container(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
        height: 205,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [row, viewAllButton]));
  }

  newProducts() {}

  buildCategories() {
    var newProductsText = Container(
        height: 85,
        width: double.infinity,
        color: Colors.grey.withOpacity(0.2),
        child: Align(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('New products'.toUpperCase(),
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.8),
                      fontWeight: FontWeight.w900,
                      fontSize: 16)),
            ),
            alignment: Alignment.bottomLeft));

    return Card(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      elevation: 1,
      child: Column(
        children: [
          newProductsText,
          buildCat(title: 'Clothing', url: 'assets/images/clothing.jpeg'),
          buildCat(title: 'Shoes', url: 'assets/images/shoes.jpeg'),
          buildCat(title: 'Accessories', url: 'assets/images/accessories.jpeg'),
          buildCat(title: 'Face + Body', url: 'assets/images/makeup.jpeg'),
          buildCat(title: 'Back in stock'),
          buildCat(title: 'Outlet'),
          buildCat(title: 'Trending now'),
          buildCat(title: 'ASOS DESIGN Must-Haves'),
        ],
      ),
    );
  }

  buildCat({String title, String url = 'assets/images/clothing.jpeg'}) {
    return Column(
      children: [
        ListTile(
          leading: Container(
            child: Image.asset(url, fit: BoxFit.cover),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.red,
            ),
          ),
          title: Text(title, style: TextStyle(fontSize: 14)),
        ),
        Divider()
      ],
    );
  }

  buildNewEdits() {
    var newEditsText = Container(
        height: 65,
        width: double.infinity,
        color: Colors.grey.withOpacity(0.2),
        child: Align(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('New edits'.toUpperCase(),
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.8),
                      fontWeight: FontWeight.w900,
                      fontSize: 16)),
            ),
            alignment: Alignment.bottomLeft));

    return Card(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      elevation: 1,
      child: Column(
        children: [
          newEditsText,
          buildEdits('ASOS DESIGN MUST-HAVES', 'assets/images/makeup.jpeg'),
          buildEdits('NIKE', 'assets/images/makeup.jpeg'),
          buildEdits('FRESHMAN', 'assets/images/makeup.jpeg'),
        ],
      ),
    );
  }

  buildEdits(String title, String url) {
    TextStyle style = TextStyle(
        fontSize: 16, letterSpacing: 1.2, fontWeight: FontWeight.bold);
    Padding categoryText = Padding(
      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
      child: Text(title, style: style),
    );

    var image = CircleAvatar(
      radius: 50,
      backgroundColor: Colors.tealAccent,
      backgroundImage: AssetImage(url),
    );

    return Container(
      color: Colors.grey.withOpacity(0.2),
      height: 130,
      margin: EdgeInsets.fromLTRB(12, 16, 12, 0),
      padding: EdgeInsets.fromLTRB(8, 16, 8, 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [categoryText, image],
      ),
    );
  }
}
