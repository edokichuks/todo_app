// // Package imports:
// import 'package:dio/dio.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// // Project imports:
// import 'package:frodor_chef/src/core/config/exceptions/app_exceptions.dart';
// import 'package:frodor_chef/src/core/config/response/base_response.dart';
// import 'package:frodor_chef/src/core/services/client/rest_client.dart';
// import 'package:frodor_chef/src/features/orders/models/order_model/order_model.dart';
// import 'package:frodor_chef/src/features/orders/models/update_order_model/update_order_model.dart';

// final class OrderRepository {
//   OrderRepository({required this.restClient});
//   final RestClient restClient;

//   Future<BaseResponse<List<OrderModel>>> allOrders(
//       {required String userId, String? status}) async {
//     try {
//       final r = await restClient.getChefOrder({
//         'chefId': userId,
//         // 'status': status
//       });
//       return r;
//     } on DioException catch (e) {
//       return AppException.handleError(e);
//     }
//   }

//   Future<BaseResponse<OrderModel>> updateOrder({
//     required UpdateOrderModel data,
//     String? orderId,
//   }) async {
//     try {
//       final r = await restClient.updateOrder(data, orderId);
//       return r;
//     } on DioException catch (e) {
//       return AppException.handleError(e);
//     }
//   }

//   Future<BaseResponse<OrderModel>> cancelOrder({
//     String? orderId,
//   }) async {
//     try {
//       final r = await restClient.cancelOrder(orderId);
//       return r;
//     } on DioException catch (e) {
//       return AppException.handleError(e);
//     }
//   }
// }

// final orderRepoProvider = Provider<OrderRepository>((_) {
//   return OrderRepository(
//     restClient: _.read(restClient),
//   );
// });
