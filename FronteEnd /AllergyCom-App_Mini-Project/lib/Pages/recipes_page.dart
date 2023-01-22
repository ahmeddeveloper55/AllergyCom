import 'package:flutter/material.dart';
import 'package:minip/Widgets/BookTile.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:minip/model/ModelRecipe.dart';
import 'package:minip/providers/ModelRecipeProvider.dart';
import 'package:provider/provider.dart';

import 'AirticleView.dart';

class recipes_page extends StatefulWidget {
  var loading ;

  recipes_page({this.loading});

  @override
  _recipes_pageState createState() => _recipes_pageState();
}

class _recipes_pageState extends State<recipes_page> {
  List<ModelRecipe> _searchList=[];
  List<ModelRecipe> _recipelist= [];
  TextEditingController controller = new TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    widget.loading = true;
    final providermodel = Provider.of<ModelRecipeProvider>(context,listen: false);
    providermodel.getALLRecipe(_recipelist);

    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
         margin: EdgeInsets.only(top: 7),
          child: Container(
          child: Column(
            children: [
              new Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                margin: EdgeInsets.only(top:5),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: ListTile(
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
              SizedBox(height: 10,),
              new Container(
                child:widget.loading ? Center(child: CircularProgressIndicator(
                color: Colors.black54,
                backgroundColor: Colors.white54,

                strokeWidth: 2,
              ),) :  Expanded(
                  child:_searchList.length != 0 || controller.text.isNotEmpty
                    ?StaggeredGridView.countBuilder(
                    staggeredTileBuilder: (index) =>
                        StaggeredTile.fit(1), //cross axis cell count
                    mainAxisSpacing: 8, // vertical spacing between items
                    crossAxisSpacing: 8, // horizontal spacing between items
                    crossAxisCount: 2, // no. of virtual columns in grid
                    itemCount: _searchList.length,
                    itemBuilder: (context, index) => buildRecipeCard(index,_searchList[index].imgUrl,_searchList[index].title,_searchList[index].url),
                  ): widget.loading ? Center(child: CircularProgressIndicator(
                    color: Colors.black54,
                    backgroundColor: Colors.white54,

                    strokeWidth: 2,
                  ),)  : StaggeredGridView.countBuilder(
                    staggeredTileBuilder: (index) =>
                        StaggeredTile.fit(1), //cross axis cell count
                    mainAxisSpacing: 8, // vertical spacing between items
                    crossAxisSpacing: 8, // horizontal spacing between items
                    crossAxisCount: 2, // no. of virtual columns in grid
                    itemCount: _recipelist.length,
                    itemBuilder: (context, index) => buildRecipeCard(index,_recipelist[index].imgUrl,_recipelist[index].title,_recipelist[index].url),
                ),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
  Widget buildRecipeCard(int index,String img,String title,String url)=>
      GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(
              builder: (context)=>AirticleView(articleurl: url),

            ));
          },
    child: Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        margin: EdgeInsets.all(4),
        child: Column(
          children :[
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(img),
            ),
            SizedBox(height: 10,),
            Text(title.toString(),style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,overflow: TextOverflow.clip),)


          ]
        ),
      ),
    ),
  );
  onChangedtext(String s) async {
    _searchList.clear();
    if (s.isEmpty) {
      setState(() {});
      return;
    }
    _recipelist.forEach((user) {
      if (user.title.contains(s)||user.des.contains(s)) {
        _searchList.add(user);
      }
    });
    setState(() {
      widget.loading = false;
    });
  }
}
