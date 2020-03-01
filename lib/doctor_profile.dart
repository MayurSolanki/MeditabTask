import 'package:MeditabTask/doctor_model.dart' as Datum;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DoctorProfile extends StatelessWidget {
  final Datum.Datum datum;
  DoctorProfile({this.datum});

  @override
  Widget build(BuildContext context) {
//    Datum.InsuranceProviderName providerName =
//        datum.insurances[0].insuranceProvider.name;

//    describeEnum(providerName).toString();
    return Scaffold(
        appBar: AppBar(
          title: Text('Doctor Profile'),
          backgroundColor: Colors.blue,
        ),
        body: Container(
            child: SingleChildScrollView(
                child: Column(children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Text(
                  "Doctor Profile",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontStyle: FontStyle.normal,
                      color: Colors.red),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: Text(
                    "First Name :" + datum.profile.firstName,
                    style: TextStyle(
                        fontSize: 15.0,
                        fontStyle: FontStyle.normal,
                        color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
                  child: Text(
                    "Last Name :" + datum.profile.lastName,
                    style: TextStyle(
                        fontSize: 15.0,
                        fontStyle: FontStyle.normal,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          Text(
            "Doctor phones",
            style: TextStyle(
                fontSize: 20.0, fontStyle: FontStyle.normal, color: Colors.red),
          ),
          Divider(),
          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (BuildContext context, int index) => Divider(),
              itemCount: datum.practices.length,
              itemBuilder: (context, index) {
                return ListTile(
                    title: Text(datum.practices[index].name),
                    subtitle: GestureDetector(
                      onTap: () {
                        _launchPhone(
                            datum.practices[index].phones[index].number);
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                        child:
                            Text(datum.practices[index].phones[index].number),
                      ),
                    ));
              }),
          Text(
            "Insurance List",
            style: TextStyle(
                fontSize: 20.0, fontStyle: FontStyle.normal, color: Colors.red),
          ),
          Divider(),
          listInsurance(datum.insurances),
        ]))));
  }

  _launchPhone(String number) async {
    var url = "tel:" + number;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget listInsurance(List<Datum.Insurance> insurances) {
    if (datum.insurances.length > 0) {
      return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (BuildContext context, int index) => Divider(),
          itemCount: datum.insurances.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(datum.insurances[index].insurancePlan.name),
              subtitle: Text(datum.insurances[index].insurancePlan.uid),
            );
          });
    } else {
      return Text(
        "Insurance List is Empty",
        style: TextStyle(
            fontSize: 20.0, fontStyle: FontStyle.normal, color: Colors.red),
      );
    }
  }
}
