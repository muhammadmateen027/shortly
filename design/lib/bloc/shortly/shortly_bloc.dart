import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:design/repository/model/shorten_url.dart';
import 'package:design/repository/repository_interface.dart';
import 'package:design/repository/storage.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'shortly_event.dart';

part 'shortly_state.dart';

class ShortlyBloc extends Bloc<ShortlyEvent, ShortlyState> {
  final RepositoryInterface repository;

  ShortlyBloc({@required this.repository}) : super(ShortlyInitial());
  final dbHelper = DatabaseHelper.instance;

  @override
  Stream<ShortlyState> mapEventToState(
    ShortlyEvent event,
  ) async* {
    if (event is ShortenLink) {
      yield* _shortenLinkToState(event);
    }

    if (event is LoadShortlyLink) {
      yield* _loadLinkToState(event);
    }

    if (event is DeleteItem) {
      yield* _deleteRowToState(event, state);
    }
  }

  Stream<ShortlyState> _shortenLinkToState(ShortenLink event) async* {

    Response response = await repository.shortenUrl(event.url);
    ShortenUrl shortenUrl = ShortenUrl.fromJson(response.data['result']);

    Map<String, dynamic> row = {
      DatabaseHelper.columnUrl : shortenUrl.originalLink,
      DatabaseHelper.columnShortenUrl  : shortenUrl.fullShareLink
    };

    await dbHelper.insert(row);

    yield LinkShortened();
  }

  Stream<ShortlyState> _loadLinkToState(LoadShortlyLink event) async* {
    yield AvailableLinks(rows: await dbHelper.queryAllRows());
  }

  Stream<ShortlyState> _deleteRowToState(DeleteItem event, ShortlyState state) async* {
    await dbHelper.delete(event.id);
    yield AvailableLinks(rows: await dbHelper.queryAllRows());
  }
}
