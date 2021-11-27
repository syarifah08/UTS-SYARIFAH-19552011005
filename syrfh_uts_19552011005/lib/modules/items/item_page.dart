import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syrfh_uts_19552011005/modules/items/item_detail.dart';
import 'package:syrfh_uts_19552011005/utils/search.dart';
import 'package:syrfh_uts_19552011005/modules/data/item_data.dart';
import 'package:syrfh_uts_19552011005/modules/models/items.dart';

class ItemPage extends StatefulWidget {
  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  List<Item> items = allItems;
  String query = '';

  @override
  void iniState() {
    super.initState();

    items = allItems;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: PreferredSize(
      preferredSize: Size.fromHeight(60),
      child: AppBar(
        actions: [
          Container(
            padding: EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width / 1,
            color: Colors.white70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.deepOrange),
                  child: IconButton(
                      onPressed: (){
                      }, icon: Icon(Icons.menu, color: Colors.white,)),
                  alignment: Alignment.center,
                ),
                Image.asset('assets/images/fujifilm-banner.png',
                    width: MediaQuery.of(context).size.width / 3),
                Container(
                    decoration: BoxDecoration(shape: BoxShape.circle,
                      color: Colors.black,),
                    child: IconButton(
                        onPressed: (){
                        }, icon: Icon(Icons.shopping_bag_outlined, color: Colors.white,)))

              ],
            ),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 1,
      ),
    ),
    body: Column(
      children: <Widget>[
        buildSearch(),
        Expanded(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];

              return buildProduct(item);
            },
          ),
        ),
      ],
    ),
  );

  Widget buildSearch() => SearchWidget(
    text: query,
    hintText: 'Search',
    onChanged: searchItem,
  );

  Widget buildProduct(Item item) => Stack(
      children: [
        Center(
          child: Container(
            width: 360,
            height: 200,
            decoration: BoxDecoration(shape: BoxShape.rectangle,borderRadius: BorderRadius.circular(15)),
            child: Stack(
                children: [
                  Container(
                    width: 335,
                    height: 170,
                    decoration: BoxDecoration(shape: BoxShape.rectangle, color: Color(int.parse(item.color)),borderRadius: BorderRadius.circular(15)),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15, left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Limited Edition", style: TextStyle(fontSize: 11,color: Colors.white)),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Text("Instax", style: TextStyle(color: Colors.white)),
                            SizedBox(width: 5),
                            Text(item.name, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),)
                          ],
                        ),
                        SizedBox(height: 10,),
                        Text(item.price, style: TextStyle(fontSize: 25,color: Colors.white, fontWeight: FontWeight.bold)),
                        SizedBox(height: 10,),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          child: Text('Buy', style: TextStyle(fontSize: 15, color: Color(int.parse(item.color))),),
                          onPressed: () {
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) => ItemDetail(item: item))
                            );
                          },
                        )
                      ],),
                  ),
                ]
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(right: 15, top: 20),
          alignment: Alignment.centerRight,
          child: Image.asset(
            item.url, width: 125,
          ),
        ),
      ]
  );

  void searchItem(String query) {
    final items = allItems.where((item) {
      final nameLower = item.name.toLowerCase();
      final priceItem = item.price.toString();
      final searchLower = query.toLowerCase();

      return nameLower.contains(searchLower) || priceItem.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.items = items;
    });
  }
}