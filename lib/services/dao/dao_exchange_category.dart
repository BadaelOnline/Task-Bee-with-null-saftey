import 'package:financial/models/exchange_category.dart';
import 'package:floor/floor.dart';

@dao
abstract class ExchangeCategoryDao {
  @Query('SELECT * FROM exchange_category')
  Future<List<ExchangeCategory>?> findAllExchangeCategory();

  @Query('SELECT * FROM exchange_category WHERE id = :id')
  Future<ExchangeCategory?> findExchangeCategoryById(int id);

  @Query('SELECT * FROM exchange_category')
  Future<List<ExchangeCategory>?> retrieveExchangeCategories();

  @Query('DELETE FROM exchange_category WHERE id = :id')
  Future<ExchangeCategory?> deleteExchangeCategory(int id);

  @update
  Future<void> updateExchangeCategory(ExchangeCategory exchangeCategory);

  @insert
  Future<int?> insertExchangeCategory(ExchangeCategory exchangeCategory);
}
