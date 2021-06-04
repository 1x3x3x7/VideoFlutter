import 'package:video_flutter/model/app_state.dart';

import 'loading_reducer.dart';
import 'navigation_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    isLoading: loadingReducer(state.isLoading, action),
    route: navigationReducer(state.route, action),
  );
}
