// import 'package:gadgetinajah/controllers/auth_controller.dart';
// import 'package:gadgetinajah/models/cart_model.dart';
// import 'package:gadgetinajah/services/api.dart';
// import 'package:http/http.dart' as http;

// class CartService {

//   Future<CartModel> getCartItem() async {
//     final response = await http.get(Uri.parse(Api.keranjang),
//         headers: {'Authorization': 'Bearer ${AuthController.token}'});
//     if (response.statusCode == 200) {
//       return cartModelFromJson(response.body);
//     } else {
//       throw Exception('Gagal mendapat data');
//     }
//   }

//   Future<String> addCartItem(String productId, String quantity) async {
//     final response = await http.post(Uri.parse(Api.keranjang),
//         headers: {'Authorization': 'Bearer ${AuthController.token}'},
//         body: {'product_id': productId, 'qty': quantity});
//     if (response.statusCode == 200) {
//       return 'Success';
//     } else {
//       throw Exception('Gagal menambahkan data');
//     }
//   }

//   Future<String> removeCartItem(int cartId) async {
//     final response = await http.delete(
//         Uri.parse('${Api.keranjang}/$cartId'),
//         headers: {'Authorization': 'Bearer ${AuthController.token}'});
//     if (response.statusCode == 200) {
//       return 'Success';
//     } else {
//       throw Exception('Gagal menghapus data');
//     }
//   }
// }
