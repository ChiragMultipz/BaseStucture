import 'dart:async';
import 'package:base_flutter/networking/Response.dart';
import 'package:base_flutter/networking/models/AllUserResponseModel.dart';
import 'package:base_flutter/networking/models/UserResponseModel.dart';
import 'package:base_flutter/networking/repository/Repositories.dart';

class UserBloc {
  UserRepository? _userRepository;

  ///get all user
  StreamController? _userBlocController;
  StreamSink<Response<AllUserResponseModel>> get userDataSink =>
      _userBlocController.sink;
  Stream<Response<AllUserResponseModel>> get userStream =>
      _userBlocController.stream;


  ///create user
  StreamController? _userCreateController;
  StreamSink<Response<UserResponseModel>> get createUserDataSink =>
      _userCreateController.sink;
  Stream<Response<UserResponseModel>> get createUserStream =>
      _userCreateController.stream;

  ///delete user
  StreamController? _deleteUserController;
  StreamSink<Response<UserResponseModel>> get deleteDataSink =>
      _deleteUserController.sink;
  Stream<Response<UserResponseModel>> get deleteUserStream =>
      _deleteUserController.stream;


  ///Active deactivate user
  StreamController? _enableDisableUserController;
  StreamSink<Response<UserResponseModel>> get enableDisableDataSink =>
      _enableDisableUserController!.sink;
  Stream<Response<UserResponseModel>> get enableDisableStream =>
      _enableDisableUserController.stream;

  ///update user
  StreamController? _updateUserController;
  StreamSink<Response<UserResponseModel>> get updateUserDataSink =>
      _updateUserController.sink;
  Stream<Response<UserResponseModel>> get updateUserStream =>
      _updateUserController.stream;


  UserBloc() {
    _userBlocController = StreamController<Response<AllUserResponseModel>>();
    _userCreateController = StreamController<Response<UserResponseModel>>();
    _deleteUserController = StreamController<Response<UserResponseModel>>();
    _enableDisableUserController = StreamController<Response<UserResponseModel>>();
    _updateUserController = StreamController<Response<UserResponseModel>>();

    _userRepository = UserRepository();
  }

  getUsers(UserRequest userRequest) async {
    userDataSink.add(Response.loading('get users'));
    try {
      AllUserResponseModel ordersResponseData =
          await _userRepository!.getAllUser(userRequest);
      print(ordersResponseData);

      userDataSink.add(Response.completed(ordersResponseData));
    } catch (e) {
      userDataSink.add(Response.error(e.toString()));
      print(e);
    }
    return null;
  }


  createUser(CreateUserRequest createUserRequest) async {

    createUserDataSink.add(Response.loading('create user'));
    try {
      UserResponseModel ordersResponseData =
      await _userRepository!.createUser(createUserRequest);
      print(ordersResponseData);

      createUserDataSink.add(Response.completed(ordersResponseData));
    } catch (e) {
      createUserDataSink.add(Response.error(e.toString()));
      print(e);
    }
    return null;
  }


  deleteUser(String userId) async {

    deleteDataSink.add(Response.loading('delete user'));
    try {
      UserResponseModel ordersResponseData =
      await _userRepository!.deleteUser(userId);
      print(ordersResponseData);

      deleteDataSink.add(Response.completed(ordersResponseData));
    } catch (e) {
      deleteDataSink.add(Response.error(e.toString()));
      print(e);
    }
    return null;
  }


  enableDisableUser(String userId, bool isActive) async {

    enableDisableDataSink.add(Response.loading('Active Deactive user'));
    try {
      UserResponseModel ordersResponseData =
      await _userRepository!.activeDeactiveUser(userId, isActive);
      print(ordersResponseData);

      enableDisableDataSink.add(Response.completed(ordersResponseData));
    } catch (e) {
      enableDisableDataSink.add(Response.error(e.toString()));
      print(e);
    }
    return null;
  }

  ///to update User
  updateUser(String userId, UpdateUserRequest updateUserRequest) async {

    updateUserDataSink.add(Response.loading('Update Product'));
    try {
      UserResponseModel userResponseData =
      await _userRepository!.updateUser(userId, updateUserRequest);
      print(userResponseData);

      updateUserDataSink.add(Response.completed(userResponseData));
    } catch (e) {
      updateUserDataSink.add(Response.error(e.toString()));
      print(e);
    }
    return null;
  }

  dispose() {
    _userCreateController!.close();
    _userBlocController!.close();
    _deleteUserController!.close();
    _enableDisableUserController!.close();
    _updateUserController!.close();
  }
}
