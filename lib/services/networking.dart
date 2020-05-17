import 'package:http/http.dart' as http;
import 'dart:convert';

class Network {

  String url;

  Network(this.url);

  Future getNetworkData() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      return decodedData;
    }
  }
}