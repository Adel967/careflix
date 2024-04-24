import 'package:equatable/equatable.dart';

class ShowFilterState extends Equatable {
  final int? dateYear;
  final String? showType;
  final List<String> selectedCategories;

  const ShowFilterState(
      {this.dateYear, this.showType, this.selectedCategories = const []});

  ShowFilterState copyWith({
    int? dateYear,
    String? showType,
    List<String>? selectedCategories,
  }) {
    return ShowFilterState(
      dateYear: dateYear ?? this.dateYear,
      showType: showType ?? this.showType,
      selectedCategories: selectedCategories ?? this.selectedCategories,
    );
  }

  ShowFilterState copyWithNull({
    int? dateYear,
    String? showType,
    List<String>? selectedCategories,
  }) {
    return ShowFilterState(
      dateYear: dateYear,
      showType: showType,
      selectedCategories: [],
    );
  }

  @override
  List<Object?> get props =>
      [this.dateYear, this.showType, this.selectedCategories];
}
