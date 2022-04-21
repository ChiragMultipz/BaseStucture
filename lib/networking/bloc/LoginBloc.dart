import 'dart:async';
import 'package:base_flutter/networking/Response.dart';
import 'package:base_flutter/networking/models/LoginResponseModel.dart';
import 'package:base_flutter/networking/repository/Repositories.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:base_flutter/utils/constants.dart' as Constants;

class LoginBloc {
  LoginRepository? _loginRepository;
  StreamController? _loginBlocController;

  StreamSink<Response<LoginResponseModel>>? get loginDataSink =>
      _loginBlocController.sink;

  Stream<Response<LoginResponseModel>> get loginStream =>
      _loginBlocController.stream;

  LoginBloc() {
    _loginBlocController = StreamController<Response<LoginResponseModel>>();
    _loginRepository = LoginRepository();
  }

  bool isLoggedIn = false;


  loginUser(LoginRequest loginRequest) async {
    loginDataSink!.add(Response.loading('login'));
    try {
      LoginResponseModel loginData =
          await _loginRepository!.loginAdmin(loginRequest);
      print(loginData);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(Constants.AUTHTOKEN, loginData.result!.token!);

      isLoggedIn = true;
      loginDataSink!.add(Response.completed(loginData));
    } catch (e) {
      loginDataSink!.add(Response.error(e.toString()));
      isLoggedIn = false;
      print(e);
    }
    return null;
  }

  dispose() {
    _loginBlocController!.close();
  }
}
