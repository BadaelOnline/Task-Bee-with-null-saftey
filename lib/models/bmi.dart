import 'package:floor/floor.dart';

@Entity(tableName: 'Bmi', primaryKeys: ['id'])
class Bmi {
  final int id;

  final double length;

  final double weight;

  final String date;

  Bmi(this.id, this.length, this.weight, this.date);
}
