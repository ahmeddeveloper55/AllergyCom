import 'package:flutter/material.dart';
import 'package:plant_appui/screens/searchGreenPage.dart';

import 'package:provider/provider.dart';

import '../Provider/greenProvider.dart';
import '../model/greenModel.dart';
import 'detail.dart';

class GreenPlant extends StatefulWidget {
  final Title;

  const GreenPlant({this.Title});
  @override
  State<GreenPlant> createState() => _GreenPlantState();
}

class _GreenPlantState extends State<GreenPlant> {
  static List<greenModel> _list1 = [];
  @override
  void initState() {
    super.initState();
    final providermodel = Provider.of<greenProvider>(context, listen: false);
    providermodel.getAllGreenPlants(_list1);
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
                        builder: (context) => searchGreenPage(),
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
                          builder: (_) => DetailPage(
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
