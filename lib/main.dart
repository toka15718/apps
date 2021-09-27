import 'package:flutter/material.dart';
import 'package:gallery_app/models/photosJson.dart';
import 'package:gallery_app/services/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    final httpLine=Http();
    return Scaffold(
      body:FutureBuilder(
        future: httpLine.fetchData(),
        builder: (context,AsyncSnapshot<List>  snapshot){
          return snapshot.connectionState != ConnectionState.done &&
                  !snapshot.hasData
              ? Center(
                  child: CircularProgressIndicator(
                  color: Colors.blue,
                  strokeWidth: 5.0,
                ))

              : StaggeredGridView.countBuilder(
  crossAxisCount: 7,//ال6 ديه بتبقى تقسيمة الشاشة 
  itemCount: 100,

  itemBuilder: (BuildContext context,  i){
    final _photosModel = Photos.fromJson(snapshot.data[i]);
    return Container(
    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(_photosModel.url))),
    );},
  staggeredTileBuilder: ( i) {
      return StaggeredTile.count(1, i.isEven ? 1: 5); }
) ;
        },
        ) ,
    );
  }
}
