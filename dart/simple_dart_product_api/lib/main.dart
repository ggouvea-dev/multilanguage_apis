import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:simple_dart_product_api/src/controller/product_controller.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() async {
  sqfliteFfiInit();

  final api = Router();

  api.mount('/products/', ProductController().router);

  await serve(api, '127.0.0.1', 8081);
  print('Server running on port 8081');
}
