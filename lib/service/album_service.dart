import 'dart:convert';

import 'package:earth_quake_app/model/album_model.dart';
import 'package:http/http.dart' as http;

class FetchAlbumApi {
  // TODO: [ ✅ ] get the api adress and parameter [ 🔥 ][ ✅ ]
  // TODO: [ ✅ ] recive the json data by http and convert it to map.
  // TODO: [ ✅ ] send the data to model.
  // TODO: [ ☑️ ] user the model to get the data inside the app widgets.
  // todo: get data and convert it to list:
  // what if there is no data ?
  // todo: add the data inside the design

// future : to wait untile the data downloaded.
// async await used to make the function wait untile data came.
// List<Album>: the data will return from this future
  Future<List<AlbumModel>> fetchAlbum() async {
    // get the json data as string:
    String apiUrl = "https://jsonplaceholder.typicode.com/albums/";
    http.Response response = await http.get(Uri.parse(apiUrl));
    // CONTROL! 🔥🔥🔥🔥
    // first Scenario: the data will come without errors.
    if (response.statusCode == 200) {
      // get data : response.body
      // convert to json: json.decode(response.body)
      var body = json.decode(response.body);

      List<AlbumModel> albumList = [];
      for (var item in body) {
        albumList.add(AlbumModel.fromJson(item));
      }
      return albumList;
    } else {
      // scound Scenario: the data will come with errors.
      return null;
    }
  }
}
