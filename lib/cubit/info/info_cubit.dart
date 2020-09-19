import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/model/Comic.dart';
import 'package:flutter_app/resposibility/readreposibility.dart';

part 'info_state.dart';

class InfoCubit extends Cubit<InfoState> {
  InfoCubit() : super(InfoInitial());

  void setUpInfo(Comic comic){
    emit(InfoLoaded(comic: comic));
  }
}
