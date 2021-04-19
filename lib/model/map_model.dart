class MapModal {
  final String name;
  final String place;
  final bool active;

  MapModal(this.name, this.place, this.active);

  Map<String, Object> toJson() {
    return {
      'name': name,
      'place': place,
      'active': active,
    };
  }

  static MapModal fromJson(Map<String, Object> json) {
    return MapModal(
      json['name'] as String,
      json['place'] as String,
      json['active'] as bool,
    );
  }
}
