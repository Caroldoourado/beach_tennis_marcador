import 'package:beach_tennis_marcador/modules/partida/models/partida_model.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_io.dart';

class DataBaseService extends GetxService {
  //Essa variável guarda a instância do banco aberta
  late final Database _database;

  //Get público para que outras partes do app consiga acessar o banco
  Database get db => _database;

  //Função assícrona que vai ativar o Sembast
  Future<DataBaseService> init() async {
    //1. Pega o diretório seguro do celular (Android/iOS)
    final docDir = await getApplicationDocumentsDirectory();

    //2. Cria o caminho completo do arquivo
    final dbPath = join(docDir.path, 'beach_tennis.db');

    //3. Abre o banco de dados
    _database = await databaseFactoryIo.openDatabase(dbPath);

    print('DB Incicializado com sucesso em $dbPath');

    return this;
  }

  // Criamos uma "Store" (como se fosse a tabela 'partidas')
  final _partidaStore = intMapStoreFactory.store('partidas');

  Future<void> salvarPartida(PartidaModel partida) async {
    // Insere o mapa da model dentro do banco de dados
    await _partidaStore.add(_database, partida.toMap());
    print('Partida salva com sucesso no banco NoSQL!');
  }
}
