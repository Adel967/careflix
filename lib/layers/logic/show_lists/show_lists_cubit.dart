import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../injection_container.dart';
import '../../data/model/show.dart';
import '../../data/repository/lists_repository.dart';

part 'show_lists_state.dart';

class ShowListsCubit extends Cubit<ShowListsState> {
  ShowListsCubit() : super(ShowListsInitial());

  final _listsRepo = sl<ListsRepository>();

  getShowLists() async {
    emit(ShowListsLoading());
    try {
      List responses = await Future.wait([
        _listsRepo.getTopShows(),
        _listsRepo.getTrendingShows(),
        _listsRepo.getEnglishShows(),
        _listsRepo.getArabicShows(),
        _listsRepo.getAnimeShows()
      ]);
      emit(ShowListsLoaded(
          topShows: responses[0],
          trendingShows: responses[1],
          englishShows: responses[2],
          arabicShows: responses[3],
          animeShows: responses[4]));
    } catch (e) {
      print(e);
      emit(ShowListsError(error: "Error"));
    }
  }
}
