


import 'package:flutter/material.dart';
import 'package:MeditabTask/doctor_model.dart' as Datum;

class Search with ChangeNotifier {
  Search();

  String _searchQuery = "";
  List<Datum.Datum> list = new List();



  void setSearchQuery(String text) {
    _searchQuery = text;
    notifyListeners();
  }

  String get getSearchQuery => _searchQuery;


  void setList(List<Datum.Datum> text) {
    list.addAll(text);
    notifyListeners();
  }

  List<Datum.Datum> get getList{


    List<Datum.Datum> filteredList = new List();

    list.forEach((datumEach) {

      Datum.Datum datum = Datum.Datum();
      datum = datumEach;

      List<Datum.Specialty> specialityList = new List();

      if(datumEach.specialties.length > 0){

        datumEach.specialties.forEach((specialityEach) {
//          specialityEach.name.toString().toLowerCase().contains(_searchQuery.toLowerCase())
//        specialityEach.name.toString().toLowerCase() == _searchQuery.toLowerCase()

          if(specialityEach.name.toString().toLowerCase() == _searchQuery.toLowerCase()){
//          var spec = element.specialties.add(speciality);

            Datum.Specialty specialty = Datum.Specialty();
            specialty = specialityEach;

            specialityList.add(specialty);

            datum.specialties = specialityList;
            filteredList.add(datum);
          }
        });
      }


    });



    return filteredList;
  }


}