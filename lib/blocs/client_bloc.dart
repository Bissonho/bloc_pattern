import 'dart:async';

import 'package:bloc/blocs/client_events.dart';
import 'package:bloc/blocs/client_state.dart';
import 'package:bloc/repositories/clientes_repository.dart';

import '../models/client.dart';

class ClientBloc {
  final _clientRepo = ClientsRepository();

  final StreamController<ClientEvent> _inputStreamController =
      StreamController<ClientEvent>();

  final StreamController<ClientState> _outputStreamController =
      StreamController<ClientState>();

  Sink<ClientEvent> get inputClient => _inputStreamController;
  Stream<ClientState> get stream => _outputStreamController.stream;

  ClientBloc() {
    _inputStreamController.stream.listen((_mapEventToState) {
      _mapEventToState(ClientEvent event) {
        List<Client> clients = [];

        if (event is LoadClientEvent) {
          clients = _clientRepo.loadClients();
        } else if (event is AddClientEvent) {
          clients = _clientRepo.addClient(event.client);
        } else if (event is RemoveClientEvent) {
          clients = _clientRepo.removeClient(event.client);
        }

        _outputStreamController.add(ClientSuccesState(clients: clients));
      }
    });
  }
}
