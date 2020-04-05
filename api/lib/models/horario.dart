import 'package:backend/backend.dart';

class Horario extends ManagedObject<_Horario> implements _Horario{

  @override
  void willInsert() {
    publicacao = DateTime.now().toUtc();
  }

  @override
  void willUpdate() {
    publicacao = DateTime.now().toUtc();
  }
}

class _Horario{
    @primaryKey   
    int id;
    
    @Validate.present(onUpdate: true, onInsert: true)
    @Column(unique: true)
    String nomeBairro;

    @Validate.present(onUpdate: true, onInsert: true)
    @Column(unique: false)
    String tipoHorario;

    @Validate.present(onUpdate: true, onInsert: true)
    @Column(unique: true)
    String linkHorario;

    @Validate.present(onUpdate: true, onInsert: true)
    @Column(indexed:false)
    DateTime publicacao;
}