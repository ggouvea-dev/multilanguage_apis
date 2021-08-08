import 'dart:async';
import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:simple_dart_product_api/src/data/dao/product_dao.dart';

part 'product_controller.g.dart';

class ProductController {

  final ProductDao dao = ProductDao();

  Router get router => _$ProductControllerRouter(this);

  @Route.get('/findAll')
  FutureOr<Response> getAll(Request request) async {
    try {
      final products = await dao.findAll();
      if (products.isEmpty) return Response.notFound(jsonEncode('No products found!'));
      return Response.ok(jsonEncode(products));
    } catch (e) {
      print(e);
      return Response.notFound('Error');
    }

  }

}