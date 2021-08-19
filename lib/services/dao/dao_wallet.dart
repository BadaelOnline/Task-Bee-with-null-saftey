import 'package:financial/models/wallet.dart';
import 'package:floor/floor.dart';

@dao
abstract class WalletDao {
  @Query('SELECT * FROM Wallet')
  Future<List<Wallet>?> findAllWallets();

  @Query('SELECT * FROM Wallet WHERE id = :id')
  Future<Wallet?> findWalletById(int id);

  @Query('SELECT * FROM Wallet')
  Future<List<Wallet>?> retrieveWallets();

  @Query('DELETE FROM Wallet WHERE id = :id')
  Future<Wallet?> deleteWallet(int id);

  @update
  Future<void> updateWallet(Wallet wallet);

  @insert
  Future<int?> insertWallet(Wallet wallet);
}
