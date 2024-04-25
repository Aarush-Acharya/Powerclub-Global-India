import 'package:appwrite/appwrite.dart';

Appwrite appwrite = Appwrite();

class Appwrite {
  Client client = Client();
  late Databases databases;

  void initialiseAppwrite() {
    client
        .setEndpoint("https://cloud.appwrite.io/v1")
        .setProject("6629f80bd9d51cfbab00");
    databases = Databases(client);
    print("appwrite initialised");
  }
}
