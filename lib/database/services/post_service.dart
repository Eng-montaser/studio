import 'dart:io';

import 'package:http/http.dart' as http;

import '../api.dart';

class PostService extends BaseApi {
  Future<http.Response> getUser() async {
    return await api.httpPost('Customer/Profile',null);
  }
  Future<http.Response> register1(registerData) async {
    return await api.httpPostWithoutToken("General/Customers/NewRegistrationStep1", registerData);
  }
Future<http.Response> register2(String step1id,String smscode) async {
    return await api.httpPostreg("General/Customers/NewRegistrationStep2", {'step1id':step1id,'smscode':smscode});
  }

  Future<http.Response> login(String username,String password) async {
    return await api.httpPostWithoutToken("Auth/Token/Authenticate", {'Username':username,
    'Password':password});
  }
  Future<http.Response> refreshToken() async {
    return await api.httpPostrefresh("Auth/Token/refreshToken");
  }
Future<http.Response> loginst1(String mobileno) async {
    return await api.httpPostWithoutToken("Auth/Token/AuthenticateBySMSStep1", {'mobileno':mobileno});
  }
Future<http.Response> loginst2(String  mobileno,String step1id,String smscode) async {
    return await api.httpPostWithoutToken("Auth/Token/AuthenticateBySMSStep1", {'mobileno':mobileno,
    'step1id':'$step1id','smscode':smscode});
  }

  Future<http.Response> getCars() async {
    return await api.httpPost('Customer/Cars',null
    );
  }

  Future<http.Response> logout() async {
    return await api.httpPost("auth/logout",{});
  }

  Future<http.Response> addBid(int id, String amount) async {
    return await api.httpPost("bids", {'product_id': '$id', 'amount': amount});
  }

  Future<http.Response> setFCMToken(String fcmToken) async {
    return await api.httpPost("fcm", {'fcm_token': fcmToken});
  }

  Future<http.Response> updateProfileData(File? imagePath, updateData) async {
    if (imagePath != null) {
      return await api.httpPostWithFile("update", updateData, file: imagePath);
    } else {
      return await api.httpPost("update", updateData);
    }
  }


  Future<http.Response> addCar( data) async {

      return await api.httpPost("Customer/AddCar", data,);

  }
  Future<http.Response> updateCar( data,Map<String,dynamic> param) async {

      return await api.httpPost("Customer/UpdaetCar", data,param: param);

  }
  Future<http.Response> deleteCar( Map<String,dynamic> param) async {

      return await api.httpPost("Customer/DeleteCar",null ,param: param);

  }
  Future<http.Response> editCar( data,{File? file}) async {
    //return await api.httpPostWithFile("cars/update", data,file: file);
    if(file != null)
      return await api.httpPostWithFile("cars/update", data,file: file,);
    else
      return await api.httpPost("cars/update", data,);
  }
  Future<http.Response> createJobCard( data) async {
      return await api.httpPost("orders/store", data);
  }
  Future<http.Response> editJobCard( data) async {
    return await api.httpPost("orders/update", data);
  }
}
