import 'package:flutter/material.dart';


class SearchAppBar extends StatefulWidget {
  @override
  _SearchAppBarState createState() => new _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
  Widget appBarTitle = new Text("Home");
  Icon actionIcon = new Icon(Icons.search);
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: new Scaffold(
          appBar: new AppBar(
         backgroundColor: Colors.black,
          title:appBarTitle,
          actions: <Widget>[
          new IconButton(icon: actionIcon,onPressed:(){

        setState(() {
          if ( this.actionIcon.icon == Icons.search){

            this.actionIcon = new Icon(Icons.close);
            this.appBarTitle = new TextField(
                style: new TextStyle(color: Colors.white,),


              decoration: new InputDecoration(
                  prefixIcon: new Icon(Icons.search,color: Colors.white),
                  hintText: "Search for movies",
                  hintStyle: new TextStyle(color: Colors.white)
              ),
            );

          }
          else {
            this.actionIcon = new Icon(Icons.search);
            this.appBarTitle = new Text("Home");
          }


        });
          } ,),]
          ),
      ),
    );
  }
}