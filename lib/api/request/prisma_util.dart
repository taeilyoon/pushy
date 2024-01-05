class PrismaUtil {
  static removeNullKey(Map<String, dynamic> map) {
    var newMap = Map<String, dynamic>();
    map.forEach((key, value) {
      if (value != null) {
        newMap[key] = value;
      }
    });
    return newMap;
  }

  static replaceFilterValue(Map<String, dynamic> map) {
    var newMap = Map<String, dynamic>();

    map.forEach((key, value) {
      if (key.contains("__Filter")) {
        newMap[key.replaceAll("__Filter", "")] = value;
      } else {
        newMap[key] = value;
      }
    });
    return newMap;
  }

  static toPrismaQuery(Map<String, dynamic>? map) {
    if (map == null) {
      return null;
    }
    return PrismaUtil.removeNullKey(map);
  }
}

main() {
  var s = PrismaUtil.toPrismaQuery({
    'where': {'phoneNumber__Filter': '12'},
    'include': {'PersonalInfo': true},
    'skip': 0,
    'take': 30
  });
  print(s);
}
