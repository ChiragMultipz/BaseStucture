import 'dart:convert';

import 'package:base_flutter/networking/models/AllUserResponseModel.dart';
import 'package:base_flutter/networking/models/LoginResponseModel.dart';
import 'package:base_flutter/networking/models/UserResponseModel.dart';
import 'package:base_flutter/utils/constants.dart' as Constants;
import '../ApiProvider.dart';


class LoginRepository {
  ApiProvider _apiProvider = ApiProvider();

  Future<LoginResponseModel> loginAdmin(LoginRequest loginRequest) async {
    final response =
        await _apiProvider.post(Constants.SING_IN, jsonEncode(loginRequest));
    return LoginResponseModel.fromJson(response);
  }
}

class UserRepository {
  ApiProvider _apiProvider = ApiProvider();

  Future<AllUserResponseModel> getAllUser(UserRequest userRequest) async {
    final response = await _apiProvider.get(
        "${Constants.GET_ALL_USER}?limit=${userRequest.limit}&"
        "page_no=${userRequest.page_no}&userRole=${userRequest.userRole}&search=${userRequest.search}");
    return AllUserResponseModel.fromJson(response);
  }

  Future<UserResponseModel> createUser(CreateUserRequest userRequest) async {
    final response = await _apiProvider.postWithToken(
        Constants.CREATE_USER, jsonEncode(userRequest));
    return UserResponseModel.fromJson(response);
  }

  Future<UserResponseModel> deleteUser(String userId) async {
    final response =
        await _apiProvider.delete(Constants.DELETE_USER_BY_ID + userId);
    return UserResponseModel.fromJson(response);
  }

  Future<UserResponseModel> activeDeactiveUser(
      String userId, bool isActive) async {
    final response = await _apiProvider.patch(
        Constants.ACTIVE_DEACTIVE_USER + userId,
        body: {"status": isActive});
    return UserResponseModel.fromJson(response);
  }

  Future<UserResponseModel> updateUser(
      String id, UpdateUserRequest updateUserRequest) async {
    final response = await _apiProvider
        .put(Constants.UPDATE_USER + id, body: updateUserRequest);
    return UserResponseModel.fromJson(response);
  }
}