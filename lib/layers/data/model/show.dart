class Show {
  final String title;
  final String description;
  final String? season;
  final String imageUrl;
  final String? duration;
  final double rating;
  final List<String> category;
  final int? episodeNum;
  final String type;
  final String releaseDate;

  Show(
      {required this.title,
      required this.description,
      this.season,
      required this.imageUrl,
      this.duration,
      required this.rating,
      required this.category,
      this.episodeNum,
      required this.type,
      required this.releaseDate});

  Map<String, dynamic> toMap() {
    return {
      'title': this.title,
      'description': this.description,
      'season': this.season,
      'imageUrl': this.imageUrl,
      'duration': this.duration,
      'rating': this.rating,
      'category': this.category,
      'episodeNum': this.episodeNum,
      'type': this.type,
    };
  }

  factory Show.fromMap(Map<String, dynamic> map) {
    return Show(
      title: map['title'] as String,
      description: map['description'] as String,
      season: map['season'] as String,
      imageUrl: map['imageUrl'] as String,
      duration: map['duration'] as String,
      rating: map['rating'] as double,
      category: map['category'] as List<String>,
      episodeNum: map['episodeNum'] as int,
      type: map['type'] as String,
      releaseDate: map['releaseDate'] as String,
    );
  }
}
