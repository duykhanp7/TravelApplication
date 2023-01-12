class TopExperienceJson {
  String? guideImageUrl;
  String? destinationImageUrl;
  String? name;
  String? description;
  String? address;

  TopExperienceJson(
      {this.guideImageUrl,
      this.destinationImageUrl,
      this.name,
      this.description,
      this.address});

  get getGuideImageUrl => guideImageUrl;

  set setGuideImageUrl(guideImageUrl) => this.guideImageUrl = guideImageUrl;

  get getDestinationImageUrl => destinationImageUrl;

  set setDestinationImageUrl(destinationImageUrl) =>
      this.destinationImageUrl = destinationImageUrl;

  get getName => name;

  set setName(name) => this.name = name;

  get getDescription => description;

  set setDescription(description) => this.description = description;

  get getAddress => address;

  set setAddress(address) => this.address = address;
}
