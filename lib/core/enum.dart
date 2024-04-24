enum HeroTagsTypes {
  FromAnimatedList,
  FromMoviesCard,
  FromMyList,
  FromMovies,
  FromSeries,
  FromAnime
}

String HeroTagsEnumToString(HeroTagsTypes type) {
  switch (type) {
    case HeroTagsTypes.FromAnimatedList:
      return "FromAnimatedList";
    case HeroTagsTypes.FromMoviesCard:
      return "FromMoviesCard";
    case HeroTagsTypes.FromMyList:
      return "FromMyList";
    case HeroTagsTypes.FromMovies:
      return "FromMovies";
    case HeroTagsTypes.FromSeries:
      return "FromSeries";
    case HeroTagsTypes.FromAnime:
      return "FromAnime";
  }
}

enum Gender { Male, Female }
