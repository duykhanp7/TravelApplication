class TravelNewJson {
  String? destinationImageUrl;
  String? dateStart;
  String? destinationTitle;

  TravelNewJson(
      {this.destinationImageUrl, this.dateStart, this.destinationTitle});

  get getDestinationImageUrl => destinationImageUrl;

  set setDestinationImageUrl(destinationImageUrl) =>
      this.destinationImageUrl = destinationImageUrl;

  get getDateStart => dateStart;

  set setDateStart(dateStart) => this.dateStart = dateStart;

  get getdestinationTitle => destinationTitle;

  set setdestinationTitle(destinationTitle) =>
      this.destinationTitle = destinationTitle;
}
