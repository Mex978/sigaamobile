class Disciplina {
  String componenteCurricular;
  String local;
  String horario;
  String classId;
  String formAcessarTurmaVirtual;

  Disciplina(
      {this.componenteCurricular,
      this.local,
      this.horario,
      this.classId,
      this.formAcessarTurmaVirtual});

  Disciplina.fromJson(Map<String, dynamic> json) {
    componenteCurricular = json['componente_curricular'];
    local = json['local'];
    horario = json['horario'];
    classId = json['class_id'];
    formAcessarTurmaVirtual = json['form_acessarTurmaVirtual'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['componente_curricular'] = this.componenteCurricular;
    data['local'] = this.local;
    data['horario'] = this.horario;
    data['class_id'] = this.classId;
    data['form_acessarTurmaVirtual'] = this.formAcessarTurmaVirtual;
    return data;
  }
}
