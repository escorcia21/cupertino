import 'dart:convert';
import 'package:http/http.dart' as http;

class RickAndMortyService {
  final String baseURL = 'rickandmortyapi.com';

  Future<List<dynamic>> fetch({String? name}) async {
    //var url = Uri.https(baseURL, 'api/character/', {'name': name});
    var url = Uri.https(baseURL, '/api/character');
    final response = await http.get(url).then((res) {
      if (res.statusCode == 200) {
        var json = jsonDecode(res.body);
        return json['results'];
      }
    })
        //.then((res) => res['results'])
        .catchError((onError) {
      throw Exception("No se puedo hacer el fetch:\n $onError");
    });

    return response;
  }
}
