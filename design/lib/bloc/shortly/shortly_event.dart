part of 'shortly_bloc.dart';

@immutable
abstract class ShortlyEvent {
  const ShortlyEvent();

  List<Object> get props => [];
}

class ShortenLink extends ShortlyEvent {
  final String url;

  const ShortenLink({@required this.url});

  @override
  List<Object> get props => [url];
}

class LoadShortlyLink extends ShortlyEvent {}

class DeleteItem extends ShortlyEvent {
  final int id;

  const DeleteItem({@required this.id});

  @override
  List<Object> get props => [id];
}
