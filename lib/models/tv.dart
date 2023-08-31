class TvSeries {
  final String posterPathTv;

  TvSeries({required this.posterPathTv});
  factory TvSeries.fromJson(Map<String, dynamic> json) {
    return TvSeries(
      posterPathTv: json["poster_path"],
    );
  }
}
