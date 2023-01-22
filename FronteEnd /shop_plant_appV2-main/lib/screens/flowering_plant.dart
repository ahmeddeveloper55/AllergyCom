import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../Provider/floweringProvider.dart';
import '../model/FloweringModel.dart';
import 'floweringSearch.dart';
import 'flowering_details.dart';

class flowering_plant extends StatefulWidget {
  final Title;

  const flowering_plant({Key? key, this.Title}) : super(key: key);

  @override
  State<flowering_plant> createState() => _flowering_plantState();
}

class _flowering_plantState extends State<flowering_plant> {
  static List<FloweringModel> _list1 = [];
  @override
  void initState() {
    super.initState();
    final providermodel =
        Provider.of<floweringProvider>(context, listen: false);
    providermodel.getAllFloweringPlants(_list1);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 35),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: Icon(Icons.search, size: 30),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => floweringSearch(),
                      ));
                },
              )
            ],
          ),
          Text(widget.Title,
              style: TextStyle(color: Colors.grey, fontSize: 17)),
          SizedBox(height: 7),
          Text(
            'Plants',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Expanded(
            child: Container(
              child: ListView.builder(
                itemCount: _list1.length,
                itemBuilder: (_, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => flowering_details(
                            plant1: _list1[index],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Hero(
                            tag: _list1[index].title!,
                            child: Image.network(_list1[index].image!),
                          ),
                          SizedBox(height: 10),
                          Text(
                            _list1[index].title!,
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            _list1[index].discription!,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Text(
                                "\$${_list1[index].price}",
                                style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextButton(
                                child: Text(
                                  "+",
                                  style: TextStyle(fontSize: 22),
                                ),
                                onPressed: () {},
                              )
                            ],
                          ),
                          SizedBox(height: 30),
                          Divider(),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
