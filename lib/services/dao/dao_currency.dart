import 'package:financial/models/currency.dart';
import 'package:floor/floor.dart';

@dao
abstract class CurrencyDao {
  @Query('SELECT * FROM Currency')
  Future<List<Currency>?> findAllCurrencies();

  @Query('SELECT * FROM Currency WHERE id = :id')
  Future<Currency?> findCurrencyById(int id);

  @Query('DELETE FROM Currency WHERE id = :id')
  Future<Currency?> deleteCurrency(int id);

  @update
  Future<void> updateCurrency(Currency currency);

  @insert
  Future<int?> insertCurrency(Currency currency);
}
