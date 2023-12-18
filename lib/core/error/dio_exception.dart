import 'package:dio/dio.dart';

import '../value/constants.dart';


Map<String,String> catchDioException(DioError error){
  Map<String,String> result={};
  switch(error.type) {
    case DioErrorType.badResponse:
      var messages=error.response!.data['message'];
      String messageResult="";

      if(messages is List){
        var temp='';
        for(var mess in messages.toList()){
          temp+="$mess\n";
        }
        messageResult=temp;
      }else{
        messageResult=messages;
      }
      result.putIfAbsent(statusCode, () => error.response!.statusCode.toString());
      result.putIfAbsent(errorMessage, () => messageResult);
      break;

    case DioErrorType.connectionTimeout:
      result.putIfAbsent(statusCode, () => timeOutStatusCode.toString());
      result.putIfAbsent(errorMessage, () => timeOutStatusMessage);
      break;

    case DioErrorType.receiveTimeout:
      result.putIfAbsent(statusCode, () => timeOutStatusCode.toString());
      result.putIfAbsent(errorMessage, () => timeOutStatusMessage);
      break;

    default:
      result.putIfAbsent(statusCode, () => timeOutStatusCode.toString());
      result.putIfAbsent(errorMessage, () => timeOutStatusMessage);
      break;
  }
  return result;
}