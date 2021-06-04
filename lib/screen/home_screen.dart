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
        child: Center(
            child: TextButton(
                child: Text("open next screen"),
                onPressed: () => StoreProvider.of<AppState>(context)
                    .dispatch(NavigatePushAction(AppRoutes.video_screen)))),
      ),
    );
  }
}
