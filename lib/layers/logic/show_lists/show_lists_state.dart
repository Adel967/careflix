part of 'show_lists_cubit.dart';

@immutable
abstract class ShowListsState extends Equatable {}

class ShowListsInitial extends ShowListsState {
  @override
  List<Object?> get props => [];
}

class ShowListsLoading extends ShowListsState {
  @override
  List<Object?> get props => [];
}

class ShowListsLoaded extends ShowListsState {
  final List<Show> topShows;
  final List<Show> trendingShows;
  final List<Show> englishShows;
  final List<Show> arabicShows;
  final List<Show> animeShows;

  ShowListsLoaded(
      {required this.topShows,
      required this.trendingShows,
      required this.englishShows,
      required this.arabicShows,
      required this.animeShows});

  @override
  List<Object?> get props => [
        this.topShows,
        this.trendingShows,
        this.englishShows,
        this.arabicShows,
        this.animeShows
      ];
}

class ShowListsError extends ShowListsState {
  final String error;

  ShowListsError({required this.error});

  @override
  List<Object?> get props => [this.error];
}
