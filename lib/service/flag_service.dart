import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flag_with_provider/repository/network/flag_network.dart';
import 'package:flag_with_provider/repository/res/exceptions.dart';
import 'package:http/http.dart'as http;


class FlagService extends FlagNetwork {
  @override
  Future getFlagNetwork(String url) async {
    try {
      final response=await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      return _returnResponse(response);
    }on SocketException{
      throw InternetException("");
    }on TimeoutException{
      throw RequestTimeOutException("");
    }on FormatException{
      throw BadRequestException("");
    }catch (error) {
      throw InvalidDataException(error.toString());
    }
  }

  dynamic _returnResponse(http.Response response){
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
        case 400:
        throw BadRequestException(response.body);
      default: InvalidDataException(response.body);
    }
  }
}
