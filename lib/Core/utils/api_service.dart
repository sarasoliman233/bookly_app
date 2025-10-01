
import 'package:dio/dio.dart';

class ApiService{

  final baseUrl='https://www.googleapis.com/books/v1/';
  final Dio dio;

  ApiService(this.dio);

  Future<Map<String,dynamic>> get({required String endPoint})async{
  var response= await Dio().get('$baseUrl$endPoint');

  return response.data;
  }
}