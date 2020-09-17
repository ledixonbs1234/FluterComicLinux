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
