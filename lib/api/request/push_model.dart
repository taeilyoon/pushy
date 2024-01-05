class PushModel {
  String link;
  String title;
  String body;
  PushModel({required this.link, required this.title, required this.body});
  Map<String, String> toJson() {
    return {'link': link, 'title': title, 'body': body};
  }
}
