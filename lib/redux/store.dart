import 'package:redux/redux.dart';

import 'app_state.dart';
import 'reducers.dart';

Store<AppState> store = Store(reducer, initialState: AppState.initialState());
