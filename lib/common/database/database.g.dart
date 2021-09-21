// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  WalletDao? _walletDaoInstance;

  CurrencyDao? _currencyDaoInstance;

  TransactionDao? _transactionDaoInstance;

  ExchangeCategoryDao? _exchangeCategoryDaoInstance;

  ContactDao? _contactDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `wallet` (`id` INTEGER NOT NULL, `name_wallet` TEXT NOT NULL, `balance` TEXT NOT NULL, `is_active` INTEGER NOT NULL, `icon` TEXT NOT NULL, `is_appear` INTEGER NOT NULL, `currency_id` INTEGER NOT NULL, FOREIGN KEY (`currency_id`) REFERENCES `currency` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `currency` (`id` INTEGER NOT NULL, `name` TEXT NOT NULL, `code` TEXT NOT NULL, `icon` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `transaction` (`id` INTEGER NOT NULL, `total` TEXT NOT NULL, `paid` TEXT NOT NULL, `rest` TEXT NOT NULL, `transaction_date` TEXT NOT NULL, `description` TEXT NOT NULL, `is_active` INTEGER NOT NULL, `is_appear` INTEGER NOT NULL, `is_income` INTEGER NOT NULL, `exchange_id` INTEGER NOT NULL, `wallet_id` INTEGER NOT NULL, `contact_id` INTEGER NOT NULL, FOREIGN KEY (`exchange_id`) REFERENCES `exchange_category` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, FOREIGN KEY (`wallet_id`) REFERENCES `wallet` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, FOREIGN KEY (`contact_id`) REFERENCES `contact` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `contact` (`id` INTEGER NOT NULL, `name_contact` TEXT NOT NULL, `is_active` INTEGER NOT NULL, `is_appear` INTEGER NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `exchange_category` (`id` INTEGER NOT NULL, `name_exchange_category` TEXT NOT NULL, `icon` TEXT NOT NULL, `is_active` INTEGER NOT NULL, `is_default` INTEGER NOT NULL, `is_income` INTEGER NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  WalletDao get walletDao {
    return _walletDaoInstance ??= _$WalletDao(database, changeListener);
  }

  @override
  CurrencyDao get currencyDao {
    return _currencyDaoInstance ??= _$CurrencyDao(database, changeListener);
  }

  @override
  TransactionDao get transactionDao {
    return _transactionDaoInstance ??=
        _$TransactionDao(database, changeListener);
  }

  @override
  ExchangeCategoryDao get exchangeCategoryDao {
    return _exchangeCategoryDaoInstance ??=
        _$ExchangeCategoryDao(database, changeListener);
  }

  @override
  ContactDao get contactDao {
    return _contactDaoInstance ??= _$ContactDao(database, changeListener);
  }
}

class _$WalletDao extends WalletDao {
  _$WalletDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _walletInsertionAdapter = InsertionAdapter(
            database,
            'wallet',
            (Wallet item) => <String, Object?>{
                  'id': item.id,
                  'name_wallet': item.name,
                  'balance': item.balance,
                  'is_active': item.isActive,
                  'icon': item.icon,
                  'is_appear': item.isAppear,
                  'currency_id': item.currencyId
                }),
        _walletUpdateAdapter = UpdateAdapter(
            database,
            'wallet',
            ['id'],
            (Wallet item) => <String, Object?>{
                  'id': item.id,
                  'name_wallet': item.name,
                  'balance': item.balance,
                  'is_active': item.isActive,
                  'icon': item.icon,
                  'is_appear': item.isAppear,
                  'currency_id': item.currencyId
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Wallet> _walletInsertionAdapter;

  final UpdateAdapter<Wallet> _walletUpdateAdapter;

  @override
  Future<List<Wallet>?> findAllWallets() async {
    return _queryAdapter.queryList('SELECT * FROM Wallet',
        mapper: (Map<String, Object?> row) => Wallet(
            row['id'] as int,
            row['name_wallet'] as String,
            row['balance'] as String,
            row['is_active'] as int,
            row['icon'] as String,
            row['is_appear'] as int,
            row['currency_id'] as int));
  }

  @override
  Future<Wallet?> findWalletById(int id) async {
    return _queryAdapter.query('SELECT * FROM Wallet WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Wallet(
            row['id'] as int,
            row['name_wallet'] as String,
            row['balance'] as String,
            row['is_active'] as int,
            row['icon'] as String,
            row['is_appear'] as int,
            row['currency_id'] as int),
        arguments: [id]);
  }

  @override
  Future<List<Wallet>?> retrieveWallets() async {
    return _queryAdapter.queryList('SELECT * FROM Wallet',
        mapper: (Map<String, Object?> row) => Wallet(
            row['id'] as int,
            row['name_wallet'] as String,
            row['balance'] as String,
            row['is_active'] as int,
            row['icon'] as String,
            row['is_appear'] as int,
            row['currency_id'] as int));
  }

  @override
  Future<Wallet?> deleteWallet(int id) async {
    return _queryAdapter.query('DELETE FROM Wallet WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Wallet(
            row['id'] as int,
            row['name_wallet'] as String,
            row['balance'] as String,
            row['is_active'] as int,
            row['icon'] as String,
            row['is_appear'] as int,
            row['currency_id'] as int),
        arguments: [id]);
  }

  @override
  Future<int> insertWallet(Wallet wallet) {
    return _walletInsertionAdapter.insertAndReturnId(
        wallet, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateWallet(Wallet wallet) async {
    await _walletUpdateAdapter.update(wallet, OnConflictStrategy.abort);
  }
}

class _$CurrencyDao extends CurrencyDao {
  _$CurrencyDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _currencyInsertionAdapter = InsertionAdapter(
            database,
            'currency',
            (Currency item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'code': item.code,
                  'icon': item.icon
                }),
        _currencyUpdateAdapter = UpdateAdapter(
            database,
            'currency',
            ['id'],
            (Currency item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'code': item.code,
                  'icon': item.icon
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Currency> _currencyInsertionAdapter;

  final UpdateAdapter<Currency> _currencyUpdateAdapter;

  @override
  Future<List<Currency>?> findAllCurrencies() async {
    return _queryAdapter.queryList('SELECT * FROM Currency',
        mapper: (Map<String, Object?> row) => Currency(
            row['id'] as int,
            row['name'] as String,
            row['code'] as String,
            row['icon'] as String));
  }

  @override
  Future<Currency?> findCurrencyById(int id) async {
    return _queryAdapter.query('SELECT * FROM Currency WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Currency(
            row['id'] as int,
            row['name'] as String,
            row['code'] as String,
            row['icon'] as String),
        arguments: [id]);
  }

  @override
  Future<Currency?> deleteCurrency(int id) async {
    return _queryAdapter.query('DELETE FROM Currency WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Currency(
            row['id'] as int,
            row['name'] as String,
            row['code'] as String,
            row['icon'] as String),
        arguments: [id]);
  }

  @override
  Future<int> insertCurrency(Currency currency) {
    return _currencyInsertionAdapter.insertAndReturnId(
        currency, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateCurrency(Currency currency) async {
    await _currencyUpdateAdapter.update(currency, OnConflictStrategy.abort);
  }
}

class _$TransactionDao extends TransactionDao {
  _$TransactionDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _transactionInsertionAdapter = InsertionAdapter(
            database,
            'transaction',
            (Transaction item) => <String, Object?>{
                  'id': item.id,
                  'total': item.total,
                  'paid': item.paid,
                  'rest': item.rest,
                  'transaction_date': item.transactionDate,
                  'description': item.description,
                  'is_active': item.isActive,
                  'is_appear': item.isAppear,
                  'is_income': item.isIncome,
                  'exchange_id': item.exchangeId,
                  'wallet_id': item.walletId,
                  'contact_id': item.contactId
                }),
        _transactionUpdateAdapter = UpdateAdapter(
            database,
            'transaction',
            ['id'],
            (Transaction item) => <String, Object?>{
                  'id': item.id,
                  'total': item.total,
                  'paid': item.paid,
                  'rest': item.rest,
                  'transaction_date': item.transactionDate,
                  'description': item.description,
                  'is_active': item.isActive,
                  'is_appear': item.isAppear,
                  'is_income': item.isIncome,
                  'exchange_id': item.exchangeId,
                  'wallet_id': item.walletId,
                  'contact_id': item.contactId
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Transaction> _transactionInsertionAdapter;

  final UpdateAdapter<Transaction> _transactionUpdateAdapter;

  @override
  Future<List<Transaction>?> findAllTransaction() async {
    return _queryAdapter.queryList('SELECT * FROM "transaction"',
        mapper: (Map<String, Object?> row) => Transaction(
            row['id'] as int,
            row['total'] as String,
            row['paid'] as String,
            row['rest'] as String,
            row['transaction_date'] as String,
            row['description'] as String,
            row['is_active'] as int,
            row['is_appear'] as int,
            row['is_income'] as int,
            row['exchange_id'] as int,
            row['wallet_id'] as int,
            row['contact_id'] as int));
  }

  @override
  Future<Transaction?> findTransactionById(int id) async {
    return _queryAdapter.query('SELECT * FROM "transaction" WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Transaction(
            row['id'] as int,
            row['total'] as String,
            row['paid'] as String,
            row['rest'] as String,
            row['transaction_date'] as String,
            row['description'] as String,
            row['is_active'] as int,
            row['is_appear'] as int,
            row['is_income'] as int,
            row['exchange_id'] as int,
            row['wallet_id'] as int,
            row['contact_id'] as int),
        arguments: [id]);
  }

  @override
  Future<List<Transaction>?> retrieveTransactions() async {
    return _queryAdapter.queryList('SELECT * FROM "transaction"',
        mapper: (Map<String, Object?> row) => Transaction(
            row['id'] as int,
            row['total'] as String,
            row['paid'] as String,
            row['rest'] as String,
            row['transaction_date'] as String,
            row['description'] as String,
            row['is_active'] as int,
            row['is_appear'] as int,
            row['is_income'] as int,
            row['exchange_id'] as int,
            row['wallet_id'] as int,
            row['contact_id'] as int));
  }

  @override
  Future<Transaction?> deleteTransaction(int id) async {
    return _queryAdapter.query('DELETE FROM "transaction" WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Transaction(
            row['id'] as int,
            row['total'] as String,
            row['paid'] as String,
            row['rest'] as String,
            row['transaction_date'] as String,
            row['description'] as String,
            row['is_active'] as int,
            row['is_appear'] as int,
            row['is_income'] as int,
            row['exchange_id'] as int,
            row['wallet_id'] as int,
            row['contact_id'] as int),
        arguments: [id]);
  }

  @override
  Future<FinancialReport?> mixData() async {
    return _queryAdapter.query('SELECT t.id,w.name_wallet,c.name,e.name_exchange_category,t.total,t.paid,t.rest,t.description,t.transaction_date,t.is_income FROM "transaction" t,Wallet w,Contact c,exchange_category e WHERE t.id = ? and w.id = ? and c.id = ? and e.id =?',
        arguments: <Object>[1,1,1,1],
        mapper: (Map<String, dynamic> row) =>FinancialReport(row['id'] as int, row['name_wallet'] as String, row['name'] as String, row['name_exchange_category'] as String, row['total'] as String, row['paid'] as String, row['rest'] as String, row['description'] as String, row['is_income'] as int, row['transaction_date'] as String));

  }

  @override
  Future<List<FinancialReport>?> mixesData() async {
    return _queryAdapter.queryList('SELECT t.id,w.name_wallet,c.name_contact,e.name_exchange_category,t.total,t.paid,t.rest,t.description,t.transaction_date,t.is_income FROM "transaction" t,Wallet w,Contact c,exchange_category e where t.wallet_id=w.id and t.contact_id=c.id and t.exchange_id=e.id GROUP By t.id',
        mapper: (Map<String, dynamic> row) =>FinancialReport(row['id'] as int, row['name_wallet'] as String, row['name_contact'] as String, row['name_exchange_category'] as String, row['total'] as String, row['paid'] as String, row['rest'] as String, row['description'] as String, row['is_income'] as int, row['transaction_date'] as String));

  }

  @override
  Future<List<FinancialReport>?> transactionByContact(
      int contactId, int walletId, int categoryId) async {
    if (contactId != 0 && walletId != 0 && categoryId != 0) {
      return _queryAdapter.queryList(
          'SELECT t.id,w.name_wallet,c.name_contact,e.name_exchange_category,t.total,t.paid,t.rest,t.description,t.transaction_date,t.is_income FROM "transaction" t,Wallet w,Contact c,exchange_category e WHERE t.wallet_id=w.id and c.id = ? and w.id = ? and e.id = ? and t.contact_id=c.id and t.exchange_id=e.id GROUP BY t.id',
          arguments: <Object>[contactId,walletId,categoryId],
          mapper: (Map<String, dynamic> row) =>
              FinancialReport(
                  row['id'] as int,
                  row['name_wallet'] as String,
                  row['name_contact'] as String,
                  row['name_exchange_category'] as String,
                  row['total'] as String,
                  row['paid'] as String,
                  row['rest'] as String,
                  row['transaction_date'] as String,
                  row['is_income'] as int,
                  row['description'] as String));
    }else if(contactId == 0 && walletId != 0 && categoryId != 0){
      return _queryAdapter.queryList(
          'SELECT t.id,w.name_wallet,c.name_contact,e.name_exchange_category,t.total,t.paid,t.rest,t.description,t.transaction_date,t.is_income FROM "transaction" t,Wallet w,Contact c,exchange_category e WHERE t.wallet_id=w.id and w.id = ? and e.id = ? and t.contact_id=c.id and t.exchange_id=e.id GROUP BY t.id',
          arguments: <Object>[walletId,categoryId],
          mapper: (Map<String, dynamic> row) =>
              FinancialReport(
                  row['id'] as int,
                  row['name_wallet'] as String,
                  row['name_contact'] as String,
                  row['name_exchange_category'] as String,
                  row['total'] as String,
                  row['paid'] as String,
                  row['rest'] as String,
                  row['transaction_date'] as String,
                  row['is_income'] as int,
                  row['description'] as String));
    }else if (contactId != 0 && walletId == 0 && categoryId != 0){
      return _queryAdapter.queryList(
          'SELECT t.id,w.name_wallet,c.name_contact,e.name_exchange_category,t.total,t.paid,t.rest,t.description,t.transaction_date,t.is_income FROM "transaction" t,Wallet w,Contact c,exchange_category e WHERE t.wallet_id=w.id and c.id = ? and e.id = ? and t.contact_id=c.id and t.exchange_id=e.id GROUP BY t.id',
          arguments: <Object>[contactId,categoryId],
          mapper: (Map<String, dynamic> row) =>
              FinancialReport(
                  row['id'] as int,
                  row['name_wallet'] as String,
                  row['name_contact'] as String,
                  row['name_exchange_category'] as String,
                  row['total'] as String,
                  row['paid'] as String,
                  row['rest'] as String,
                  row['transaction_date'] as String,
                  row['is_income'] as int,
                  row['description'] as String));
    }else if (contactId != 0 && walletId != 0 && categoryId == 0) {
      return _queryAdapter.queryList(
          'SELECT t.id,w.name_wallet,c.name_contact,e.name_exchange_category,t.total,t.paid,t.rest,t.description,t.transaction_date,t.is_income FROM "transaction" t,Wallet w,Contact c,exchange_category e WHERE t.wallet_id=w.id and c.id = ? and w.id = ? and t.contact_id=c.id and t.exchange_id=e.id GROUP BY t.id',
          arguments: <Object>[contactId,walletId],
          mapper: (Map<String, dynamic> row) =>
              FinancialReport(
                  row['id'] as int,
                  row['name_wallet'] as String,
                  row['name_contact'] as String,
                  row['name_exchange_category'] as String,
                  row['total'] as String,
                  row['paid'] as String,
                  row['rest'] as String,
                  row['transaction_date'] as String,
                  row['is_income'] as int,
                  row['description'] as String));
    }else if(contactId == 0 && walletId == 0 && categoryId != 0){
      return _queryAdapter.queryList(
          'SELECT t.id,w.name_wallet,c.name_contact,e.name_exchange_category,t.total,t.paid,t.rest,t.description,t.transaction_date,t.is_income FROM "transaction" t,Wallet w,Contact c,exchange_category e WHERE t.wallet_id=w.id and e.id = ? and t.contact_id=c.id and t.exchange_id=e.id GROUP BY t.id',
          arguments: <Object>[categoryId],
          mapper: (Map<String, dynamic> row) =>
              FinancialReport(
                  row['id'] as int,
                  row['name_wallet'] as String,
                  row['name_contact'] as String,
                  row['name_exchange_category'] as String,
                  row['total'] as String,
                  row['paid'] as String,
                  row['rest'] as String,
                  row['transaction_date'] as String,
                  row['is_income'] as int,
                  row['description'] as String));
    }else if(contactId == 0 && walletId != 0 && categoryId == 0){
      return _queryAdapter.queryList(
          'SELECT t.id,w.name_wallet,c.name_contact,e.name_exchange_category,t.total,t.paid,t.rest,t.description,t.transaction_date,t.is_income FROM "transaction" t,Wallet w,Contact c,exchange_category e WHERE t.wallet_id=w.id and w.id = ? and t.contact_id=c.id and t.exchange_id=e.id GROUP BY t.id',
          arguments: <Object>[walletId],
          mapper: (Map<String, dynamic> row) =>
              FinancialReport(
                  row['id'] as int,
                  row['name_wallet'] as String,
                  row['name_contact'] as String,
                  row['name_exchange_category'] as String,
                  row['total'] as String,
                  row['paid'] as String,
                  row['rest'] as String,
                  row['transaction_date'] as String,
                  row['is_income'] as int,
                  row['description'] as String));
    }else if(contactId != 0 && walletId == 0 && categoryId == 0){
      return _queryAdapter.queryList(
          'SELECT t.id,w.name_wallet,c.name_contact,e.name_exchange_category,t.total,t.paid,t.rest,t.description,t.transaction_date,t.is_income FROM "transaction" t,Wallet w,Contact c,exchange_category e WHERE t.wallet_id=w.id and c.id = ? and t.contact_id=c.id and t.exchange_id=e.id GROUP BY t.id',
          arguments: <Object>[contactId],
          mapper: (Map<String, dynamic> row) =>
              FinancialReport(
                  row['id'] as int,
                  row['name_wallet'] as String,
                  row['name_contact'] as String,
                  row['name_exchange_category'] as String,
                  row['total'] as String,
                  row['paid'] as String,
                  row['rest'] as String,
                  row['transaction_date'] as String,
                  row['is_income'] as int,
                  row['description'] as String));
    }else{
      return _queryAdapter.queryList(
          'SELECT t.id,w.name_wallet,c.name_contact,e.name_exchange_category,t.total,t.paid,t.rest,t.description,t.transaction_date,t.is_income FROM "transaction" t,Wallet w,Contact c,exchange_category e WHERE t.wallet_id=w.id and t.contact_id=c.id and t.exchange_id=e.id GROUP BY t.id',
          mapper: (Map<String, dynamic> row) =>
              FinancialReport(
                  row['id'] as int,
                  row['name_wallet'] as String,
                  row['name_contact'] as String,
                  row['name_exchange_category'] as String,
                  row['total'] as String,
                  row['paid'] as String,
                  row['rest'] as String,
                  row['transaction_date'] as String,
                  row['is_income'] as int,
                  row['description'] as String));
    }
  }

  @override
  Future<int> insertTransaction(Transaction transaction) {
    return _transactionInsertionAdapter.insertAndReturnId(
        transaction, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateTransaction(Transaction transaction) async {
    await _transactionUpdateAdapter.update(
        transaction, OnConflictStrategy.abort);
  }
}

class _$ExchangeCategoryDao extends ExchangeCategoryDao {
  _$ExchangeCategoryDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _exchangeCategoryInsertionAdapter = InsertionAdapter(
            database,
            'exchange_category',
            (ExchangeCategory item) => <String, Object?>{
                  'id': item.id,
                  'name_exchange_category': item.name,
                  'icon': item.icon,
                  'is_active': item.isActive,
                  'is_default': item.isDefault,
                  'is_income': item.isIncome
                }),
        _exchangeCategoryUpdateAdapter = UpdateAdapter(
            database,
            'exchange_category',
            ['id'],
            (ExchangeCategory item) => <String, Object?>{
                  'id': item.id,
                  'name_exchange_category': item.name,
                  'icon': item.icon,
                  'is_active': item.isActive,
                  'is_default': item.isDefault,
                  'is_income': item.isIncome
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ExchangeCategory> _exchangeCategoryInsertionAdapter;

  final UpdateAdapter<ExchangeCategory> _exchangeCategoryUpdateAdapter;

  @override
  Future<List<ExchangeCategory>?> findAllExchangeCategory() async {
    return _queryAdapter.queryList('SELECT * FROM exchange_category',
        mapper: (Map<String, Object?> row) => ExchangeCategory(
            row['id'] as int,
            row['name_exchange_category'] as String,
            row['is_active'] as int,
            row['icon'] as String,
            row['is_default'] as int,
            row['is_income'] as int));
  }

  @override
  Future<ExchangeCategory?> findExchangeCategoryById(int id) async {
    return _queryAdapter.query('SELECT * FROM exchange_category WHERE id = ?1',
        mapper: (Map<String, Object?> row) => ExchangeCategory(
            row['id'] as int,
            row['name_exchange_category'] as String,
            row['is_active'] as int,
            row['icon'] as String,
            row['is_default'] as int,
            row['is_income'] as int),
        arguments: [id]);
  }

  @override
  Future<List<ExchangeCategory>?> retrieveExchangeCategories() async {
    return _queryAdapter.queryList('SELECT * FROM exchange_category',
        mapper: (Map<String, Object?> row) => ExchangeCategory(
            row['id'] as int,
            row['name_exchange_category'] as String,
            row['is_active'] as int,
            row['icon'] as String,
            row['is_default'] as int,
            row['is_income'] as int));
  }

  @override
  Future<ExchangeCategory?> deleteExchangeCategory(int id) async {
    return _queryAdapter.query('DELETE FROM exchange_category WHERE id = ?1',
        mapper: (Map<String, Object?> row) => ExchangeCategory(
            row['id'] as int,
            row['name_exchange_category'] as String,
            row['is_active'] as int,
            row['icon'] as String,
            row['is_default'] as int,
            row['is_income'] as int),
        arguments: [id]);
  }

  @override
  Future<int> insertExchangeCategory(ExchangeCategory exchangeCategory) {
    return _exchangeCategoryInsertionAdapter.insertAndReturnId(
        exchangeCategory, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateExchangeCategory(ExchangeCategory exchangeCategory) async {
    await _exchangeCategoryUpdateAdapter.update(
        exchangeCategory, OnConflictStrategy.abort);
  }
}

class _$ContactDao extends ContactDao {
  _$ContactDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _contactInsertionAdapter = InsertionAdapter(
            database,
            'contact',
            (Contact item) => <String, Object?>{
                  'id': item.id,
                  'name_contact': item.name,
                  'is_active': item.isActive,
                  'is_appear': item.isAppear
                }),
        _contactUpdateAdapter = UpdateAdapter(
            database,
            'contact',
            ['id'],
            (Contact item) => <String, Object?>{
                  'id': item.id,
                  'name_contact': item.name,
                  'is_active': item.isActive,
                  'is_appear': item.isAppear
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Contact> _contactInsertionAdapter;

  final UpdateAdapter<Contact> _contactUpdateAdapter;

  @override
  Future<List<Contact>?> findAllContact() async {
    return _queryAdapter.queryList('SELECT * FROM Contact',
        mapper: (Map<String, Object?> row) => Contact(
            row['id'] as int,
            row['name_contact'] as String,
            row['is_active'] as int,
            row['is_appear'] as int));
  }

  @override
  Future<Contact?> findContactById(int id) async {
    return _queryAdapter.query('SELECT * FROM Contact WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Contact(
            row['id'] as int,
            row['name_contact'] as String,
            row['is_active'] as int,
            row['is_appear'] as int),
        arguments: [id]);
  }

  @override
  Future<List<Contact>?> retrieveContacts() async {
    return _queryAdapter.queryList('SELECT * FROM Contact',
        mapper: (Map<String, Object?> row) => Contact(
            row['id'] as int,
            row['name_contact'] as String,
            row['is_active'] as int,
            row['is_appear'] as int));
  }

  @override
  Future<Contact?> deleteContact(int id) async {
    return _queryAdapter.query('DELETE FROM Contact WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Contact(
            row['id'] as int,
            row['name_contact'] as String,
            row['is_active'] as int,
            row['is_appear'] as int),
        arguments: [id]);
  }

  @override
  Future<int> insertContact(Contact contact) {
    return _contactInsertionAdapter.insertAndReturnId(
        contact, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateContact(Contact contact) async {
    await _contactUpdateAdapter.update(contact, OnConflictStrategy.abort);
  }
}
