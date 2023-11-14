class Album {
  Album({
    required this.name,
    required this.artist,
    required this.image,
    required this.genre,
  });

  String name;
  String artist;
  String image;
  String genre;

  factory Album.fromJson(Map<String, dynamic> json) => Album(
        name: json['im:name']['label'],
        artist: json['im:artist']['label'],
        image: json['im:image'][0]['label'],
        genre: json['category']['attributes']['label'],
      );
}
