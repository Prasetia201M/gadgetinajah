// import 'dart:convert';

// import 'package:gadgetinajah/controllers/auth_controller.dart';
// import 'package:gadgetinajah/models/wishlist_model.dart';
// import 'package:gadgetinajah/services/api.dart';
// import 'package:http/http.dart' as http;

// class WishlistService {

//   Future<WishlistModel> getFavoriteItem() async {
//     final response = await http.get(Uri.parse(Api.wishlist),
//         headers: {'Authorization': 'Bearer ${AuthController.token}'});
//     if (response.statusCode == 200) {
//       return wishlistModelFromJson(response.body);
//     } else {
//       throw Exception('Gagal mendapat data');
//     }
//   }

//   Future<CreateWishlistModel> addToFavorite(String productId) async {
//     final response = await http.post(Uri.parse(Api.wishlist),
//         headers: {'Authorization': 'Bearer ${AuthController.token}'},
//         body: {'product_id': productId});
//     if (response.statusCode == 200 || response.statusCode == 400) {
//       return CreateWishlistModel.fromJson(jsonDecode(response.body));
//     } else {
//       throw Exception('Gagal mendapat data');
//     }
//   }

//   Future<String> removeFromFavorite(String wishlistId) async {
//     final response = await http.delete(
//         Uri.parse('${Api.wishlist}$wishlistId'),
//         headers: {'Authorization': 'Bearer ${AuthController.token}'});
//     if (response.statusCode == 200) {
//       return 'Success';
//     } else {
//       return 'Gagal';
//     }
//   }
// }
