import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transaksi.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class Transaksi extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final double amount;
  @HiveField(3)
  final DateTime date;
  @HiveField(4)
  final String category;

  Transaksi({
    required this.id,
    required this.name,
    required this.amount,
    required this.date,
    required this.category,
  });

  factory Transaksi.fromJson(Map<String, dynamic> json) => _$TransaksiFromJson(json);

  Map<String, dynamic> toJson() => _$TransaksiToJson(this);

  Transaksi copyWith({
    String? id,
    String? name,
    double? amount,
    DateTime? date,
    String? category,
  }) {
    return Transaksi(
      id: id ?? this.id,
      name: name ?? this.name,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      category: category ?? this.category,
    );
  }
}