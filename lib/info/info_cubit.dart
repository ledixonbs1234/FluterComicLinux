import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'info_state.dart';

class InfoCubit extends Cubit<InfoState> {
  InfoCubit() : super(InfoInitial());

  void increment() {
  }
}
