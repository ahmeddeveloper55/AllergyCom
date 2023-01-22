import 'package:flutter/material.dart';
class DietTile extends StatelessWidget {
  final String breakfast;
  final String dinner;
  final String launch;
  final String mealType;

  const DietTile({Key key, this.breakfast, this.dinner, this.launch,this.mealType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Column(
        children: [
          Text(mealType + " : " , style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
          Card(
            margin: EdgeInsets.all(12.0),
            elevation: 5.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child : ListTile(
                    title: Text(breakfast.toString()),
                    dense: true,
                  ),


            ),

          ),

        ],
      )
    );
  }
}
