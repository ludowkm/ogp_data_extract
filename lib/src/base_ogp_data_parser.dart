mixin OgpDataKeys {
  static const keyTitle = 'title';
  static const keyDescription = 'description';
  static const keyImage = 'image';
}

mixin BaseOgpDataParser {
  String? title;
  String? description;
  String? image;

  OgpData parse() {
    final OgpData o = OgpData();
    o.title = title;
    o.description = description;
    o.image = image;
    return o;
  }
}

/// Container class for OgpData.
class OgpData with BaseOgpDataParser, OgpDataKeys {
  @override
  String toString() {
    return toMap().toString();
  }

  Map<String, String?> toMap() {
    return {
      OgpDataKeys.keyTitle: title,
      OgpDataKeys.keyDescription: description,
      OgpDataKeys.keyImage: image,
    };
  }

  static OgpData fromMap(Map<String, dynamic> json) {
    final OgpData o = OgpData();
    o.title = json[OgpDataKeys.keyTitle];
    o.description = json[OgpDataKeys.keyDescription];
    o.image = json[OgpDataKeys.keyImage];
    return o;
  }

  OgpData copyWith(
      {String? type, String? title, String? description, String? image}) {
    final OgpData o = OgpData();
    o.title = title ?? this.title;
    o.description = description ?? this.description;
    o.image = image ?? this.image;
    return o;
  }
}
