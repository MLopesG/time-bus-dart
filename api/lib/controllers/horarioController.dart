import 'package:backend/backend.dart';
import 'package:backend/models/horario.dart';

class HorarioController extends ResourceController{
  HorarioController(this.context);

  final ManagedContext context;

  @Operation.get()
  Future<Response> getAllHorarios() async{
    final horariosAll = Query<Horario>(context)
     ..sortBy((u) => u.tipoHorario, QuerySortOrder.descending);
     
    final horarios = await horariosAll.fetch();
    final length = horarios.length;

    if(horarios == null || length < 0){
       return Response.notFound(
         body:{
          "sucess" : false,
          "msg":"Horários não encontrados."
        });
    }
    return Response.ok(horarios);
  }

  @Operation.get('id')
  Future<Response> getHorario(@Bind.path('id') int id) async{
    final gethorario = Query<Horario>(context)
    ..where((h)=>h.id).equalTo(id);

    final horario = await gethorario.fetchOne();

    if(horario == null){
      return Response.notFound(
         body:{
          "sucess" : false,
          "msg":"Horário não encontrado."
        });
    }
    return Response.ok(horario);
  }

  @Operation.put('id')
  Future<Response> editHorario(@Bind.path('id') int id) async{
    final Map<String, dynamic> body =  await request.body.decode();
    final editHorario = Query<Horario>(context)
    ..values.nomeBairro = body['nomeBairro'] as String
    ..values.tipoHorario = body['tipoHorario'] as String
    ..values.linkHorario = body['linkHorario'] as String
    ..where((horario) => horario.id).equalTo(id);

    final editHorarioExe = await editHorario.update();

    if(editHorarioExe == null){
      return Response.notFound(
        body:{
        "sucess" : false,
        "msg":"Não foi possivel alterar horário."
      });
    }
    return Response.ok(editHorarioExe);
  }

  @Operation.delete('id')
  Future<Response> deleteHorario(@Bind.path('id') int id) async{
    final deleteHorario = Query<Horario>(context)
    ..where((horario)=>horario.id).equalTo(id);

    final deleteHorarioExe = await deleteHorario.delete();

    if(deleteHorarioExe == 0){
       return Response.notFound(
        body:{
        "sucess" : false,
        "msg":"Não foi possivel deletar horário, registro não pode ser econtrado."
      });
    }
    return Response.ok({
      "sucess" : true,
      "msg":"Horário deletado com sucesso."
    });
  }

  @Operation.post()
  Future<Response> createHorario() async{
    final Map<String, dynamic> body = await request.body.decode();
    final insertHorario = Query<Horario>(context)
    ..values.nomeBairro = body['nomeBairro'] as String
    ..values.tipoHorario = body['tipoHorario'] as String
    ..values.linkHorario = body['linkHorario'] as String;

    final insertHorarioExe = await insertHorario.insert();

    if(insertHorarioExe  == null){
      return Response.notFound(
        body:{
        "sucess" : false,
        "msg":"Não foi possivel salvar horário."
      });
    }
    return Response.ok(insertHorarioExe);
  }
}