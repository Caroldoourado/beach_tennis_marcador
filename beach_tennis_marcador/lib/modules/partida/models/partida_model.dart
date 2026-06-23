class PartidaModel {
  final String? id;
  final String? dupla1;
  final String? dupla2;
  final int setsDupla1;
  final int setsDupla2;
  final String data;

  PartidaModel({
    this.id,
    required this.dupla1,
    required this.dupla2,
    required this.setsDupla1,
    required this.setsDupla2,
    required this.data,
  });

  //Transforma o objeto dart em um MAP (JSON) para o sembast salvar
  Map<String, dynamic> toMap() {
    return {
      'dupla1': dupla1,
      'dupla2': dupla2,
      'setsDupla1': setsDupla1,
      'setsDupla2': setsDupla2,
      'data': data,
    };
  }

  factory PartidaModel.fromMap(String id, Map<String, dynamic> map) {
    return PartidaModel(
      dupla1: map['dupla1'] ?? '',
      dupla2: map['dupla2'] ?? '',
      setsDupla1: map['setsDupla1'] ?? 0,
      setsDupla2: map['setsDupla2'],
      data: map['data'] ?? '',
    );
  }
}
