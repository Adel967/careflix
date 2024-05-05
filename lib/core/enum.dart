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

Gender stringToGender(String gender) {
  switch (gender) {
    case "M":
      return Gender.Male;
    case "F":
      return Gender.Female;
    default:
      return Gender.Male;
  }
}

String genderToString(Gender gender) {
  switch (gender) {
    case Gender.Male:
      return "M";
    case Gender.Female:
      return "F";
    default:
      return "M";
  }
}
