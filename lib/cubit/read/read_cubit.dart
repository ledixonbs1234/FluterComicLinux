import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app/model/PageModel.dart';
import 'package:flutter_app/resposibility/readreposibility.dart';

part 'read_state.dart';

class ReadCubit extends Cubit<ReadState> {
  final ReadResposibility _readResposibility;
  ReadCubit(this._readResposibility) : super(ReadInitial());

  void setUpView(String url)async {
   var pages =await  _readResposibility.getPages(url);
   emit(ReadLoaded(pages));
  }
}
