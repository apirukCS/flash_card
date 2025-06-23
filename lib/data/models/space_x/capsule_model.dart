import 'dart:convert';

CapsuleModel capsuleModelFromJson(String str) => CapsuleModel.fromJson(json.decode(str));

String capsuleModelToJson(CapsuleModel data) => json.encode(data.toJson());

class CapsuleModel {
    final int? reuseCount;
    final int? waterLandings;
    final int? landLandings;
    final String? lastUpdate;
    final List<String>? launches;
    final String? serial;
    final String? status;
    final String? type;
    final String? id;

    CapsuleModel({
        this.reuseCount,
        this.waterLandings,
        this.landLandings,
        this.lastUpdate,
        this.launches,
        this.serial,
        this.status,
        this.type,
        this.id,
    });

    factory CapsuleModel.fromJson(Map<String, dynamic> json) => CapsuleModel(
        reuseCount: json["reuse_count"],
        waterLandings: json["water_landings"],
        landLandings: json["land_landings"],
        lastUpdate: json["last_update"],
        launches: json["launches"] == null ? [] : List<String>.from(json["launches"]!.map((x) => x)),
        serial: json["serial"],
        status: json["status"],
        type: json["type"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "reuse_count": reuseCount,
        "water_landings": waterLandings,
        "land_landings": landLandings,
        "last_update": lastUpdate,
        "launches": launches == null ? [] : List<dynamic>.from(launches!.map((x) => x)),
        "serial": serial,
        "status": status,
        "type": type,
        "id": id,
    };
}
