import 'package:MeditabTask/api_bloc.dart';
import 'package:MeditabTask/doctor_model.dart';
import 'package:MeditabTask/doctor_model.dart' as Datum;
import 'package:MeditabTask/doctor_profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'doctor_model.dart';
import 'search.dart';

class AllDoctor extends StatefulWidget {
  @override
  _AllDoctorState createState() => _AllDoctorState();
}

class _AllDoctorState extends State<AllDoctor> {
  ApiBloc apiBloc = ApiBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('List Of Specialities'),
          backgroundColor: Colors.blue,
        ),
        body: ChangeNotifierProvider<Search>(
          builder: (_) => Search(),
          child: Container(
              child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  child: DoctorSearch(),
                ),
              ),
              Expanded(flex: 9, child: Container(child: DoctorList())),
            ],
          )),
        ));
  }
}

class DoctorList extends StatefulWidget {
  @override
  _DoctorListState createState() => _DoctorListState();
}

class _DoctorListState extends State<DoctorList> {
  ApiBloc apiBloc = ApiBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<Search>(context);

    if (appState.getSearchQuery.isEmpty && appState.list.isEmpty) {
      return Center(
          child: Container(
              child: FutureBuilder<DoctorModel>(
                  future: apiBloc.fetchAllDoctors(),
                  builder: (context, AsyncSnapshot<DoctorModel> snapshot) {
//                    setDatainList(snapshot);

                    if (snapshot.hasData) {
                      appState.setList(snapshot.data.data);

                      return ListView.separated(
                          separatorBuilder: (BuildContext context, int index) =>
                              Divider(),
                          itemCount: snapshot.data.data.length,
                          itemBuilder: (context, index) {
                            Datum.Title title =
                                snapshot.data.data[index].profile.title;

                            String heading =
                                (title == Datum.Title.DDS ? "DDS" : "MD");
                            String firstName =
                                snapshot.data.data[index].profile.firstName;
                            String lastName =
                                snapshot.data.data[index].profile.lastName;

                            return ListTile(
                              onTap: () {
                                navigateToDoctorProfile(
                                    snapshot.data.data[index]);
                              },
                              title: Text(heading + " " + firstName),
                              subtitle: Text(lastName),
                            );
                          });
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    // By default, show a loading spinner.
                    return Center(child: CircularProgressIndicator());
                  })));
    }
    if (appState.getSearchQuery.isEmpty && !appState.list.isEmpty) {
      return Center(
          child: Container(
              child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(),
                  itemCount: appState.list.length,
                  itemBuilder: (context, index) {
                    Datum.Title title = appState.list[index].profile.title;

                    String heading = (title == Datum.Title.DDS ? "DDS" : "MD");
                    String firstName = appState.list[index].profile.firstName;
                    String lastName = appState.list[index].profile.lastName;

                    return ListTile(
                      onTap: () {
                        navigateToDoctorProfile(appState.list[index]);
                      },
                      title: Text(heading + " " + firstName),
                      subtitle: Text(lastName),
                    );
                  })));
    } else {
      if (appState.getList.isEmpty) {
        return Center(
            child: Container(
          child: Text("No Match Found !!"),
        ));
      } else {
        return Center(
            child: Container(
                child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(),
                    itemCount: appState.getList.length,
                    itemBuilder: (context, index) {
                      Datum.Title title = appState.list[index].profile.title;

                      String heading =
                          (title == Datum.Title.DDS ? "DDS" : "MD");
                      String firstName = appState.list[index].profile.firstName;
                      String lastName = appState.list[index].profile.lastName;

                      return ListTile(
                        onTap: () {
                          navigateToDoctorProfile(appState.list[index]);
                        },
                        title: Text(heading + " " + firstName),
                        subtitle: Text(lastName),
                      );
                    })));
      }
    }
  }

  void navigateToDoctorProfile(Datum.Datum data) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DoctorProfile(datum: data),
      ),
    );
  }
}

class DoctorSearch extends StatefulWidget {
  @override
  _DoctorSearchState createState() => _DoctorSearchState();
}

class _DoctorSearchState extends State<DoctorSearch> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<Search>(context);
//    apiBloc = BlocProvider.of(context);

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        child: TextField(
          style:
              new TextStyle(fontSize: 20.0, height: 1.0, color: Colors.black),
          controller: _textEditingController,
          decoration: InputDecoration(
            labelText: "Search speciality",
            border: OutlineInputBorder(),
          ),
          onChanged: (changed) => appState.setSearchQuery(changed),
//        onSubmitted: (submitted) => appState.setDisplayText(submitted),
        ),
      ),
    );
  }
}
