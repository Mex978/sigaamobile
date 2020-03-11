class Historico {
  String mime;
  String image;
  String params;

  Historico({this.mime, this.image, this.params});

  Historico.fromJson(Map<String, dynamic> json) {
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
