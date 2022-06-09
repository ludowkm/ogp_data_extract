import 'package:html/dom.dart';

import 'base_ogp_data_parser.dart';

class OgpDataParser with BaseOgpDataParser {
  final Document? _document;

  OgpDataParser(this._document);

  /// Get [OgpData.title] from 'og:title'.
  @override
  String? get title =>
      _getContent(properties: ['og:title', 'title']) ??
      _getSimpleTagContent(tag: 'title');

  /// Get [OgpData.description] from 'og:description'.
  @override
  String? get description =>
      _getContent(properties: ['og:description', 'description']) ??
      _getSimpleTagContent(tag: 'description');

  /// Get [OgpData.image] from 'og:image'.
  @override
  String? get image => _getContent(properties: ['og:image']);

  @override
  String toString() => parse().toString();

  String? _getSimpleTagContent({String tag = 'title'}) {
    final elements = _document?.getElementsByTagName(tag).cast<Element?>();
    if (elements == null || elements.isEmpty) return null;
    return elements.first?.text;
  }

  String? _getContent({
    String tag = 'meta',
    List<String> attributes = const ['property', 'name'],
    List<String>? properties,
    String key = 'content',
  }) {
    if (properties == null) return null;
    final elements = _document?.getElementsByTagName(tag).cast<Element?>();
    if (elements == null || elements.isEmpty) return null;
    final element = elements.firstWhere(
        (element) => properties
            .any((p) => attributes.any((a) => p == element?.attributes[a])),
        orElse: () => null);
    return element?.attributes[key];
  }
}
