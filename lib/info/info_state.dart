part of 'info_cubit.dart';

abstract class InfoState extends Equatable {
  const InfoState();
}

class InfoInitial extends InfoState {
  @override
  List<Object> get props => [];
}
class InfoLoadded extends InfoState{
  final String content;
  const InfoLoadded({@required this.content}):assert(content!=null);

  @override
  // TODO: implement props
  List<Object> get props => [content];
}
