import 'package:hive/hive.dart';
part 'todo.g.dart';

@HiveType(typeId: 0)
class Todo extends HiveObject {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String description;

  @HiveField(3)
  String lap;

  @HiveField(4)
  String hargatotal;

   @HiveField(5)
  String Pembayaran;

  Todo({required this.title, required this.description, required this.lap, required this.hargatotal, required this.Pembayaran});
}
