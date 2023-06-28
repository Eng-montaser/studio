import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BaseApi {
  Api api = Api();
}
class Api {
  static final _api = Api._internal();
  factory Api() {
    return _api;
  }
  Api._internal();

  ///*****************************************************
  ///    set Api Url
  ///*****************************************************
//https://demo.treblle.com/api/v1/
//  String path = '/api/v2/client';
//   https://tradeinsolutions.ae/auction/api/register
  String baseUrl = 'satc.live';
  String path = '/api';

  ///*****************************************************
  ///    set Headers
  ///*****************************************************
  /*getHeaders() async{
    SharedPreferences shared_User = await SharedPreferences.getInstance();
    var token =await shared_User.getString('token');
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    };

    return headers;
  }*/

  ///*****************************************************
  ///    Http Get
  ///*****************************************************
  Future<http.Response> httpGet(String endPath,
      {Map<String, String>? query}) async {
    SharedPreferences shared_User = await SharedPreferences.getInstance();
    var token =await shared_User.getString('token');
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    };
   // print('in header get: $endPath');
    Uri uri = Uri.https(baseUrl, '$path/$endPath');
    if (query != null) {
      uri = Uri.https(baseUrl, '$path/$endPath', query);
    }
    print('in header get: ${uri.query}');
    return http.get(uri, headers:headers);
  } Future<http.Response> httpGetwithouttoken(String endPath,
      {Map<String, String>? query}) async {

   // print('in header get: $endPath');
    Uri uri = Uri.https(baseUrl, '$path/$endPath');
    if (query != null) {
      uri = Uri.https(baseUrl, '$path/$endPath', query);
    }
    print('in header get: ${uri.query}');
    return http.get(uri, );
  }

  ///*****************************************************
  ///    Http Post
  ///*****************************************************
  Future<http.Response> httpPost(String endPath, Object? body, {Map<String,dynamic>? param}) async {
    SharedPreferences shared_User = await SharedPreferences.getInstance();
    var token =await  shared_User.getString('token');
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    };

   if(param!=null){
     Uri uri = Uri.https(baseUrl, '$path/$endPath',param);

     if(body != null)
       return http.post(uri, body: body, headers: headers);
     else
       return http.post(uri,  headers: headers);
   }
else{
     Uri uri = Uri.https(baseUrl, '$path/$endPath',);

     if(body != null)
       return http.post(uri, body: body, headers: headers);
     else
       return http.post(uri,  headers: headers);
   }
  }
  Future<http.Response> httpPostrefresh(String endPath,) async {
    SharedPreferences shared_User = await SharedPreferences.getInstance();
    var token =await  shared_User.getString('token');
    Map<String, String> headers = {
      'token': '$token',
      'Accept': 'application/json',
    };

    Uri uri = Uri.https(baseUrl, '$path/$endPath');

    return http.post(uri,  headers: headers);

  }
  Future<http.Response> httpPostWithoutToken(String endPath,  body) async {



    Uri uri = Uri.https(baseUrl, '$path/$endPath',body);

    return http.post(uri, body: body, );

  }Future<http.Response> httpPostreg(String endPath,  body) async {



    Uri uri = Uri.https(baseUrl, '$path/$endPath',body);

    return http.post(uri, body: body, );

  }

  ///*****************************************************
  ///    Http Post With One File
  ///*****************************************************
  Future<http.Response> httpPostWithFile(
      String endPath, Map<String, String> body,
      {File? file}) async {
    SharedPreferences shared_User = await SharedPreferences.getInstance();
    var token =await shared_User.getString('token');
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    };
    Uri uri = Uri.https(baseUrl, '$path/$endPath');
    var length = await file?.length();


    http.MultipartRequest request = new http.MultipartRequest('POST', uri)
      ..headers.addAll(headers)
      ..fields.addAll(body)
      ..files.add(
        ///set name parametter of file in api
        http.MultipartFile('image', file!.openRead(), length ?? 0,
            filename: basename(file.path)),
      );
    return await http.Response.fromStream(await request.send())
        .timeout(Duration(seconds: 10));
  }

  ///*****************************************************
  ///    Http Post With List Of Files
  ///*****************************************************
  Future<http.Response> httpPostWithFiles(
      String endPath, Map<String, String> body,
      {List<File>? filesList}) async {
    SharedPreferences shared_User = await SharedPreferences.getInstance();
    var token =await shared_User.getString('token');
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    };
    List<http.MultipartFile> multipartFilesList = [];
    Uri uri = Uri.https(baseUrl, '$path/$endPath');
    for (var file in filesList!) {
      var length = await file.length();
      multipartFilesList.add(http.MultipartFile(

          ///set name parametter of file in api
          'images[]',
          file.openRead(),
          length,
          filename: basename(file.path)));
    }
    http.MultipartRequest request = new http.MultipartRequest('POST', uri)
      ..headers.addAll(headers)
      ..fields.addAll(body)
      ..files.addAll(multipartFilesList);
    return await http.Response.fromStream(await request.send());
  }
}
