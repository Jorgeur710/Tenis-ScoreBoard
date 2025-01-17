import 'dart:convert';

import 'package:http/http.dart';
import 'package:po_obligatoria_t3_tenis/models/partido_model.dart';
//192.168.23.108:3000
class TenisService {

  String _url='';//Aqui hay que insertar la url de firebase

  Future<Partido> getPartido() async{
  Uri uri = Uri.parse(_url);
  Response response = await get(uri);
  Map<String,dynamic> resp = jsonDecode(response.body);
  final partido = Partido.fromJson(resp["data"]);
  partido.id = resp["data"]["id"];
  print(partido);
  return partido;
}
Future<bool> patchPartidosFinalizados(String id,Partido finalizado) async{
  Uri uri = Uri.parse(_url+'/'+id,);
  Response response = await patch(uri,body: jsonEncode(finalizado),headers: {
     'Content-Type': 'application/json',
        'Accept': 'application/json',
  });
  print(response);
  return true;
}

}