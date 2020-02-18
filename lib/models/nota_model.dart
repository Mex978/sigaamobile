class Nota {
  String periodo;
  List<Disciplinas> disciplinas;

  Nota({this.periodo, this.disciplinas});

  Nota.fromJson(Map<String, dynamic> json) {
    periodo = json['periodo'];
    if (json['disciplinas'] != null) {
      disciplinas = new List<Disciplinas>();
      json['disciplinas'].forEach((v) {
        disciplinas.add(new Disciplinas.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['periodo'] = this.periodo;
    if (this.disciplinas != null) {
      data['disciplinas'] = this.disciplinas.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Disciplinas {
  String codigo;
  String disciplina;
  String unidade1;
  String unidade2;
  String unidade3;
  String unidade4;
  String unidade5;
  String provaFinal;
  String resultado;
  String faltas;
  String situacao;

  Disciplinas(
      {this.codigo,
      this.disciplina,
      this.unidade1,
      this.unidade2,
      this.unidade3,
      this.unidade4,
      this.unidade5,
      this.provaFinal,
      this.resultado,
      this.faltas,
      this.situacao});

  Disciplinas.fromJson(Map<String, dynamic> json) {
    codigo = json['codigo'];
    disciplina = json['disciplina'];
    unidade1 = json['unidade_1'];
    unidade2 = json['unidade_2'];
    unidade3 = json['unidade_3'];
    unidade4 = json['unidade_4'];
    unidade5 = json['unidade_5'];
    provaFinal = json['prova_final'];
    resultado = json['resultado'];
    faltas = json['faltas'];
    situacao = json['situacao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['codigo'] = this.codigo;
    data['disciplina'] = this.disciplina;
    data['unidade_1'] = this.unidade1;
    data['unidade_2'] = this.unidade2;
    data['unidade_3'] = this.unidade3;
    data['unidade_4'] = this.unidade4;
    data['unidade_5'] = this.unidade5;
    data['prova_final'] = this.provaFinal;
    data['resultado'] = this.resultado;
    data['faltas'] = this.faltas;
    data['situacao'] = this.situacao;
    return data;
  }
}
