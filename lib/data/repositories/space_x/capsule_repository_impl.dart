import 'package:flash_card/core/api/space_x_api.dart';
import 'package:flash_card/data/models/space_x/capsule_model.dart';
import 'package:flash_card/domain/repositories/space_x/capsule_repository.dart';
import 'package:flutter/cupertino.dart';

class CapsuleRepositoryImpl implements CapsuleRepository {
  @override
  Future<List<CapsuleModel>> getAll() async {
    try {
      var response = await SPACE_X_API.get("/capsules");
      var json = response.data;
      return (json as List).map((e) => CapsuleModel.fromJson(e)).toList();
    } catch (e) {
      debugPrint("getAll capsule Error: $e");
      return [];
    }
  }
}
