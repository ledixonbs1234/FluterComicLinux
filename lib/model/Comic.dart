import 'package:equatable/equatable.dart';

class Comic extends Equatable{

  final String ten;
  final String noiDung;
  final String url;
  final String tinhTrang;
  final String luotXem;
  final String imagePath;

  Comic({this.ten,this.noiDung,this.url,this.tinhTrang,this.luotXem,this.imagePath});

  @override
  List<Object> get props => throw UnimplementedError();}