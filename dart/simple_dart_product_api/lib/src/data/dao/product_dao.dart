import 'package:simple_dart_product_api/src/entity/product.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common/sqlite_api.dart';


class ProductDao {

  Future<List<Product>> findAll() async {
    final db = await _initDb();
    var rows = await db.query('Produto');
    return rows.map((e) => Product.fromJson(e)).toList();
  }

  Future<Database> _initDb() async {
    final db = await databaseFactoryFfi.openDatabase('/Users/gabriel/workspace/ideatip/multilanguage_apis/dart/simple_dart_product_api/foo.db');
    db.isOpen ? print('ok') : print('Error');
    return db;
  }

}