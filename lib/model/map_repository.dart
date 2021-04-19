import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tridheetest/model/map_model.dart';

abstract class MapsRepo {
  Future<void> addNewTodo(MapModal todo);

  Future<void> deleteTodo(MapModal todo);

  Stream<List<MapModal>> todos();

  Future<void> updateTodo(MapModal todo);
}

class FirebaseMapModel implements MapsRepo {
  final mapCollection = Firestore.instance.collection('maps');
  @override
  Future<void> addNewTodo(MapModal mapModal) {
    return mapCollection.add(mapModal.toJson());
  }

  @override
  Future<void> deleteTodo(MapModal mapModal) {
    return mapCollection.document(mapModal.name).delete();
  }

  @override
  Stream<List<MapModal>> todos() {
    return mapCollection.snapshots().map((snapshot) {
      return snapshot.documents.map((doc) => MapModal.fromJson(doc)).toList();
    });
  }

  @override
  Future<void> updateTodo(MapModal mapModal) {
    return mapCollection.document(mapModal.name).updateData(mapModal.toJson());
  }
}
