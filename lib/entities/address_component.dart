class AddressComponent {
  String? name;
  String? shortName;

  Map<String, dynamic> get toMap {
    return {
      "name": name,
      "shortName": shortName,
    };
  }

  AddressComponent({this.name, this.shortName});

  static AddressComponent fromJson(dynamic json) {
    return AddressComponent(name: json['long_name'], shortName: json['short_name']);
  }
}
