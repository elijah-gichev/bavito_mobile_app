class AggregateGoodController {
  String? description;
  String? title;
  String? imgSrc;
  int? score;

  bool get allSaved {
    return description != null &&
        title != null &&
        imgSrc != null &&
        score != null;
  }
}
