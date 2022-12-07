// import 'package:gadgetinajah/controllers/auth_controller.dart';
// import 'package:gadgetinajah/models/transaction_model.dart';
// import 'package:gadgetinajah/services/api.dart';
// import 'package:http/http.dart' as http;

// class TransactionService {
  
//   Future<TransactionModel> getAllTransaction() async {
//     final response = await http.get(Uri.parse(Api.transaksi),
//         headers: {'Authorization': 'Bearer ${AuthController.token}'});
//     if (response.statusCode == 200) {
//       return transactionModelFromJson(response.body);
//     } else {
//       throw Exception('Gagal mendapat data');
//     }
//   }

//   Future<String> createTransactionOrder(String address) async {
//     final response = await http.post(Uri.parse(Api.transaksi),
//         headers: {'Authorization': 'Bearer ${AuthController.token}'},
//         body: {'alamat': address});
//     if (response.statusCode == 200) {
//       return 'Success';
//     } else {
//       return 'Gagal';
//     }
//   }
// }
