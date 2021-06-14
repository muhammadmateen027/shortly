part of 'shortly_bloc.dart';

@immutable
abstract class ShortlyState {
  const ShortlyState();

  List<Object> get props => [];
}

class ShortlyInitial extends ShortlyState {}



class ShortlyLoading extends ShortlyState {}

class LinkShortened extends ShortlyState {}

class AvailableLinks extends ShortlyState {
  final List<Map<String, dynamic>> rows;

  const AvailableLinks({@required this.rows});

  @override
  List<Object> get props => [rows];
}
