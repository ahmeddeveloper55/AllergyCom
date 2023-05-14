import 'package:flutter/material.dart';
import 'package:minip/Pages/AirticleView.dart';

class BookTile extends StatelessWidget {
  final String des;
  final String imgUrl;
  final String title;
  final String url;

  const BookTile({Key key, this.des, this.imgUrl, this.title, this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AirticleView(articleurl: url),
            ));
      },
      child: Container(
        alignment: Alignment.bottomLeft,
        height: 190,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width - 5,
              height: MediaQuery.of(context).size.height / 4.8,
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(22)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 220 - 90,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 220,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              title.toString(),
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.clip),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Expanded(
                            child: Text(
                          des,
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              overflow: TextOverflow.clip),
                          textDirection: TextDirection.ltr,
                        )),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 150,
              margin: EdgeInsets.only(left: 12, top: 6),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    imgUrl,
                    width: 100,
                    height: 150,
                    fit: BoxFit.cover,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
