import 'package:equatable/equatable.dart';

class PageModel extends Equatable{
  final String url;
  final String originUrl;

  PageModel(this.url,this.originUrl);
  @override
  List<Object> get props => throw UnimplementedError();

}