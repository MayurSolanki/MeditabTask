import 'dart:async';
import 'dart:convert';

import 'package:MeditabTask/app_util.dart';
import 'package:MeditabTask/doctor_model.dart' as Datum;
import 'package:MeditabTask/doctor_model.dart';
import 'package:MeditabTask/insurance_model.dart';
import 'package:MeditabTask/specialities_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:simple_logger/simple_logger.dart';

class ApiBloc {
  final logger = SimpleLogger();

  List<Datum.Datum> doctorList = List();

//// streams of Color
//  StreamController searchStreamController = StreamController<String>.broadcast();
//// sink
//  Sink get searchSink => searchStreamController.sink;
//// stream
//  Stream<String> get searchStream => searchStreamController.stream;
//
//// function to change the color
//  searchDoctor(var query) {
//    if(query == ""){
//      searchSink.add("");
//    }else{
//      searchSink.add(query);
//    }
//  }
//
////disponsing our Stream
//  @override
//  dispose() {
//    searchStreamController.close();
//  }

  Future<SpecialitiesModel> fetchSpecialities() async {
    final response = await http
        .get('${AppUtil.BASE_URL}specialties?user_key=${AppUtil.USER_KEY}');

    if (response.statusCode == 200) {
//      logger.info(response.body);
//      print(response.body);

      debugPrint(response.body, wrapWidth: 2048);

      return SpecialitiesModel.fromJson(json.decode(response.body));
    } else {
      // If the server did not return a 200 OK response, then throw an exception.
      throw Exception('Failed to load Specialities');
    }
  }

  Future<DoctorModel> fetchAllDoctors() async {
    final response = await http.get(
        '${AppUtil.BASE_URL}doctors?location=37.773,-122.413,100&user_key=${AppUtil.USER_KEY}');

    if (response.statusCode == 200) {
      debugPrint(response.body, wrapWidth: 2048);
      // If the server did return a 200 OK response, then parse the JSON.
      return DoctorModel.fromJson(json.decode(response.body));
    } else {
      // If the server did not return a 200 OK response, then throw an exception.
      throw Exception('Failed to load Doctor list');
    }
  }

  Future<InsuranceModel> fetchInsurance() async {
    final response = await http
        .get('${AppUtil.BASE_URL}insurances?user_key=${AppUtil.USER_KEY}');

    if (response.statusCode == 200) {
      logger.info(response.body);
      debugPrint(response.body, wrapWidth: 2048);
      // If the server did return a 200 OK response, then parse the JSON.
      return InsuranceModel.fromJson(json.decode(response.body));
    } else {
      // If the server did not return a 200 OK response, then throw an exception.
      throw Exception('Failed to load insurance list');
    }
  }
}
