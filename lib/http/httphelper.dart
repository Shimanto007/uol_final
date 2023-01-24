import 'package:http/http.dart' as http;

const String baseUrl = 'https://ultimateapi.hostprohub.com/api/get-categories';

class BaseClient{
  var client = http.Client();
  Future<dynamic> get(String api) async {
    var url = Uri.parse(baseUrl + api);

    var response = await client.get(url);
    if(response.statusCode == 200) {
      return response.body;
    }
    else{

    }
  }
}