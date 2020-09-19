import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/Comic.dart';
import 'package:flutter_app/resposibility/mainreposibility.dart';

part 'main_state.dart';


class MainCubit extends Cubit<MainState> {
  final MainResosibility _resosibility;
  MainCubit(this._resosibility) : super(MainInitial(defaultUrl: "https://www.nettruyen.com/truyen-tranh/toi-thang-cap-mot-minh-ss2-32618"));

  void getContentFromWeb(String url)async{
    emit(MainLoading());
    Comic comic =await _resosibility.getInfoComicFromUrl(url);
    emit(MainLoaded(comic));
    emit(MainInitial(defaultUrl: "https://www.nettruyen.com/truyen-tranh/toi-thang-cap-mot-minh-ss2-32618"));
  }
}

