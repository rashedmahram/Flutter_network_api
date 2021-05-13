import 'dart:convert';
import 'package:http/http.dart' as http;

main(List<String> args) async {
  String urlData = 'https://earthquake.usgs.gov/fdsnws/event/1/application.json';
  final response = await http.get(Uri.parse(urlData));
  // print(response.body);

  DataLoader data = DataLoader.fromJson(jsonDecode(response.body));
  print("${data.eventtypes}");
}

class DataLoader {
  List<String> catalogs;
  List<String> contributors;
  List<String> producttypes;
  List<String> eventtypes;
  List<String> magnitudetypes;

  DataLoader({this.catalogs, this.contributors, this.producttypes, this.eventtypes, this.magnitudetypes});

  DataLoader.fromJson(Map<String, dynamic> json) {
    catalogs = json['catalogs'].cast<String>();
    contributors = json['contributors'].cast<String>();
    producttypes = json['producttypes'].cast<String>();
    eventtypes = json['eventtypes'].cast<String>();
    magnitudetypes = json['magnitudetypes'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['catalogs'] = this.catalogs;
    data['contributors'] = this.contributors;
    data['producttypes'] = this.producttypes;
    data['eventtypes'] = this.eventtypes;
    data['magnitudetypes'] = this.magnitudetypes;
    return data;
  }
}
