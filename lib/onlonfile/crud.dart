import 'dart:convert';
import 'package:taskes/onlonfile/statusRequst.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class Crud {
  String userAuth = "ahhmm";
  String passAuth = "12GH";
  Future<Either<Statusrequst, Map>> postData(String linkurl, Map data) async {
    String basicAuth =
        'Basic ${base64Encode(utf8.encode('$userAuth:$passAuth'))}';
    try {
      var response = await http.post(
        Uri.parse(linkurl),
        body: data,
        headers: {'Authorization': basicAuth},
      );
      // print("Status Code: ${response.statusCode}");
      // print("Response Body: ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responsebody = jsonDecode(response.body);
        return Right(responsebody);
      } else if (response.statusCode == 401) {
        return const Left(Statusrequst.serverfailure);
      } else {
        return const Left(Statusrequst.serverfailure);
      }
    } catch (e) {
      // print(e);
      return const Left(Statusrequst.serverfailure);
    }
  }

  // Future<Either<Statusrequst, Map>> postData(String linkurl, Map data) async {
  //   // if (await checkInternet()) {
  //   var response = await http.post(Uri.parse(linkurl), body: data);
  //   print(response.statusCode);
  //   print("Response Body: ${response.body}");

  //   if (response.statusCode == 200 || response.statusCode == 201) {
  //     Map responsebody = jsonDecode(response.body);
  //     // print(responsebody);

  //     return Right(responsebody);
  //   } else {
  //     return const Left(Statusrequst.serverfailure);
  //   }
  //   // } else {
  //   //   return const Left(Statusrequst.offlinefailure);
  //   // }
  // }
}
