import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:routebus/horario.dart';
import 'package:http/http.dart' as http;
import 'package:routebus/pdf.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {  

  String _url = "https://apiroutebus.000webhostapp.com/horarios";

  Future<List<Horario>> _allHorarios() async{
    http.Response response = await http.get(_url);
    final horariosJson = json.decode(response.body);
  
    List <Horario> horarios = List();

    for(final horario in horariosJson['horarios']){
      Horario objectHorario = Horario(
        horario['id'],
        horario['nomeBairro'],
        horario['tipoHorario'],
        horario['linkHorario'],
        horario['publicacao']
      );

      horarios.add(objectHorario);
    }

    return horarios;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:Text("Routebus"),
          backgroundColor: Color(0xFF0e70c1)
        ),
        body: FutureBuilder<List<Horario>>(
          future: _allHorarios(),
          builder:(context, snapshot){
            switch(snapshot.connectionState){
              case ConnectionState.none:
              case ConnectionState.waiting:
                return  Center(child: CircularProgressIndicator());
                break;
              case ConnectionState.active:
              case ConnectionState.done:
                print("Conexão fechada");
                if(snapshot.hasError){
                    print(snapshot.hasError);
                }else {
                  return ListView.builder(
                    padding: EdgeInsets.all(10),
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index){

                      List <Horario> lista  = snapshot.data;
                      Horario horario = lista[index];

                      String condition  =   horario.tipoHorario;
                      return   Card(
                        child: ListTile(
                          leading: Icon(Icons.directions_bus),
                          title: Text(horario.nomeBairro),
                          subtitle: Text(
                            horario.tipoHorario,
                            style: TextStyle(
                              color: condition == "Universidade" || condition == "Bairro/Universidade"  ? Color(0xFF0e70c1) : condition == "Distrito" ? Colors.blueGrey : Colors.grey,
                            ),
                          ),
                          trailing: Icon(Icons.arrow_forward),
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PDF(horario_id: horario)
                              )
                            );
                          },
                        )
                      );
                    }
                  );
                }
                break;
            }
          },
        ),
      );
  }
}
