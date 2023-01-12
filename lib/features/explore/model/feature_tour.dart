class FeatureTourJson {
  String? destinationImageUrl;
  String? dateStart;
  String? address;
  int? ratings;
  int? likes;
  int? quantities;
  double? prices;

  FeatureTourJson(
      {this.destinationImageUrl,
      this.dateStart,
      this.address,
      this.ratings,
      this.likes,
      this.quantities,
      this.prices});

  get getDestinationImageUrl => destinationImageUrl;

  set setDestinationImageUrl(destinationImageUrl) =>
      this.destinationImageUrl = destinationImageUrl;

  get getDateStart => dateStart;

  set setDateStart(dateStart) => this.dateStart = dateStart;

  get getAddress => address;

  set setAddress(address) => this.address = address;

  get getRatings => ratings;

  set setRatings(ratings) => this.ratings = ratings;

  get getLikes => likes;

  set setLikes(likes) => this.likes = likes;

  get getQuantities => quantities;

  set setQuantities(quantities) => this.quantities = quantities;

  double? get getPrices => prices;

  set setPrices(double? prices) => this.prices = prices;
}
