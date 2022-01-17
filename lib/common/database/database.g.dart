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

  BmiDao? _bmiDaoInstance;

  CourseDao? _courseDaoInstance;

  AttachmentForTaskDao? _attachmentForTaskDaoInstance;

  TaskPlaceDao? _taskPlaceDaoInstance;

  StatusDao? _statusDaoInstance;

  TaskDao? _taskDaoInstance;

  TaskAttachmentDao? _taskAttachmentDaoInstance;

  TaskContactDao? _taskContactDaoInstance;

  TaskCourseDao? _taskCourseDaoInstance;

  TaskNoteDao? _taskNoteDaoInstance;

  TaskNotificationDao? _taskNotificationDaoInstance;

  TaskTypeDao? _taskTypeDaoInstance;

  TaskImportanceDao? _taskImportanceDaoInstance;

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
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Bmi` (`id` INTEGER NOT NULL, `length` REAL NOT NULL, `weight` REAL NOT NULL, `date` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `course` (`id` INTEGER NOT NULL, `name` TEXT NOT NULL, `color` TEXT NOT NULL, `is_active` INTEGER NOT NULL, `is_appear` INTEGER NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `attachment_for_task` (`id` INTEGER NOT NULL, `attach` TEXT NOT NULL, `is_active` INTEGER NOT NULL, `is_appear` INTEGER NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `task` (`id` INTEGER NOT NULL, `name_task` TEXT NOT NULL, `start_date` TEXT NOT NULL, `end_date` TEXT NOT NULL, `time` TEXT NOT NULL, `end_time` TEXT NOT NULL, `is_all_day` INTEGER NOT NULL, `is_active` INTEGER NOT NULL, `is_appear` INTEGER NOT NULL, `type_id` INTEGER NOT NULL, `importance_id` INTEGER NOT NULL, `status_id` INTEGER NOT NULL, FOREIGN KEY (`type_id`) REFERENCES `task_type` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, FOREIGN KEY (`importance_id`) REFERENCES `task_importance` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, FOREIGN KEY (`status_id`) REFERENCES `task_status` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `task_attachment` (`id` INTEGER NOT NULL, `is_active` INTEGER NOT NULL, `is_appear` INTEGER NOT NULL, `task_id` INTEGER NOT NULL, `attachment_id` INTEGER NOT NULL, FOREIGN KEY (`attachment_id`) REFERENCES `attachment_for_task` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, FOREIGN KEY (`task_id`) REFERENCES `task` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `task_contact` (`id` INTEGER NOT NULL, `is_active` INTEGER NOT NULL, `is_appear` INTEGER NOT NULL, `task_id` INTEGER NOT NULL, `contact_id` INTEGER NOT NULL, FOREIGN KEY (`contact_id`) REFERENCES `contact` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, FOREIGN KEY (`task_id`) REFERENCES `task` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `task_course` (`id` INTEGER NOT NULL, `is_active` INTEGER NOT NULL, `is_appear` INTEGER NOT NULL, `task_id` INTEGER NOT NULL, `course_id` INTEGER NOT NULL, FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, FOREIGN KEY (`task_id`) REFERENCES `task` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `task_note` (`id` INTEGER NOT NULL, `note` TEXT NOT NULL, `is_active` INTEGER NOT NULL, `state` INTEGER NOT NULL, `is_appear` INTEGER NOT NULL, `task_id` INTEGER NOT NULL, FOREIGN KEY (`task_id`) REFERENCES `task` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `task_notification` (`id` INTEGER NOT NULL, `is_active` INTEGER NOT NULL, `is_appear` INTEGER NOT NULL, `task_id` INTEGER NOT NULL, `meta_key` TEXT NOT NULL, `meta_vlaue` TEXT NOT NULL, FOREIGN KEY (`task_id`) REFERENCES `task` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `task_place` (`id` INTEGER NOT NULL, `place` TEXT NOT NULL, `is_active` INTEGER NOT NULL, `state` INTEGER NOT NULL, `is_appear` INTEGER NOT NULL, `task_id` INTEGER NOT NULL, FOREIGN KEY (`task_id`) REFERENCES `task` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `task_status` (`id` INTEGER NOT NULL, `state` TEXT NOT NULL, `is_active` INTEGER NOT NULL, `is_appear` INTEGER NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `task_type` (`id` INTEGER NOT NULL, `type` TEXT NOT NULL, `image` TEXT NOT NULL, `is_active` INTEGER NOT NULL, `is_appear` INTEGER NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `task_importance` (`id` INTEGER NOT NULL, `importance` TEXT NOT NULL, `color` TEXT NOT NULL, `is_active` INTEGER NOT NULL, `is_appear` INTEGER NOT NULL, PRIMARY KEY (`id`))');

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

  @override
  BmiDao get bmiDao {
    return _bmiDaoInstance ??= _$BmiDao(database, changeListener);
  }

  @override
  CourseDao get courseDao {
    return _courseDaoInstance ??= _$CourseDao(database, changeListener);
  }

  @override
  AttachmentForTaskDao get attachmentForTaskDao {
    return _attachmentForTaskDaoInstance ??=
        _$AttachmentForTaskDao(database, changeListener);
  }

  @override
  TaskPlaceDao get taskPlaceDao {
    return _taskPlaceDaoInstance ??= _$TaskPlaceDao(database, changeListener);
  }

  @override
  StatusDao get statusDao {
    return _statusDaoInstance ??= _$StatusDao(database, changeListener);
  }

  @override
  TaskDao get taskDao {
    return _taskDaoInstance ??= _$TaskDao(database, changeListener);
  }

  @override
  TaskAttachmentDao get taskAttachmentDao {
    return _taskAttachmentDaoInstance ??=
        _$TaskAttachmentDao(database, changeListener);
  }

  @override
  TaskContactDao get taskContactDao {
    return _taskContactDaoInstance ??=
        _$TaskContactDao(database, changeListener);
  }

  @override
  TaskCourseDao get taskCourseDao {
    return _taskCourseDaoInstance ??= _$TaskCourseDao(database, changeListener);
  }

  @override
  TaskNoteDao get taskNoteDao {
    return _taskNoteDaoInstance ??= _$TaskNoteDao(database, changeListener);
  }

  @override
  TaskNotificationDao get taskNotificationDao {
    return _taskNotificationDaoInstance ??=
        _$TaskNotificationDao(database, changeListener);
  }

  @override
  TaskTypeDao get taskTypeDao {
    return _taskTypeDaoInstance ??= _$TaskTypeDao(database, changeListener);
  }

  @override
  TaskImportanceDao get taskImportanceDao {
    return _taskImportanceDaoInstance ??=
        _$TaskImportanceDao(database, changeListener);
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
            "transaction",
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
            "transaction",
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
    await _queryAdapter.queryNoReturn(
        'SELECT t.id,w.name_wallet,c.name,e.name_exchange_category,t.total,t.paid,t.rest,t.description,t.transaction_date,t.is_income FROM "transaction" t,Wallet w,Contact c,exchange_category e WHERE t.wallet=w.id and t.exchange = e.id and t.contact =c.id');
  }

  @override
  Future<List<FinancialReport>?> mixesData() async {
    await _queryAdapter.queryNoReturn(
        'SELECT t.id,w.name_wallet,c.name,e.name_exchange_category,t.total,t.paid,t.rest,t.description,t.transaction_date,t.is_income FROM "transaction" t,Wallet w,Contact c,exchange_category e WHERE t.wallet=w.id and t.exchange = e.id and t.contact =c.id');
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

class _$BmiDao extends BmiDao {
  _$BmiDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _bmiInsertionAdapter = InsertionAdapter(
            database,
            'Bmi',
            (Bmi item) => <String, Object?>{
                  'id': item.id,
                  'length': item.length,
                  'weight': item.weight,
                  'date': item.date
                }),
        _bmiUpdateAdapter = UpdateAdapter(
            database,
            'Bmi',
            ['id'],
            (Bmi item) => <String, Object?>{
                  'id': item.id,
                  'length': item.length,
                  'weight': item.weight,
                  'date': item.date
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Bmi> _bmiInsertionAdapter;

  final UpdateAdapter<Bmi> _bmiUpdateAdapter;

  @override
  Future<List<Bmi>?> findAllBmi() async {
    return _queryAdapter.queryList('SELECT * FROM Bmi',
        mapper: (Map<String, Object?> row) => Bmi(
            row['id'] as int,
            row['length'] as double,
            row['weight'] as double,
            row['date'] as String));
  }

  @override
  Future<Bmi?> deleteBmi(int id) async {
    return _queryAdapter.query('DELETE FROM Bmi WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Bmi(
            row['id'] as int,
            row['length'] as double,
            row['weight'] as double,
            row['date'] as String),
        arguments: [id]);
  }

  @override
  Future<int> insertBmi(Bmi bmi) {
    return _bmiInsertionAdapter.insertAndReturnId(
        bmi, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateBmi(Bmi bmi) async {
    await _bmiUpdateAdapter.update(bmi, OnConflictStrategy.abort);
  }
}

class _$CourseDao extends CourseDao {
  _$CourseDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _courseInsertionAdapter = InsertionAdapter(
            database,
            'course',
            (Course item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'color': item.color,
                  'is_active': item.isActive,
                  'is_appear': item.isAppear
                }),
        _courseUpdateAdapter = UpdateAdapter(
            database,
            'course',
            ['id'],
            (Course item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'color': item.color,
                  'is_active': item.isActive,
                  'is_appear': item.isAppear
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Course> _courseInsertionAdapter;

  final UpdateAdapter<Course> _courseUpdateAdapter;

  @override
  Future<List<Course>?> findAllCourses() async {
    return _queryAdapter.queryList('SELECT * FROM course',
        mapper: (Map<String, Object?> row) => Course(
            row['id'] as int,
            row['is_active'] as int,
            row['is_appear'] as int,
            row['name'] as String,
            row['color'] as String));
  }

  @override
  Future<Course?> findCourseById(int id) async {
    return _queryAdapter.query('SELECT * FROM course WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Course(
            row['id'] as int,
            row['is_active'] as int,
            row['is_appear'] as int,
            row['name'] as String,
            row['color'] as String),
        arguments: [id]);
  }

  @override
  Future<Course?> deleteCourse(int id) async {
    return _queryAdapter.query('DELETE FROM course WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Course(
            row['id'] as int,
            row['is_active'] as int,
            row['is_appear'] as int,
            row['name'] as String,
            row['color'] as String),
        arguments: [id]);
  }

  @override
  Future<int> insertCourse(Course course) {
    return _courseInsertionAdapter.insertAndReturnId(
        course, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateCourse(Course course) async {
    await _courseUpdateAdapter.update(course, OnConflictStrategy.abort);
  }
}

class _$AttachmentForTaskDao extends AttachmentForTaskDao {
  _$AttachmentForTaskDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _attachmentForTaskInsertionAdapter = InsertionAdapter(
            database,
            'attachment_for_task',
            (AttachmentForTask item) => <String, Object?>{
                  'id': item.id,
                  'attach': item.attach,
                  'is_active': item.isActive,
                  'is_appear': item.isAppear
                }),
        _attachmentForTaskUpdateAdapter = UpdateAdapter(
            database,
            'attachment_for_task',
            ['id'],
            (AttachmentForTask item) => <String, Object?>{
                  'id': item.id,
                  'attach': item.attach,
                  'is_active': item.isActive,
                  'is_appear': item.isAppear
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<AttachmentForTask> _attachmentForTaskInsertionAdapter;

  final UpdateAdapter<AttachmentForTask> _attachmentForTaskUpdateAdapter;

  @override
  Future<List<AttachmentForTask>?> findAllAttachmentForTasks() async {
    return _queryAdapter.queryList('SELECT * FROM attachment_for_task',
        mapper: (Map<String, Object?> row) => AttachmentForTask(
            row['id'] as int,
            row['is_active'] as int,
            row['is_appear'] as int,
            row['attach'] as String));
  }

  @override
  Future<AttachmentForTask?> findAttachmentForTaskById(int id) async {
    return _queryAdapter.query(
        'SELECT * FROM attachment_for_task WHERE id = ?1',
        mapper: (Map<String, Object?> row) => AttachmentForTask(
            row['id'] as int,
            row['is_active'] as int,
            row['is_appear'] as int,
            row['attach'] as String),
        arguments: [id]);
  }

  @override
  Future<AttachmentForTask?> deleteAttachmentForTask(int id) async {
    return _queryAdapter.query('DELETE FROM attachment_for_task WHERE id = ?1',
        mapper: (Map<String, Object?> row) => AttachmentForTask(
            row['id'] as int,
            row['is_active'] as int,
            row['is_appear'] as int,
            row['attach'] as String),
        arguments: [id]);
  }

  @override
  Future<int> insertAttachmentForTask(AttachmentForTask attachmentForTask) {
    return _attachmentForTaskInsertionAdapter.insertAndReturnId(
        attachmentForTask, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateAttachmentForTask(
      AttachmentForTask attachmentForTask) async {
    await _attachmentForTaskUpdateAdapter.update(
        attachmentForTask, OnConflictStrategy.abort);
  }
}

class _$TaskPlaceDao extends TaskPlaceDao {
  _$TaskPlaceDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _taskPlaceInsertionAdapter = InsertionAdapter(
            database,
            'task_place',
            (TaskPlace item) => <String, Object?>{
                  'id': item.id,
                  'place': item.place,
                  'is_active': item.isActive,
                  'state': item.state,
                  'is_appear': item.isAppear,
                  'task_id': item.taskId
                }),
        _taskPlaceUpdateAdapter = UpdateAdapter(
            database,
            'task_place',
            ['id'],
            (TaskPlace item) => <String, Object?>{
                  'id': item.id,
                  'place': item.place,
                  'is_active': item.isActive,
                  'state': item.state,
                  'is_appear': item.isAppear,
                  'task_id': item.taskId
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TaskPlace> _taskPlaceInsertionAdapter;

  final UpdateAdapter<TaskPlace> _taskPlaceUpdateAdapter;

  @override
  Future<List<TaskPlace>?> findAllPlaces() async {
    return _queryAdapter.queryList('SELECT * FROM task_place',
        mapper: (Map<String, Object?> row) => TaskPlace(
            row['id'] as int,
            row['is_active'] as int,
            row['is_appear'] as int,
            row['task_id'] as int,
            row['place'] as String,
            row['state'] as int));
  }

  @override
  Future<TaskPlace?> findPlaceById(int id) async {
    return _queryAdapter.query('SELECT * FROM task_place WHERE id = ?1',
        mapper: (Map<String, Object?> row) => TaskPlace(
            row['id'] as int,
            row['is_active'] as int,
            row['is_appear'] as int,
            row['task_id'] as int,
            row['place'] as String,
            row['state'] as int),
        arguments: [id]);
  }

  @override
  Future<TaskPlace?> deletePlace(int id) async {
    return _queryAdapter.query('DELETE FROM task_place WHERE id = ?1',
        mapper: (Map<String, Object?> row) => TaskPlace(
            row['id'] as int,
            row['is_active'] as int,
            row['is_appear'] as int,
            row['task_id'] as int,
            row['place'] as String,
            row['state'] as int),
        arguments: [id]);
  }

  @override
  Future<int> insertPlace(TaskPlace taskPlace) {
    return _taskPlaceInsertionAdapter.insertAndReturnId(
        taskPlace, OnConflictStrategy.abort);
  }

  @override
  Future<void> updatePlace(TaskPlace taskPlace) async {
    await _taskPlaceUpdateAdapter.update(taskPlace, OnConflictStrategy.abort);
  }
}

class _$StatusDao extends StatusDao {
  _$StatusDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _taskStatusInsertionAdapter = InsertionAdapter(
            database,
            'task_status',
            (TaskStatus item) => <String, Object?>{
                  'id': item.id,
                  'state': item.state,
                  'is_active': item.isActive,
                  'is_appear': item.isAppear
                }),
        _taskStatusUpdateAdapter = UpdateAdapter(
            database,
            'task_status',
            ['id'],
            (TaskStatus item) => <String, Object?>{
                  'id': item.id,
                  'state': item.state,
                  'is_active': item.isActive,
                  'is_appear': item.isAppear
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TaskStatus> _taskStatusInsertionAdapter;

  final UpdateAdapter<TaskStatus> _taskStatusUpdateAdapter;

  @override
  Future<List<TaskStatus>?> findAllStatus() async {
    return _queryAdapter.queryList('SELECT * FROM task_status',
        mapper: (Map<String, Object?> row) => TaskStatus(
            row['id'] as int,
            row['is_active'] as int,
            row['is_appear'] as int,
            row['state'] as String));
  }

  @override
  Future<TaskStatus?> findStatusById(int id) async {
    return _queryAdapter.query('SELECT * FROM task_status WHERE id = ?1',
        mapper: (Map<String, Object?> row) => TaskStatus(
            row['id'] as int,
            row['is_active'] as int,
            row['is_appear'] as int,
            row['state'] as String),
        arguments: [id]);
  }

  @override
  Future<TaskStatus?> deleteStatus(int id) async {
    return _queryAdapter.query('DELETE FROM task_status WHERE id = ?1',
        mapper: (Map<String, Object?> row) => TaskStatus(
            row['id'] as int,
            row['is_active'] as int,
            row['is_appear'] as int,
            row['state'] as String),
        arguments: [id]);
  }

  @override
  Future<int> insertStatus(TaskStatus taskStatus) {
    return _taskStatusInsertionAdapter.insertAndReturnId(
        taskStatus, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateStatus(TaskStatus taskStatus) async {
    await _taskStatusUpdateAdapter.update(taskStatus, OnConflictStrategy.abort);
  }
}

class _$TaskDao extends TaskDao {
  _$TaskDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _taskInsertionAdapter = InsertionAdapter(
            database,
            'task',
            (Task item) => <String, Object?>{
                  'id': item.id,
                  'name_task': item.name,
                  'start_date': item.stDate,
                  'end_date': item.enDate,
                  'time': item.stTime,
                  'end_time': item.enTime,
                  'is_all_day': item.isAllDay,
                  'is_active': item.isActive,
                  'is_appear': item.isAppear,
                  'type_id': item.typeId,
                  'importance_id': item.importanceId,
                  'status_id': item.statusId
                }),
        _taskUpdateAdapter = UpdateAdapter(
            database,
            'task',
            ['id'],
            (Task item) => <String, Object?>{
                  'id': item.id,
                  'name_task': item.name,
                  'start_date': item.stDate,
                  'end_date': item.enDate,
                  'time': item.stTime,
                  'end_time': item.enTime,
                  'is_all_day': item.isAllDay,
                  'is_active': item.isActive,
                  'is_appear': item.isAppear,
                  'type_id': item.typeId,
                  'importance_id': item.importanceId,
                  'status_id': item.statusId
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Task> _taskInsertionAdapter;

  final UpdateAdapter<Task> _taskUpdateAdapter;

  @override
  Future<List<Task>?> findAllTasks() async {
    return _queryAdapter.queryList('SELECT * FROM task',
        mapper: (Map<String, Object?> row) => Task(
            row['id'] as int,
            row['name_task'] as String,
            row['is_active'] as int,
            row['is_appear'] as int,
            row['type_id'] as int,
            row['start_date'] as String,
            row['end_date'] as String,
            row['time'] as String,
            row['end_time'] as String,
            row['is_all_day'] as int,
            row['importance_id'] as int,
            row['status_id'] as int));
  }

  @override
  Future<Task?> findTaskById(int id) async {
    return _queryAdapter.query('SELECT * FROM task WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Task(
            row['id'] as int,
            row['name_task'] as String,
            row['is_active'] as int,
            row['is_appear'] as int,
            row['type_id'] as int,
            row['start_date'] as String,
            row['end_date'] as String,
            row['time'] as String,
            row['end_time'] as String,
            row['is_all_day'] as int,
            row['importance_id'] as int,
            row['status_id'] as int),
        arguments: [id]);
  }

  @override
  Future<Task?> deleteTask(int id) async {
    return _queryAdapter.query('DELETE FROM task WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Task(
            row['id'] as int,
            row['name_task'] as String,
            row['is_active'] as int,
            row['is_appear'] as int,
            row['type_id'] as int,
            row['start_date'] as String,
            row['end_date'] as String,
            row['time'] as String,
            row['end_time'] as String,
            row['is_all_day'] as int,
            row['importance_id'] as int,
            row['status_id'] as int),
        arguments: [id]);
  }

  @override
  Future<int> insertTask(Task task) {
    return _taskInsertionAdapter.insertAndReturnId(
        task, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateTask(Task task) async {
    await _taskUpdateAdapter.update(task, OnConflictStrategy.abort);
  }
}

class _$TaskAttachmentDao extends TaskAttachmentDao {
  _$TaskAttachmentDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _taskAttachmentInsertionAdapter = InsertionAdapter(
            database,
            'task_attachment',
            (TaskAttachment item) => <String, Object?>{
                  'id': item.id,
                  'is_active': item.isActive,
                  'is_appear': item.isAppear,
                  'task_id': item.taskId,
                  'attachment_id': item.attachmentId
                }),
        _taskAttachmentUpdateAdapter = UpdateAdapter(
            database,
            'task_attachment',
            ['id'],
            (TaskAttachment item) => <String, Object?>{
                  'id': item.id,
                  'is_active': item.isActive,
                  'is_appear': item.isAppear,
                  'task_id': item.taskId,
                  'attachment_id': item.attachmentId
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TaskAttachment> _taskAttachmentInsertionAdapter;

  final UpdateAdapter<TaskAttachment> _taskAttachmentUpdateAdapter;

  @override
  Future<List<TaskAttachment>?> findAllAttachments() async {
    return _queryAdapter.queryList('SELECT * FROM task_attachment',
        mapper: (Map<String, Object?> row) => TaskAttachment(
            row['id'] as int,
            row['is_active'] as int,
            row['is_appear'] as int,
            row['task_id'] as int,
            row['attachment_id'] as int));
  }

  @override
  Future<TaskAttachment?> findAttachmentById(int id) async {
    return _queryAdapter.query('SELECT * FROM task_attachment WHERE id = ?1',
        mapper: (Map<String, Object?> row) => TaskAttachment(
            row['id'] as int,
            row['is_active'] as int,
            row['is_appear'] as int,
            row['task_id'] as int,
            row['attachment_id'] as int),
        arguments: [id]);
  }

  @override
  Future<TaskAttachment?> deleteAttachment(int id) async {
    return _queryAdapter.query('DELETE FROM task_attachment WHERE id = ?1',
        mapper: (Map<String, Object?> row) => TaskAttachment(
            row['id'] as int,
            row['is_active'] as int,
            row['is_appear'] as int,
            row['task_id'] as int,
            row['attachment_id'] as int),
        arguments: [id]);
  }

  @override
  Future<int> insertAttachment(TaskAttachment taskAttachment) {
    return _taskAttachmentInsertionAdapter.insertAndReturnId(
        taskAttachment, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateAttachment(TaskAttachment taskAttachment) async {
    await _taskAttachmentUpdateAdapter.update(
        taskAttachment, OnConflictStrategy.abort);
  }
}

class _$TaskContactDao extends TaskContactDao {
  _$TaskContactDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _taskContactInsertionAdapter = InsertionAdapter(
            database,
            'task_contact',
            (TaskContact item) => <String, Object?>{
                  'id': item.id,
                  'is_active': item.isActive,
                  'is_appear': item.isAppear,
                  'task_id': item.taskId,
                  'contact_id': item.contactId
                }),
        _taskContactUpdateAdapter = UpdateAdapter(
            database,
            'task_contact',
            ['id'],
            (TaskContact item) => <String, Object?>{
                  'id': item.id,
                  'is_active': item.isActive,
                  'is_appear': item.isAppear,
                  'task_id': item.taskId,
                  'contact_id': item.contactId
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TaskContact> _taskContactInsertionAdapter;

  final UpdateAdapter<TaskContact> _taskContactUpdateAdapter;

  @override
  Future<List<TaskContact>?> findAllContacts() async {
    return _queryAdapter.queryList('SELECT * FROM task_contact',
        mapper: (Map<String, Object?> row) => TaskContact(
            row['id'] as int,
            row['is_active'] as int,
            row['is_appear'] as int,
            row['task_id'] as int,
            row['contact_id'] as int));
  }

  @override
  Future<TaskContact?> findContactById(int id) async {
    return _queryAdapter.query('SELECT * FROM task_contact WHERE id = ?1',
        mapper: (Map<String, Object?> row) => TaskContact(
            row['id'] as int,
            row['is_active'] as int,
            row['is_appear'] as int,
            row['task_id'] as int,
            row['contact_id'] as int),
        arguments: [id]);
  }

  @override
  Future<TaskContact?> deleteContact(int id) async {
    return _queryAdapter.query('DELETE FROM task_contact WHERE id = ?1',
        mapper: (Map<String, Object?> row) => TaskContact(
            row['id'] as int,
            row['is_active'] as int,
            row['is_appear'] as int,
            row['task_id'] as int,
            row['contact_id'] as int),
        arguments: [id]);
  }

  @override
  Future<int> insertContact(TaskContact taskContact) {
    return _taskContactInsertionAdapter.insertAndReturnId(
        taskContact, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateContact(TaskContact taskContact) async {
    await _taskContactUpdateAdapter.update(
        taskContact, OnConflictStrategy.abort);
  }
}

class _$TaskCourseDao extends TaskCourseDao {
  _$TaskCourseDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _taskCourseInsertionAdapter = InsertionAdapter(
            database,
            'task_course',
            (TaskCourse item) => <String, Object?>{
                  'id': item.id,
                  'is_active': item.isActive,
                  'is_appear': item.isAppear,
                  'task_id': item.taskId,
                  'course_id': item.courseId
                }),
        _taskCourseUpdateAdapter = UpdateAdapter(
            database,
            'task_course',
            ['id'],
            (TaskCourse item) => <String, Object?>{
                  'id': item.id,
                  'is_active': item.isActive,
                  'is_appear': item.isAppear,
                  'task_id': item.taskId,
                  'course_id': item.courseId
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TaskCourse> _taskCourseInsertionAdapter;

  final UpdateAdapter<TaskCourse> _taskCourseUpdateAdapter;

  @override
  Future<List<TaskCourse>?> findAllCourses() async {
    return _queryAdapter.queryList('SELECT * FROM task_course',
        mapper: (Map<String, Object?> row) => TaskCourse(
            row['id'] as int,
            row['is_active'] as int,
            row['is_appear'] as int,
            row['task_id'] as int,
            row['course_id'] as int));
  }

  @override
  Future<TaskCourse?> findCourseById(int id) async {
    return _queryAdapter.query('SELECT * FROM task_course WHERE id = ?1',
        mapper: (Map<String, Object?> row) => TaskCourse(
            row['id'] as int,
            row['is_active'] as int,
            row['is_appear'] as int,
            row['task_id'] as int,
            row['course_id'] as int),
        arguments: [id]);
  }

  @override
  Future<TaskCourse?> deleteCourse(int id) async {
    return _queryAdapter.query('DELETE FROM task_course WHERE id = ?1',
        mapper: (Map<String, Object?> row) => TaskCourse(
            row['id'] as int,
            row['is_active'] as int,
            row['is_appear'] as int,
            row['task_id'] as int,
            row['course_id'] as int),
        arguments: [id]);
  }

  @override
  Future<int> insertCourse(TaskCourse taskCourse) {
    return _taskCourseInsertionAdapter.insertAndReturnId(
        taskCourse, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateCourse(TaskCourse taskCourse) async {
    await _taskCourseUpdateAdapter.update(taskCourse, OnConflictStrategy.abort);
  }
}

class _$TaskNoteDao extends TaskNoteDao {
  _$TaskNoteDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _taskNoteInsertionAdapter = InsertionAdapter(
            database,
            'task_note',
            (TaskNote item) => <String, Object?>{
                  'id': item.id,
                  'note': item.note,
                  'is_active': item.isActive,
                  'state': item.state,
                  'is_appear': item.isAppear,
                  'task_id': item.taskId
                }),
        _taskNoteUpdateAdapter = UpdateAdapter(
            database,
            'task_note',
            ['id'],
            (TaskNote item) => <String, Object?>{
                  'id': item.id,
                  'note': item.note,
                  'is_active': item.isActive,
                  'state': item.state,
                  'is_appear': item.isAppear,
                  'task_id': item.taskId
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TaskNote> _taskNoteInsertionAdapter;

  final UpdateAdapter<TaskNote> _taskNoteUpdateAdapter;

  @override
  Future<List<TaskNote>?> findAllNotes() async {
    return _queryAdapter.queryList('SELECT * FROM task_note',
        mapper: (Map<String, Object?> row) => TaskNote(
            row['id'] as int,
            row['is_active'] as int,
            row['is_appear'] as int,
            row['task_id'] as int,
            row['note'] as String,
            row['state'] as int));
  }

  @override
  Future<TaskNote?> findNoteById(int id) async {
    return _queryAdapter.query('SELECT * FROM task_note WHERE id = ?1',
        mapper: (Map<String, Object?> row) => TaskNote(
            row['id'] as int,
            row['is_active'] as int,
            row['is_appear'] as int,
            row['task_id'] as int,
            row['note'] as String,
            row['state'] as int),
        arguments: [id]);
  }

  @override
  Future<TaskNote?> deleteNote(int id) async {
    return _queryAdapter.query('DELETE FROM task_note WHERE id = ?1',
        mapper: (Map<String, Object?> row) => TaskNote(
            row['id'] as int,
            row['is_active'] as int,
            row['is_appear'] as int,
            row['task_id'] as int,
            row['note'] as String,
            row['state'] as int),
        arguments: [id]);
  }

  @override
  Future<int> insertNote(TaskNote taskNote) {
    return _taskNoteInsertionAdapter.insertAndReturnId(
        taskNote, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateNote(TaskNote taskNote) async {
    await _taskNoteUpdateAdapter.update(taskNote, OnConflictStrategy.abort);
  }
}

class _$TaskNotificationDao extends TaskNotificationDao {
  _$TaskNotificationDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _taskNotificationInsertionAdapter = InsertionAdapter(
            database,
            'task_notification',
            (TaskNotification item) => <String, Object?>{
                  'id': item.id,
                  'is_active': item.isActive,
                  'is_appear': item.isAppear,
                  'task_id': item.taskId,
                  'meta_key': item.metaKey,
                  'meta_vlaue': item.metaValue
                }),
        _taskNotificationUpdateAdapter = UpdateAdapter(
            database,
            'task_notification',
            ['id'],
            (TaskNotification item) => <String, Object?>{
                  'id': item.id,
                  'is_active': item.isActive,
                  'is_appear': item.isAppear,
                  'task_id': item.taskId,
                  'meta_key': item.metaKey,
                  'meta_vlaue': item.metaValue
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TaskNotification> _taskNotificationInsertionAdapter;

  final UpdateAdapter<TaskNotification> _taskNotificationUpdateAdapter;

  @override
  Future<List<TaskNotification>?> findAllNotifications() async {
    return _queryAdapter.queryList('SELECT * FROM task_notification',
        mapper: (Map<String, Object?> row) => TaskNotification(
            row['id'] as int,
            row['is_active'] as int,
            row['is_appear'] as int,
            row['task_id'] as int,
            row['meta_key'] as String,
            row['meta_vlaue'] as String));
  }

  @override
  Future<TaskNotification?> findNotificationById(int id) async {
    return _queryAdapter.query('SELECT * FROM task_notification WHERE id = ?1',
        mapper: (Map<String, Object?> row) => TaskNotification(
            row['id'] as int,
            row['is_active'] as int,
            row['is_appear'] as int,
            row['task_id'] as int,
            row['meta_key'] as String,
            row['meta_vlaue'] as String),
        arguments: [id]);
  }

  @override
  Future<TaskNotification?> deleteNotification(int id) async {
    return _queryAdapter.query('DELETE FROM task_notification WHERE id = ?1',
        mapper: (Map<String, Object?> row) => TaskNotification(
            row['id'] as int,
            row['is_active'] as int,
            row['is_appear'] as int,
            row['task_id'] as int,
            row['meta_key'] as String,
            row['meta_vlaue'] as String),
        arguments: [id]);
  }

  @override
  Future<int> insertNotification(TaskNotification taskNotification) {
    return _taskNotificationInsertionAdapter.insertAndReturnId(
        taskNotification, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateNotification(TaskNotification taskNotification) async {
    await _taskNotificationUpdateAdapter.update(
        taskNotification, OnConflictStrategy.abort);
  }
}

class _$TaskTypeDao extends TaskTypeDao {
  _$TaskTypeDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _taskTypeInsertionAdapter = InsertionAdapter(
            database,
            'task_type',
            (TaskType item) => <String, Object?>{
                  'id': item.id,
                  'type': item.type,
                  'image': item.image,
                  'is_active': item.isActive,
                  'is_appear': item.isAppear
                }),
        _taskTypeUpdateAdapter = UpdateAdapter(
            database,
            'task_type',
            ['id'],
            (TaskType item) => <String, Object?>{
                  'id': item.id,
                  'type': item.type,
                  'image': item.image,
                  'is_active': item.isActive,
                  'is_appear': item.isAppear
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TaskType> _taskTypeInsertionAdapter;

  final UpdateAdapter<TaskType> _taskTypeUpdateAdapter;

  @override
  Future<List<TaskType>?> findAllTypes() async {
    return _queryAdapter.queryList('SELECT * FROM task_type',
        mapper: (Map<String, Object?> row) => TaskType(
            row['id'] as int,
            row['is_active'] as int,
            row['is_appear'] as int,
            row['type'] as String,
            row['image'] as String));
  }

  @override
  Future<TaskType?> findTypeById(int id) async {
    return _queryAdapter.query('SELECT * FROM task_type WHERE id = ?1',
        mapper: (Map<String, Object?> row) => TaskType(
            row['id'] as int,
            row['is_active'] as int,
            row['is_appear'] as int,
            row['type'] as String,
            row['image'] as String),
        arguments: [id]);
  }

  @override
  Future<TaskType?> deleteType(int id) async {
    return _queryAdapter.query('DELETE FROM task_type WHERE id = ?1',
        mapper: (Map<String, Object?> row) => TaskType(
            row['id'] as int,
            row['is_active'] as int,
            row['is_appear'] as int,
            row['type'] as String,
            row['image'] as String),
        arguments: [id]);
  }

  @override
  Future<int> insertType(TaskType taskType) {
    return _taskTypeInsertionAdapter.insertAndReturnId(
        taskType, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateType(TaskType taskType) async {
    await _taskTypeUpdateAdapter.update(taskType, OnConflictStrategy.abort);
  }
}

class _$TaskImportanceDao extends TaskImportanceDao {
  _$TaskImportanceDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _taskImportanceInsertionAdapter = InsertionAdapter(
            database,
            'task_importance',
            (TaskImportance item) => <String, Object?>{
                  'id': item.id,
                  'importance': item.importance,
                  'color': item.color,
                  'is_active': item.isActive,
                  'is_appear': item.isAppear
                }),
        _taskImportanceUpdateAdapter = UpdateAdapter(
            database,
            'task_importance',
            ['id'],
            (TaskImportance item) => <String, Object?>{
                  'id': item.id,
                  'importance': item.importance,
                  'color': item.color,
                  'is_active': item.isActive,
                  'is_appear': item.isAppear
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TaskImportance> _taskImportanceInsertionAdapter;

  final UpdateAdapter<TaskImportance> _taskImportanceUpdateAdapter;

  @override
  Future<List<TaskImportance>?> findAllImportance() async {
    return _queryAdapter.queryList('SELECT * FROM task_importance',
        mapper: (Map<String, Object?> row) => TaskImportance(
            row['id'] as int,
            row['is_active'] as int,
            row['is_appear'] as int,
            row['importance'] as String,
            row['color'] as String));
  }

  @override
  Future<TaskImportance?> findImportanceById(int id) async {
    return _queryAdapter.query('SELECT * FROM task_importance WHERE id = ?1',
        mapper: (Map<String, Object?> row) => TaskImportance(
            row['id'] as int,
            row['is_active'] as int,
            row['is_appear'] as int,
            row['importance'] as String,
            row['color'] as String),
        arguments: [id]);
  }

  @override
  Future<TaskImportance?> deleteImportance(int id) async {
    return _queryAdapter.query('DELETE FROM task_importance WHERE id = ?1',
        mapper: (Map<String, Object?> row) => TaskImportance(
            row['id'] as int,
            row['is_active'] as int,
            row['is_appear'] as int,
            row['importance'] as String,
            row['color'] as String),
        arguments: [id]);
  }

  @override
  Future<int> insertImportance(TaskImportance taskImportance) {
    return _taskImportanceInsertionAdapter.insertAndReturnId(
        taskImportance, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateImportance(TaskImportance taskImportance) async {
    await _taskImportanceUpdateAdapter.update(
        taskImportance, OnConflictStrategy.abort);
  }
}
