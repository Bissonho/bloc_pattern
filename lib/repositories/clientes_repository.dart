import '../models/client.dart';

class ClientsRepository {
  final List<Client> _clientes = [];
  List<Client> loadClients() {
    _clientes.addAll(
      [
        Client(nome: 'José Armado'),
        Client(nome: 'Paulo'),
        Client(nome: 'João'),
        Client(nome: 'Maria'),
        Client(nome: 'Rafael'),
      ],
    );

    return _clientes;
  }

  List<Client> addClient(Client client) {
    _clientes.add(client);

    return _clientes;
  }

  List<Client> removeClient(Client client) {
    _clientes.remove(client);

    return _clientes;
  }
}
