import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/resposibility/MainResposibility.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  final MainResosibility _resosibility;
  MainCubit(this._resosibility) : super(MainInitial(defaultUrl: "https://www.nettruyen.com/truyen-tranh/toi-thang-cap-mot-minh-ss2-32618"));

  void GetContentFromWeb(String url){
    _resosibility.getInfoComicFromUrl(url);



  }
}

