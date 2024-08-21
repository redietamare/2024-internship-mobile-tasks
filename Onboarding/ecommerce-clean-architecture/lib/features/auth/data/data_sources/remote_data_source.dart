import 'dart:convert';

import 'package:ecommerce/features/auth/data/model/user_model.dart';
import 'package:ecommerce/features/auth/domain/entities/user.dart';
import 'package:http/http.dart' as http;

import '../../../../core/constants/constants.dart';
import '../../../../core/error/exception.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> login(String email, String password);
  Future<UserEntity> register(String name,String email, String password);
}

class UserRemoteDataSourceImpl extends UserRemoteDataSource {
  final http.Client client;
  UserRemoteDataSourceImpl({required this.client});

  @override
  Future<UserEntity> register(String name, String email, String password) async {
    final uri = Uri.parse(Urls.registerUrl);
    final response = await client.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': name,
        'email': email,
        'password': password,
      }),
    );  
    print('from remote');
    print(response.body);
    if (response.statusCode == 201) {
      final jsondata = jsonDecode(response.body);
      return UserModel.fromJson(jsondata['data']);
    } else {
      throw ServerException('registration failed');
    }
  }
  @override
  Future<UserModel> login(String email, String password) async {
    final urilogin = Uri.parse(Urls.loginUrl);
    final urime = Uri.parse(Urls.meUrl);
    final responselogin = await client.post(
      urilogin,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );
    if (responselogin.statusCode == 201) {
      final jsondatalogin = jsonDecode(responselogin.body);
      final accesstoken =jsondatalogin['data']['access_token'];
      final response_me = await client.get(
        urime,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accesstoken'}
      );
      if(response_me.statusCode == 200){
        final jsondata_me = jsonDecode(response_me.body);
        return UserModel.fromJson(jsondata_me['data']);

    } else {
      throw ServerException('get me failed');
    }
  }else{
    throw ServerException('login failed');
  }
  
}
  
}