import 'package:json_annotation/json_annotation.dart';

part 'search_result.g.dart';

@JsonSerializable()
class SearchResult {
  int? resultCount;
  List<Results>? results;

  SearchResult({this.resultCount, this.results});

  factory SearchResult.fromJson(Map<String, dynamic> json) =>
      _$SearchResultFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResultToJson(this);
}

@JsonSerializable()
class Results {
  String? wrapperType;
  String? kind;
  int? collectionId;
  int? trackId;
  String? artistName;
  String? collectionName;
  String? trackName;
  String? collectionCensoredName;
  String? trackCensoredName;
  int? collectionArtistId;
  String? collectionArtistViewUrl;
  String? collectionViewUrl;
  String? trackViewUrl;
  String? previewUrl;
  String? artworkUrl30;
  String? artworkUrl60;
  String? artworkUrl100;
  double? collectionPrice;
  double? trackPrice;
  double? trackRentalPrice;
  double? collectionHdPrice;
  double? trackHdPrice;
  double? trackHdRentalPrice;
  String? releaseDate;
  String? collectionExplicitness;
  String? trackExplicitness;
  int? discCount;
  int? discNumber;
  int? trackCount;
  int? trackNumber;
  int? trackTimeMillis;
  String? country;
  String? currency;
  String? primaryGenreName;
  String? contentAdvisoryRating;
  String? shortDescription;
  String? longDescription;
  bool? hasITunesExtras;
  int? artistId;
  String? collectionArtistName;
  String? artistViewUrl;
  bool? isStreamable;
  String? description;

  Results(
      {this.wrapperType,
      this.kind,
      this.collectionId,
      this.trackId,
      this.artistName,
      this.collectionName,
      this.trackName,
      this.collectionCensoredName,
      this.trackCensoredName,
      this.collectionArtistId,
      this.collectionArtistViewUrl,
      this.collectionViewUrl,
      this.trackViewUrl,
      this.previewUrl,
      this.artworkUrl30,
      this.artworkUrl60,
      this.artworkUrl100,
      this.collectionPrice,
      this.trackPrice,
      this.trackRentalPrice,
      this.collectionHdPrice,
      this.trackHdPrice,
      this.trackHdRentalPrice,
      this.releaseDate,
      this.collectionExplicitness,
      this.trackExplicitness,
      this.discCount,
      this.discNumber,
      this.trackCount,
      this.trackNumber,
      this.trackTimeMillis,
      this.country,
      this.currency,
      this.primaryGenreName,
      this.contentAdvisoryRating,
      this.shortDescription,
      this.longDescription,
      this.hasITunesExtras,
      this.artistId,
      this.collectionArtistName,
      this.artistViewUrl,
      this.isStreamable,
      this.description});

  factory Results.fromJson(Map<String, dynamic> json) =>
      _$ResultsFromJson(json);

  Map<String, dynamic> toJson() => _$ResultsToJson(this);
}
