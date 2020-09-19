part of 'info_cubit.dart';

abstract class InfoState extends Equatable {
  const InfoState();
}

class InfoInitial extends InfoState {
  const InfoInitial();
  @override
  List<Object> get props => [];
}
class InfoLoaded extends InfoState{
  final Comic comic;
  const InfoLoaded({@required this.comic}):assert(comic!=null);

  @override
  List<Object> get props => [comic];
}
