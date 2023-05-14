
import 'package:flutter/material.dart';
import 'package:minip/Pages/loading.dart';
import 'package:minip/Widgets/BookTile.dart';
import 'package:minip/model/ModelClass.dart';
import 'package:minip/providers/ModelProvider.dart';
import 'package:provider/provider.dart';
class Home_page extends StatefulWidget {
  var loading ;

  Home_page({this.loading});

  @override
  _Home_pageState createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  List<ModelClass> _searchList=[];
  List<ModelClass> _listTips= [];
  TextEditingController controller = new TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.loading = true;

    final providermodel = Provider.of<ModelProvider>(context,listen: false);
    providermodel.getALLTips(_listTips);
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey.shade200,
       body: Container(
         color: Color(0xffF4F5F9),
         padding: EdgeInsets.symmetric(horizontal: 17),
         child: Container(
           width: MediaQuery.of(context).size.width,
           child: Column(
             children: <Widget>[
               Padding(
                 padding: const EdgeInsets.fromLTRB(4.0,15,4.0,0),
                 child: Container(
                   child: new Card(
                     elevation: 0,
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(15.0),
                     ),
                     child:  ListTile(
                         dense: true,

                         title: TextField(
                           controller: controller,
                           decoration: InputDecoration(
                             border: InputBorder.none,
                             prefixIcon: Icon(Icons.search),
                             filled: false,
                             hintText: 'search',
                           ),
                           onChanged: onChangedtext,
                         ),

                         trailing: new IconButton(
                           icon: new Icon(Icons.cancel),
                           onPressed: () {
                             controller.clear();
                             onChangedtext('');
                           },
                         ),
                       ),

                   ),
                 ),
               ),
               SizedBox(height: 3,),

               Container(
                 child:widget.loading ? Center(child: CircularProgressIndicator(
                   color: Colors.black54,
                   backgroundColor: Colors.white54,

                   strokeWidth: 2,
                 ),) : Expanded(
                     child: _searchList.length != 0 || controller.text.isNotEmpty
                         ?  new ListView.builder(
                         scrollDirection: Axis.vertical,
                         itemCount: _searchList.length,
                         itemBuilder: (context,i){
                           return BookTile(
                             title: _searchList[i].title,
                             des: _searchList[i].des,
                             imgUrl: _searchList[i].imgUrl,
                             url: _searchList[i].url,
                           );
                         }) : widget.loading ? Center(child: CircularProgressIndicator(
                       color: Colors.black54,
                       backgroundColor: Colors.white54,

                       strokeWidth: 2,
                     ),) :  new  ListView.builder(
                           itemCount: _listTips.length,
                         scrollDirection: Axis.vertical,
                         physics: ClampingScrollPhysics(),
                         itemBuilder: (context,i) {
                          return BookTile(
                          title: _listTips[i].title.toString(),
                            des: _listTips[i].des.toString(),
                            imgUrl: _listTips[i].imgUrl,
                            url: _listTips[i].url,
                          );
                         }
                     )
                 ),
               )

             ],
           ),
         ),
       )

    );
  }
  onChangedtext(String s) async {
    _searchList.clear();
    if (s.isEmpty) {
      setState(() {});
      return;
    }
    _listTips.forEach((user) {
      if (user.title.contains(s)||user.des.contains(s)) {
        _searchList.add(user);
      }
    });
    setState(() {
      widget.loading = false;
    });
  }

}
