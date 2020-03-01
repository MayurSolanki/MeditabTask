import 'package:MeditabTask/api_bloc.dart';
import 'package:MeditabTask/specialities_model.dart';
import 'package:flutter/material.dart';

class Specialities extends StatelessWidget {
  ApiBloc apiBloc = ApiBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('List Of Specialities'),
          backgroundColor: Colors.blue,
        ),
        body: Center(
            child: Container(
                child: FutureBuilder<SpecialitiesModel>(
                    future: apiBloc.fetchSpecialities(),
                    builder:
                        (context, AsyncSnapshot<SpecialitiesModel> snapshot) {
                      if (snapshot.hasData) {
                        return ListView.separated(
                            separatorBuilder:
                                (BuildContext context, int index) => Divider(),
                            itemCount: snapshot.data.data.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(snapshot.data.data[index].name),
                                subtitle:
                                    Text(snapshot.data.data[index].description),
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
