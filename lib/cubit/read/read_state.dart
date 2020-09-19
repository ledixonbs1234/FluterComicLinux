part of 'read_cubit.dart';

abstract class ReadState extends Equatable {
  const ReadState();
}

class ReadInitial extends ReadState {
  @override
  List<Object> get props => [];
}

class ReadLoaded extends ReadState{
  final List<PageModel> pages;
  const ReadLoaded(this.pages);
  @override
  List<Object> get props => [pages];
}
