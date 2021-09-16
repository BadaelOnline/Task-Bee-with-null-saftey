import 'package:financial/models/bmi.dart';
import 'package:floor/floor.dart';

@dao
abstract class BmiDao {
  @Query('SELECT * FROM Contact')
  Future<List<Bmi>?> findAllBmi();

  @Query('DELETE FROM Contact WHERE id = :id')
  Future<Bmi?> deleteBmi(int id);

  @update
  Future<void> updateBmi(Bmi bmi);

  @insert
  Future<int?> insertBmi(Bmi bmi);
}
