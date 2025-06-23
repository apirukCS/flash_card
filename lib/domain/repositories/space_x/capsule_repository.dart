import 'package:flash_card/data/models/space_x/capsule_model.dart';

abstract class CapsuleRepository {
  Future<List<CapsuleModel>> getAll();
}
