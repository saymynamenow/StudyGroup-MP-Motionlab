import 'package:motion_week2_sg/models/product_model_api.dart';
import 'package:motion_week2_sg/models/user_model.dart';
import 'package:motion_week2_sg/shared/constanta.dart';

class ProductService {
  Future<Product?> getProducts() async {
    try {
      final response = await dio.get('https://dummyjson.com/products');
      if (response.statusCode == 200) {
        return Product.fromJson(response.data);
      }
      return null;
    } catch (e) {
      return throw Exception(e);
    }
  }

  Future<ProductElement?> getProductById({required int id}) async {
    try {
      final response = await dio.get('https://dummyjson.com/products/$id');
      if (response.statusCode == 200) {
        return ProductElement.fromJson(response.data);
      }
      return null;
    } catch (e) {
      return throw Exception(e);
    }
  }

  Future<List<String>?> fetchCategory() async {
    try {
      final response =
          await dio.get('https://dummyjson.com/products/category-list');
      if (response.statusCode == 200) {
        return List<String>.from(response.data);
      }
      return [];
    } catch (e) {
      throw Exception('Failed to fetch categories: $e');
    }
  }

  Future<Product?> getProductByCategory({required String category}) async {
    try {
      final response =
          await dio.get('https://dummyjson.com/products/category/$category');
      if (response.statusCode == 200) {
        return Product.fromJson(response.data);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<UserModel> userLogin(
      {required String username, required String password}) async {
    try {
      final response = await dio.post('https://dummyjson.com/auth/login',
          data: {'username': username, 'password': password});
      if (response.statusCode == 200 && response.data != null) {
        return UserModel.fromJson(response.data);
      } else {
        throw Exception("Failed Login");
      }
    } catch (e) {
      throw Exception('Username or Password Wrong');
    }
  }
}
