import 'package:taskBee/models/bmi.dart';
import 'package:floor/floor.dart';

@dao
abstract class BmiDao {
  @Query('SELECT * FROM Bmi')
  Future<List<Bmi>?> findAllBmi();

  @Query('DELETE FROM Bmi WHERE id = :id')
  Future<Bmi?> deleteBmi(int id);

  @update
  Future<void> updateBmi(Bmi bmi);

  @insert
  Future<int?> insertBmi(Bmi bmi);
}
