import 'dart:async';
import 'package:aqueduct/aqueduct.dart';

class Migration1 extends Migration { 
  @override
  Future upgrade() async {
   		database.createTable(SchemaTable("_Horario", [
         SchemaColumn("id", ManagedPropertyType.bigInteger, isPrimaryKey: true, autoincrement: true, isIndexed: false, isNullable: false, isUnique: false),
         SchemaColumn("nomeBairro", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: true),
         SchemaColumn("tipoHorario", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false),
         SchemaColumn("linkHorario", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: true),
         SchemaColumn("publicacao", ManagedPropertyType.datetime, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: true, isUnique: false)]));
  }
  
  @override
  Future downgrade() async => await store.execute("DROP TABLE _Horario");
  
  @override
  Future seed() async {
    final  horarios = [
      {
        "nomeBairro": "DIS 01 - Macaúba",
        "linkHorario":"http://www.viacaodourados.com.br/base/www/viacaodourados.com.br/media/attachments/604/604/5a5348b6aba4265d2fd830f773484cd1b7aa575d6c06a_horarios-corridos-dis-01-macauba.pdf",
        "tipoHorario": "Bairro",
        "publicacao":null
      },
      {
        "nomeBairro": " DIS 02 - Vila Vargas",
        "linkHorario":"http://www.viacaodourados.com.br/base/www/viacaodourados.com.br/media/attachments/889/889/5d822a42bc8eb5e1166f4585109a8e186c715ce130c8f_horarios-corridos-dis-02-vila-vargas.pdf",
        "tipoHorario": "Bairro",
        "publicacao":null
      },
      {
        "nomeBairro": "DIS 03 - Usina São Fernando",
        "linkHorario":"http://www.viacaodourados.com.br/base/www/viacaodourados.com.br/media/attachments/941/941/5e20505cf04205c6be5f09623fb7c591dba680820569b_horarios-corridos-dis-03-usina-sao-fernando.pdf",
        "tipoHorario": "Bairro",
        "publicacao":null
      },
      {
        "nomeBairro": "DIS 04 - Itahum",
        "linkHorario":"http://www.viacaodourados.com.br/base/www/viacaodourados.com.br/media/attachments/720/720/5b97ff50d59ce6c495da0fb0649a2f26cb8c710b7fa17_horarios-corridos-dis-04-itahum.pdf",
        "tipoHorario": "Distrito",
        "publicacao":null
      },
      {
        "nomeBairro": "DIS 05 - Indapolis",
        "linkHorario":"http://www.viacaodourados.com.br/base/www/viacaodourados.com.br/media/attachments/938/938/5e01f8e73aab3639e57b26e30a91ab47ce9b90457373f_horarios-corridos-dis-05-indapolis.pdf",
        "tipoHorario": "Distrito",
        "publicacao":null
      },
      {
        "nomeBairro": "DIS 06 - Panambi",
        "linkHorario":"http://www.viacaodourados.com.br/base/www/viacaodourados.com.br/media/attachments/441/441/58665036bbe8417a3a4b98908255248b3a0ed87d0459a_horarios-corridos-dis-06-panambi.pdf",
        "tipoHorario": "Distrito",
        "publicacao":null
      },
      {
        "nomeBairro": "L01 - Joquei Clube",
        "linkHorario":"http://www.viacaodourados.com.br/base/www/viacaodourados.com.br/media/attachments/978/978/5e414a44ccdc5ecc378bb15504ede8311e210bc41906f_horarios-corridos-l-01-joquei-clube.pdf",
        "tipoHorario": "Bairro",
        "publicacao":null
      },
      {
        "nomeBairro": "L02 - Santa Maria",
        "linkHorario":"http://www.viacaodourados.com.br/base/www/viacaodourados.com.br/media/attachments/979/979/5e41501530b5816f1597e3d80561fdf5837c1d1bd5ba4_horarios-corridos-l-02-santa-maria.pdf",
        "tipoHorario": "Bairro/Universidade",
        "publicacao":null
      },
      {
        "nomeBairro": "L03 - Braswey",
        "linkHorario":"http://www.viacaodourados.com.br/base/www/viacaodourados.com.br/media/attachments/954/954/5e3c9cfd3e07d4104903bb6302a728d37315b26660b43_horarios-corridos-l-03-braswey.pdf",
        "tipoHorario": "Bairro",
        "publicacao":null
      },
      {
        "nomeBairro": "L04 - Res. Esplanada",
        "linkHorario":"http://www.viacaodourados.com.br/base/www/viacaodourados.com.br/media/attachments/852/852/5d094b1c8f4168061a2e25b69a25db6282e2f70fd5eb5_horarios-corridos-l-04-res.-esplanada.pdf",
        "tipoHorario": "Bairro",
        "publicacao":null
      },
      {
        "nomeBairro": "L05 - Jd Guaicurus Dioclecio",
        "linkHorario":"http://www.viacaodourados.com.br/base/www/viacaodourados.com.br/media/attachments/996/996/5e45b53f8050fb6525cc7fdadac6a5974455c8f91922e_horarios-corridos-l-05-jd-guaicurus_dioclecio-artuzi.pdf",
        "tipoHorario": "Bairro",
        "publicacao":null
      },
      {
        "nomeBairro": "L06 - Distrito Industrial",
        "linkHorario":"http://www.viacaodourados.com.br/base/www/viacaodourados.com.br/media/attachments/997/997/5e4a6e5395f9223c7903d294357b958ac30a307669848_horarios-corridos-l-06-distrito-industrial.pdf",
        "tipoHorario": "Distrito",
        "publicacao":null
      },
      {
        "nomeBairro": "L07/L16 - Cachoeirinha/Jd Itália",
        "linkHorario":"http://www.viacaodourados.com.br/base/www/viacaodourados.com.br/media/attachments/998/998/5e4a962b325b4fca0806fbacf6b4d73cddb26d9323186_horarios-corridos-l-07_l16-cachoeirinha_jd-italia.pdf",
        "tipoHorario": "Bairro",
        "publicacao":null
      },
      {
        "nomeBairro": "L08/L20 - Estrela Porã/Florida II",
        "linkHorario":"http://www.viacaodourados.com.br/base/www/viacaodourados.com.br/media/attachments/985/985/5e415b6fc99babd28319322adc4dc757546982c609c1f_horarios-corridos-l-08_l20-estrela-pora_florida-ii.pdf",
        "tipoHorario": "Bairro",
        "publicacao":null
      },
      {
        "nomeBairro": "L09 - Florida I HU",
        "linkHorario":"http://www.viacaodourados.com.br/base/www/viacaodourados.com.br/media/attachments/988/988/5e415ca5600fd2a7d06a9acebdfd004ad6fa0d9c23ba7_horarios-corridos-l-09-florida-i_hu.pdf",
        "tipoHorario": "Bairro",
        "publicacao":null
      },
      {
        "nomeBairro": "L10 - Parque Alvorada",
        "linkHorario":"http://www.viacaodourados.com.br/base/www/viacaodourados.com.br/media/attachments/989/989/5e415d2ac661955f1ca3e910d1e587eebe24384f3c770_horarios-corridos-l-10-parque-alvorada.pdf",
        "tipoHorario": "Bairro",
        "publicacao":null
      },
      {
        "nomeBairro": "L11 - Ayde Piratininga",
        "linkHorario":"http://www.viacaodourados.com.br/base/www/viacaodourados.com.br/media/attachments/990/990/5e415da161ca73519ccfa05f15d8ece001999c4e09a83_horarios-corridos-l-11-ayde-piratininga.pdf",
        "tipoHorario": "Bairro",
        "publicacao":null
      },
      {
        "nomeBairro": "L12 - Cidade Universitária",
        "linkHorario":"http://www.viacaodourados.com.br/base/www/viacaodourados.com.br/media/attachments/982/982/5e415844cbc04288837bf713bc0350f3476e3f8612381_horarios-corridos-l-12-cidade-universitaria.pdf",
        "tipoHorario": "Universidade",
        "publicacao":null
      },
      {
        "nomeBairro": "L13 - Jd Colibri/Canaã III.",
        "linkHorario":"http://www.viacaodourados.com.br/base/www/viacaodourados.com.br/media/attachments/991/991/5e415e09d5a77bfce0eb8f956b64f08e0b006f1c76475_horarios-corridos-l13-jd-colibri_canaa-iii.pdf",
        "tipoHorario": "Bairro",
        "publicacao":null
      },
      {
        "nomeBairro": "L14 - 4º Plano Campo Dourado",
        "linkHorario":"http://www.viacaodourados.com.br/base/www/viacaodourados.com.br/media/attachments/992/992/5e415e90e18d715891776c870dadc150924dfeffea87e_horarios-corridos-l14-4-plano_campo-dourado.pdf",
        "tipoHorario": "Bairro",
        "publicacao":null
      },
      {
        "nomeBairro": "L18 - Unigran",
        "linkHorario":"http://www.viacaodourados.com.br/base/www/viacaodourados.com.br/media/attachments/995/995/5e41605dab9d19bf69e1a4ab464d61a1548a4752fbf84_horarios-corridos-l18-unigran.pdf",
        "tipoHorario": "Universidade",
        "publicacao":null
      },
      {
        "nomeBairro": "L 9 - Jaguapiru",
        "linkHorario":"http://www.viacaodourados.com.br/base/www/viacaodourados.com.br/media/attachments/375/375/5739c0a6678871dafef9a1fd1d0a5b4328b33ffc6306e_horarios-corridos-l-19-jaguapiru.pdf",
        "tipoHorario": "Distrito",
        "publicacao":null
      }
    ];
    

    for(final horario in horarios){
      await database.store.execute(
        "insert into _Horario (nomeBairro,tipoHorario,linkHorario,publicacao) values(@nomeBairro,@tipoHorario,@linkHorario,@publicacao)",
        substitutionValues: {
          "nomeBairro": horario['nomeBairro'],
          "tipoHorario": horario['tipoHorario'],
          "linkHorario": horario['linkHorario'],
          "publicacao": horario['publicacao']
        }
      );
    }
  }
}
    