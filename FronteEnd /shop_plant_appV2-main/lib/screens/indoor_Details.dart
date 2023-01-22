import 'package:flutter/material.dart';

import '../model/indoormodel.dart';

class indoor_Details extends StatelessWidget {
  final indoormodel plant1;

  const indoor_Details({Key? key, required this.plant1}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(200),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 35),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () => Navigator.pop(context),
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(Icons.shopping_cart),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Container(
                    child: Hero(
                      tag: plant1.title!,
                      child: Image.network(plant1.image!),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 70),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Text(
                          plant1.title!,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          plant1.discription!,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              "\$${plant1.price}",
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
                      ],
                    ),
                  ),
                  SizedBox(height: 70),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildCard("Height", Icons.height, plant1.height!),
                  buildCard("Temperature", Icons.thermostat_outlined,
                      plant1.temprature!),
                  buildCard("Pot", Icons.portrait, plant1.pot!),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildCard(String title, IconData icon, String data) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 40),
        SizedBox(height: 10),
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10),
        Text(
          data,
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
