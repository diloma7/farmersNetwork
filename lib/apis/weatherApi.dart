import 'package:http/http.dart' as http;
//import 'package:shared_preferences/shared_preferences.dart';

class Api {
  final _url = 'https://api.openweathermap.org/data/2.5/onecall';
  final apikey = '7f6913b46038dc4db5ae978b85ed66e3';
  //post records
  postData(data, apiUrl) async {
    var fullUrl = _url + apiUrl;
    // print(fullUrl);
    return await http.post(Uri.parse(fullUrl),
        body: data, headers: _setHeaders());
  }

  getWeather(String lat, String lon, String part, String units) async {
    var fullUrl = _url +
        "?lat=" +
        lat +
        "&lon=" +
        lon +
        "&exclude=" +
        part +
        "&units=" +
        units +
        "&appid=" +
        apikey;
    //await _getToken();
    //print(fullUrl);
    return await http.get(Uri.parse(fullUrl));
  }

  // get records
  getData(data, apiUrl) async {
    var fullUrl = _url + apiUrl; //await _getToken();
    //print(fullUrl);
    return await http.get(Uri.parse(fullUrl), headers: _setHeaders());
  }

//update records
  updateData(params, data, apiUrl) async {
    var fullUrl = _url + apiUrl + '/' + params;
    print(fullUrl);
    return await http.put(Uri.parse(fullUrl),
        body: data, headers: _setHeaders());
  }

  //update records
  deleteData(id, apiUrl) async {
    var fullUrl = _url + apiUrl + '/' + id;
    //print(fullUrl);
    return await http.delete(Uri.parse(fullUrl),
        //body:data,
        headers: _setHeaders());
  }

  getDataById(id, apiUrl) async {
    var fullUrl = _url + apiUrl + '/' + id; //await _getToken();
    // print(fullUrl);
    return await http.get(Uri.parse(fullUrl), headers: _setHeaders());
  }

  getDataByIds(id, apiUrl) async {
    var fullUrl = _url + apiUrl + '/' + id; //await _getToken();
    //print(fullUrl);
    return await http.get(Uri.parse(fullUrl), headers: _setHeaders());
  }

  _setHeaders() => {
        //'Content-type' : 'application/json',
        //'Accept' : 'application/json',
        //'Content-Type': 'application/x-www-form-urlencoded',
        //'Content-Type': 'application/json',
      };

  _getToken() async {
    // SharedPreferences localStorage = await SharedPreferences.getInstance();
    // var token = localStorage.getString('token');
    // return '?token=$token';
  }
}
