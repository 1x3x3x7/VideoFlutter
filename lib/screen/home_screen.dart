import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:video_flutter/model/app_state.dart';
import 'package:video_flutter/redux/actions.dart';
import 'package:video_flutter/router/app_routes.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Video App"),
        ),
        body: Container(
          color: Colors.white,
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                  margin: EdgeInsets.all(10),
                  child: Container(
                    width: double.infinity, //stretches to maximum width
                    height: 200.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: NetworkImage(""),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: TextButton(
                        child: Text("Video $index"),
                        onPressed: () => StoreProvider.of<AppState>(context)
                            .dispatch(
                                NavigatePushAction(AppRoutes.video_screen))),
                  ));
            },
          ),
        ));
  }
}
