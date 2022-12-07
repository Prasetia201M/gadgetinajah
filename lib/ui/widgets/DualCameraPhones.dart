import 'package:testing/src/Models/deals.dart';
import 'package:flutter/material.dart';

class Seventhlist extends StatefulWidget {
  @override
  _SeventhlistState createState() => _SeventhlistState();
}

class _SeventhlistState extends State<Seventhlist> {
  late List<deals> deal;

  @override
  void initState() {
    super.initState();
    addDealItem();
  }

  addDealItem() {
    deal = <deals>[];
    deal.add(deals(
        "assets/phone.png",
        'Redmi Note 7 Pro',
        'From @44,900'));
    deal.add(deals(
        "assets/phone_two.png",
        'Redmi Note 7s',
        'Trending Range'));
    deal.add(deals(
        "assets/phone_three.png",
        'Realme 3',
        '1TB HDD'));
    deal.add(deals(
        "assets/nokia.png",
        'Samsung A30',
        'From @10,999'));
  }

  buildItem(BuildContext context, int index) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3.5,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height / 7,
            width: MediaQuery.of(context).size.width / 4,
            child: Image.asset(deal[index].imageUrl),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              deal[index].name,
              style: const TextStyle(fontSize: 15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Text(
              deal[index].discount,
              style: const TextStyle(color: Colors.green),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height / 1.6,
      child: Stack(
        children: <Widget>[
          Container(
            height: size.height / 1.7,
            color: const Color(0xffF5E4D2),
          ),
          Container(
            height: size.height / 7,
            width: size.width,
            alignment: Alignment.topCenter,
            child: Image.asset(
             "assets/banner_two.png"
            ),
          ),
          Positioned(
            top: 15,
            child: Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(10),
                  width: size.width,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const <Widget>[
                          Text(
                            'Dual Camera Phones',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color(0xff2874F0)),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'View All',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                  width: size.width,
                  height: size.height / 1.75,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Colors.white,
                    child: GridView.builder(
                      padding: const EdgeInsets.all(10),
                      shrinkWrap: true,
                      itemCount: 4,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return buildItem(context, index);
                      },
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
