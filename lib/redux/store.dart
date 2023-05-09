import 'package:json_editor_example/redux/app_state.dart';
import 'package:redux/redux.dart';

import 'reducers.dart';

Store<AppState> store = Store(reducer, initialState: AppState.initialState());
