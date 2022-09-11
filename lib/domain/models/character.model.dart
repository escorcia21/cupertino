class Character {
  final int id;
  final String name, status, species, type, gender, origin, location, image;
  //List<String> episode;

  Character.fromMap(Map<String, dynamic> map)
      : assert(map["id"] != null),
        assert(map["name"] != null),
        assert(map["status"] != null),
        assert(map["species"] != null),
        assert(map["gender"] != null),
        assert(map["type"] != null),
        assert(map["origin"] != null),
        assert(map["location"] != null),
        assert(map["image"] != null),
        id = map["id"],
        name = map["name"],
        status = map["status"],
        species = map["species"],
        gender = map["gender"],
        type = map["type"],
        origin = map["origin"]["name"],
        location = map["location"]["name"],
        image = map["image"];

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "species": species,
        "gender": gender,
        "type": type,
        "origin": origin,
        "location": location,
        "image": image
      };
}
