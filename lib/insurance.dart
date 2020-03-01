import 'package:MeditabTask/api_bloc.dart';
import 'package:MeditabTask/insurance_model.dart';
import 'package:flutter/material.dart';

class Insurance extends StatelessWidget {
  ApiBloc apiBloc = ApiBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('List Of Insurances'),
          backgroundColor: Colors.blue,
        ),
        body: Center(
            child: Container(
                child: FutureBuilder<InsuranceModel>(
                    future: apiBloc.fetchInsurance(),
                    builder: (context, AsyncSnapshot<InsuranceModel> snapshot) {
                      if (snapshot.hasData) {
                        return ListView.separated(
                            separatorBuilder:
                                (BuildContext context, int index) => Divider(),
                            itemCount: snapshot.data.data.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(snapshot.data.data[index].name),
                                subtitle: Text(snapshot.data.data[index].name),
                              );
                            });
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      // By default, show a loading spinner.
                      return Center(child: CircularProgressIndicator());
                    }))));
  }
}
