import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';


class MyBlocObserver extends BlocObserver {
  @override
  Future onCreate(BlocBase bloc) async{
    super.onCreate(bloc);
    log('onCreate -- ${bloc.runtimeType}');
  }

  @override
  Future onChange(BlocBase bloc, Change change)async {
    super.onChange(bloc, change);
    log('onChange -- ${bloc.runtimeType}, $change');
  }

  @override
  Future onError(BlocBase bloc, Object error, StackTrace stackTrace) async{
    log('onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  Future onClose(BlocBase bloc) async{
    super.onClose(bloc);
    log('onClose -- ${bloc.runtimeType}');
  }
}