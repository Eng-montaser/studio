import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  TextEditingController userNameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  LoginFocusNode? loginFocusNode;
  FocusNode focusNodeUserName = new FocusNode();
  FocusNode focusNodePassword = new FocusNode();
  getSignInBody() {
    // return {
    //   "app_secret": "app_secret",
    //   "name": nameController.text,
    //   "phone": phoneController.text,
    //   "email": emailController.text,
    //   "password": passwordController.text,
    // };
    return {
      "user_name": userNameController.text,
      "password": passwordController.text,
    };
  }

  getFocusNode(context) {
    switch (loginFocusNode) {
      case LoginFocusNode.userName:
        FocusScope.of(context).requestFocus(focusNodeUserName);
        break;
      case LoginFocusNode.password:
        FocusScope.of(context).requestFocus(focusNodePassword);
        break;
      case LoginFocusNode.success:
      case null:
        FocusScope.of(context).unfocus();
        break;
    }
  }

  setFocus(focus, context) {
    loginFocusNode = focus;
    getFocusNode(context);
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    if (userNameController != null) userNameController.dispose();
    if (passwordController != null) passwordController.dispose();
    super.dispose();
  }

  printData() {
    print(getSignInBody());
  }

  bool emailIsValid(String email) {
    return GetUtils.isEmail(email);
  }

  login(context) async {}
}

enum LoginFocusNode {
  // image,
  userName,
  // phone,
  password,
  success
}

//
// abstract class LoginCallBack {
//   void onLoginSuccess(UserData user);
//   void onLoginError(String error);
// }
//
// class LoginResponse {
//   LoginCallBack _callBack;
//   LoginRequest loginRequest = new LoginRequest();
//   LoginResponse(this._callBack);
//
//   doLogin(String username, String password) {
//     loginRequest
//         .getLogin(username, password)
//         .then((user) => _callBack.onLoginSuccess(user))
//         .catchError((onError) => _callBack.onLoginError(onError.toString()));
//   }
// }
//
//
// class LoginRequest {
//   LoginCtr con = new LoginCtr();
//
//   Future<UserData> getLogin(String username, String password) {
//     var result = con.getLogin(username,password);
//     return result;
//   }
// }
