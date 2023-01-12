class TopJourneyJson {
  String? destinationTitle;
  String? imageUrl;
  String? dateStart;
  int? quantities;
  double? price;
  int? ratings;
  int? likes;

  TopJourneyJson(
      {this.destinationTitle,
      this.imageUrl,
      this.dateStart,
      this.quantities,
      this.price,
      this.ratings,
      this.likes});

  String? get getDestinationTitle => destinationTitle;

  set setDestinationTitle(String? destinationTitle) =>
      this.destinationTitle = destinationTitle;

  get getImageUrl => imageUrl;

  set setImageUrl(String imageUrl) => this.imageUrl = imageUrl;

  get getDateStart => dateStart;

  set setDateStart(dateStart) => this.dateStart = dateStart;

  get getQuantitys => quantities;

  set setQuantitys(quantitys) => quantities = quantitys;

  get getPrice => price;

  set setPrice(price) => this.price = price;

  get getRatings => ratings;

  set setRatings(ratings) => this.ratings = ratings;

  get getLikes => likes;

  set setLikes(likes) => this.likes = likes;
}
