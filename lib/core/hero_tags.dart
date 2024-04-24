import 'package:careflix/layers/data/model/show.dart';

import 'enum.dart' as Enums;

class HeroTag {
  static String image(String urlImage, {required Enums.HeroTagsTypes token}) =>
      urlImage + Enums.HeroTagsEnumToString(token);
  static String title(Show show, {required Enums.HeroTagsTypes token}) =>
      show.title + show.releaseDate + Enums.HeroTagsEnumToString(token);
  static String season(Show show, {required Enums.HeroTagsTypes token}) =>
      show.season != null
          ? (show.season! + Enums.HeroTagsEnumToString(token))
          : (show.releaseDate + Enums.HeroTagsEnumToString(token));
  static String star(Show show,
          {int? index, required Enums.HeroTagsTypes token}) =>
      show.title +
      show.releaseDate +
      Enums.HeroTagsEnumToString(token) +
      (index != null ? index.toString() : "");
}

class HeroTagTokens {
  /// show list tags
  static const animatedWidget = Enums.HeroTagsTypes.FromAnimatedList;
  static const movieCard = Enums.HeroTagsTypes.FromMoviesCard;
  static const myList = Enums.HeroTagsTypes.FromMyList;
  static const movies = Enums.HeroTagsTypes.FromMovies;
  static const series = Enums.HeroTagsTypes.FromSeries;
  static const anime = Enums.HeroTagsTypes.FromAnime;
}
