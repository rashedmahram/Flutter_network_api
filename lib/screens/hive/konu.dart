import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class YeniKonu {
  // 223 variable max
  @HiveField(0)
  String baslik;

  YeniKonu(this.baslik);
}
