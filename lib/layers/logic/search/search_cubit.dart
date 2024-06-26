import 'package:bloc/bloc.dart';
import 'package:careflix/layers/data/params/search_params.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../generated/l10n.dart';
import '../../../injection_container.dart';
import '../../data/model/show.dart';
import '../../data/repository/search_repository.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  final _searchRepo = sl<SearchRepository>();
  SearchParams searchParams = SearchParams();

  searchShow() async {
    emit(SearchLoading());
    try {
      final res = await _searchRepo.searchShow(searchParams);
      emit(SearchLoaded(shows: res));
    } catch (e) {
      emit(SearchError(error: S.current.thereIsAnError));
    }
  }
}
