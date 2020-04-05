import 'package:backend/controllers/horarioController.dart';
import 'backend.dart';


class BackendConfig extends Configuration {
  BackendConfig(String path): super.fromFile(File(path));
  DatabaseConfiguration database;
}

class BackendChannel extends ApplicationChannel {
  ManagedContext context;
    
  @override
  Future prepare() async {
    logger.onRecord.listen((rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));
    final config = BackendConfig(options.configurationFilePath);
    final dataModel = ManagedDataModel.fromCurrentMirrorSystem();
    final persistentStore = PostgreSQLPersistentStore.fromConnectionInfo(
      config.database.username,
      config.database.password,
      config.database.host,
      config.database.port,
      config.database.databaseName
    );

     context = ManagedContext(dataModel, persistentStore);
  }
  
  Controller get entryPoint {
    final router = Router();

    router
      .route("/horarios/[:id]")
      .link(() => HorarioController(context));

    return router;
  }
}