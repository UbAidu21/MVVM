import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mvvm/data/app_exceptions.dart';
import 'package:mvvm/data/network/base_api_services.dart';

class NetworkApiServices extends BaseApiServices {
  //Get Api Request Function
  @override
  Future getGetResponse(String url) async {
    dynamic responeJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      responeJson = returnRsponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responeJson;
  }

//POST API resquest Function
  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responeJson;
    //Try to POST data
    try {
      Response response =
          await post(Uri.parse(url), body: data).timeout(Duration(seconds: 10));
      responeJson = returnRsponse(response);

      //Trowing an Exception
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responeJson;
  }

//Checking API STATUS CODE

  dynamic returnRsponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(
          response.body.toString(),
        );
      case 404:
        throw UnauthorizedException(response.body.toString());
      default:
        throw FetchDataException(
          'Error occure while communicating with server' +
              'with status code' +
              response.statusCode.toString(),
        );
    }
  }
}
