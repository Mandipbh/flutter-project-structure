import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_project_structure/Networking/NetworkHelper/custom_exception.dart';
import 'package:flutter_project_structure/constant/api_keys.dart';
import 'package:flutter_project_structure/utils/mixin/progress_hub.dart';
import 'package:flutter_project_structure/utils/mixin/toast_message.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

enum RequestMethods { GET, POST, PUT, DELETE, POSTFILE }
Map<String,String> commonHeader = {
  ApiServicesHeaderKEYs.accept: "application/json",
  ApiServicesHeaderKEYs.contentType: "application/json"
};

Map<String,String> commonHeaderWithToken = {
  ApiServicesHeaderKEYs.accept: "application/json",
  ApiServicesHeaderKEYs.contentType: "application/json",
  ApiServicesHeaderKEYs.authorization : "Bearer "
};

Map<String,String> commonHeaderWithMultiPartFormData={
  ApiServicesHeaderKEYs.authorization:"Bearer ",
  ApiServicesHeaderKEYs.contentType: "multipart/form-data",
};

class ApiService {
  static bool isHideProgress = false;
  static hideProgress(BuildContext context) {
    if (!isHideProgress) {
      Navigator.pop(context);
      isHideProgress = true;
    }
  }

  static Future<dynamic> request(String url, RequestMethods methods, {BuildContext? context,Map<String, String>? header, Map<String, dynamic>? requestBody, bool showLoader = true, bool showLogs = true, Color? loaderColor, List<File>? postFiles,String? fileStringKey}) async {
    BuildContext contextApi = context ?? Get.context!;
    isHideProgress = false;
    if (showLoader) {
      showProgressThreeDots(contextApi,loaderColor:loaderColor ?? Colors.blue);
    }
    try {
      if (showLogs) {
        log("---Request url: \n$url \nheader: $header \nbody: $requestBody");
      }
      var response = await apiCallMethod(url, methods, header: header ?? {}, requestBody: requestBody ?? {},postFiles: postFiles,fileStringKey:fileStringKey);
      var multiPartResponse = '';
      if (showLogs) {
        if(methods == RequestMethods.POSTFILE && response is http.StreamedResponse){
          /// listen for response
          multiPartResponse = await response.stream.bytesToString();
          log("---Multi part Response :  $multiPartResponse StatusCode: ${response.statusCode ?? 0}");
        }else {
          log("---Response :  ${response?.body ?? {}} StatusCode: ${response?.statusCode ?? 0}");
        }
      }
      if (showLoader) {
        hideProgress(contextApi);
      }
      if (response != null && response is http.Response) {
        if (response.statusCode == 200 && response.body.isNotEmpty) {
          return jsonDecode(response.body);
        } else {
          if (response.statusCode == 404 || response.statusCode == 502) {
            log("---!! AuthenticationFailed !!---");
            var displayError = jsonDecode(response.body);

          } else {
            var error = responseCodeHandle(contextApi, response).toString();
            log("--- Error : $error");
            showToast(contextApi, error, Toast.LENGTH_SHORT);
          }
          return null;
        }
      } else if(methods == RequestMethods.POSTFILE){
        return jsonDecode(multiPartResponse);
      }else{
        log("---!! somethingWentWrong !!---");
        showToast(contextApi, "Something went wrong", Toast.LENGTH_SHORT);
        return null;
      }
    } on SocketException catch (_) {
      if (showLoader) {
        hideProgress(contextApi);
      }
      showToast(contextApi, "Mobile data off", Toast.LENGTH_SHORT);
    } catch (e) {
      if (showLogs) {
        log("---Error : $e");
      }
      if (showLoader) {
        hideProgress(contextApi);
      }
      return null;
    }
  }

  static dynamic responseCodeHandle(
      BuildContext context, http.Response response) {
    switch (response.statusCode) {
      case 400:
        throw BadRequestException(context, response.body.toString());
      case 401:
      case 404:
      case 403:
        throw UnauthorisedException(context, response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            context, 'An error occurred while communicating with the server: ${response.statusCode}');
    }
  }

  static Future<dynamic> apiCallMethod(String url, RequestMethods methods,
      {Map<String, String>? header, Map<String, dynamic>? requestBody, List<File>? postFiles,String? fileStringKey }) async {
    if (methods == RequestMethods.GET) {
      return await http.get(Uri.parse(url), headers: header!);
    } else if (methods == RequestMethods.POST) {
      return await http.post(Uri.parse(url),
          headers: header!, body: jsonEncode(requestBody!));
    } else if (methods == RequestMethods.PUT) {
      return await http.put(Uri.parse(url),
          headers: header!, body: jsonEncode(requestBody!));
    } else if (methods == RequestMethods.DELETE) {
      return await http.delete(Uri.parse(url),
          headers: header!, body: jsonEncode(requestBody!));
    }
    else if (methods == RequestMethods.POSTFILE && postFiles != null){
      var request = http.MultipartRequest(RequestMethods.POST.name, Uri.parse(url));
      request.headers.addAll(header!);
      if(fileStringKey != null){
          request.files.add(http.MultipartFile.fromString("confirmations", "item"));
      }
      request.fields.addAll(requestBody!.map((key, value) => MapEntry(key, value.toString())));
      for(File postFile in postFiles) {
          var multipartFile = await http.MultipartFile.fromPath(fileStringKey ?? ProfileKEYs.profile, postFile.path, filename: basename(postFile.path),contentType: MediaType(MediaTypeKEYs.image, MediaTypeKEYs.jpeg));
          request.files.add(multipartFile);
      }
      return await request.send();
    }
    return null;
  }
}