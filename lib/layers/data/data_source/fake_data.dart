import 'package:careflix/core/enum.dart';

import '../model/show.dart';

class FakeData {
  static List<Show> shows = [
    Show(
        title: "Top Gun",
        description:
            "After thirty years, Maverick is still pushing the envelope as a top naval aviator, but must confront ghosts of his past when he leads TOP GUN's elite graduates on a mission that demands the ultimate sacrifice from those chosen to fly it.",
        season: "First",
        imageUrl:
            "https://m.media-amazon.com/images/M/MV5BZWYzOGEwNTgtNWU3NS00ZTQ0LWJkODUtMmVhMjIwMjA1ZmQwXkEyXkFqcGdeQXVyMjkwOTAyMDU@._V1_.jpg",
        duration: "02:30",
        rating: 7.5,
        category: ["Action", "Adventure"],
        type: ShowType.MOVIE,
        releaseDate: "2022"),
    Show(
        title: "Avengers",
        description:
            "The Avengers and their allies must be willing to sacrifice all in an attempt to defeat the powerful Thanos before his blitz of devastation and ruin puts an end to the universe.",
        season: "Infinity War",
        imageUrl:
            "https://m.media-amazon.com/images/M/MV5BMjMxNjY2MDU1OV5BMl5BanBnXkFtZTgwNzY1MTUwNTM@._V1_.jpg",
        duration: "02:30",
        rating: 9,
        category: ["Action", "Adventure"],
        type: ShowType.MOVIE,
        releaseDate: "2018"),
    Show(
        title: "Captain America",
        description:
            "As Steve Rogers struggles to embrace his role in the modern world, he teams up with a fellow Avenger and S.H.I.E.L.D agent, Black Widow, to battle a new threat from history: an assassin known as the Winter Soldier.",
        season: "The Winter Soldier",
        imageUrl: "https://m.media-amazon.com/images/I/818xQZGm-JL.jpg",
        duration: "03:10",
        rating: 6.5,
        category: ["Action", "Adventure"],
        type: ShowType.MOVIE,
        releaseDate: "2014"),
  ];
}
