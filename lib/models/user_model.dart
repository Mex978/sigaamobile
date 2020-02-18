class User {
  String matricula;
  String curso;
  String turno;
  String entrada;
  String ira;
  String nome;
  String imagem;
  String semestre;

  User(
      {this.matricula,
      this.curso,
      this.turno,
      this.entrada,
      this.ira,
      this.nome,
      this.imagem,
      this.semestre});

  User.fromJson(Map<String, dynamic> json) {
    matricula = json['matricula'];
    curso = json['curso'];
    turno = json['turno'];
    entrada = json['entrada'];
    ira = json['ira'];
    nome = json['nome'];
    imagem = json['imagem'];
    semestre = json['semestre'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['matricula'] = this.matricula;
    data['curso'] = this.curso;
    data['turno'] = this.turno;
    data['entrada'] = this.entrada;
    data['ira'] = this.ira;
    data['nome'] = this.nome;
    data['imagem'] = this.imagem;
    data['semestre'] = this.semestre;
    return data;
  }
}
