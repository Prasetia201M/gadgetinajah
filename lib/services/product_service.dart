// import 'package:gadgetinajah/controllers/auth_controller.dart';
// import 'package:gadgetinajah/models/product_model.dart';
// import 'package:gadgetinajah/services/api.dart';
// import 'package:http/http.dart' as http;

// class ProductService {

//   Future<ProductModel> getProductByCategory() async {
//     final response = await http.get(Uri.parse('${Api.category}/24'),
//         headers: {'Authorization': 'Bearer ${AuthController.token}'});
//     if (response.statusCode == 200) {
//       return productModelFromJson(response.body);
//     } else {
//       throw Exception('Gagal mendapat data');
//     }
//   }
// }
