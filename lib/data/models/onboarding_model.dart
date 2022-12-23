class OnboardingModel {
  late String description;
  late String content;

  OnboardingModel({required this.description, required this.content});

  String get getDescription => description;

  set setDescription(String description) => this.description = description;

  get getContent => content;

  set setContent(content) => this.content = content;
}
