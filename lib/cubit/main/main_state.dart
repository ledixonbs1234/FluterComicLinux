part of 'main_cubit.dart';

abstract class MainState extends Equatable {
  const MainState();
}

class MainInitial extends MainState {
  final String defaultUrl;
  const MainInitial({@required this.defaultUrl});
  @override
  List<Object> get props => [defaultUrl];
}
class MainLoading extends MainState{

  const MainLoading();
  @override
  List<Object> get props => [];
}
class MainLoaded extends MainState{
  final Comic comic;

  const MainLoaded(this.comic);
  @override
  List<Object> get props => [comic];
}
