import 'dart:convert';
import 'package:http/http.dart' as http;
class Http{
  // ignore: non_constant_identifier_names
  Future <List<dynamic>>fetchData() async{
    final _url='https://jsonplaceholder.typicode.com/photos/';
    final _responsePhotos=await http.get(Uri.parse(_url));
    final decodePhotos=json.decode(_responsePhotos.body) ;
    return decodePhotos;
  } 
}