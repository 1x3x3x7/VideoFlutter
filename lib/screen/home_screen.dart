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
                        image: NetworkImage(
                            "https://images.unsplash.com/photo-1611861615311-4409a7dc648d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2178&q=80"),
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
