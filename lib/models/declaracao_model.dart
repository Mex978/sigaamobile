class Declaracao {
  String mime;
  String image;
  String params;

  Declaracao({this.mime, this.image, this.params});

  Declaracao.fromJson(Map<String, dynamic> json) {
    mime = json['mime'];
    image = json['image'];
    params = json['params'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mime'] = this.mime;
    data['image'] = this.image;
    data['params'] = this.params;
    return data;
  }
}
