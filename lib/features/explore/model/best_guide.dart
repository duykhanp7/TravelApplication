class BestGuideJson {
  String? imageUrl;
  String? name;
  String? address;
  int? ratings;
  int? reviews;

  BestGuideJson(
      {this.imageUrl, this.name, this.address, this.ratings, this.reviews});

  get getImageUrl => imageUrl;

  set setImageUrl(String imageUrl) => this.imageUrl = imageUrl;

  get getName => name;

  set setName(name) => this.name = name;

  get getAddress => address;

  set setAddress(address) => this.address = address;

  get getRatings => ratings;

  set setRatings(ratings) => this.ratings = ratings;

  get getLikes => reviews;

  set setLikes(likes) => reviews = likes;
}
