class OrderModel {
  final String orderId;
  final double distance;
  final String status;

  OrderModel(
      {required this.orderId, required this.distance, required this.status});

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
        orderId: json['orderId'],
        distance: json['distance'],
        status: json['status']);
  }
}

//DemoData:
List<Map<String, dynamic>> activeDelivery = [
  {'orderId': 'DL-5679-435EX', 'distance': 10.342, 'status': 'active'},
  {'orderId': 'DL-5681-435EX', 'distance': 0.567, 'status': 'active'},
  {'orderId': 'DL-5659-435EX', 'distance': 20.45, 'status': 'active'},
  {'orderId': 'DL-5639-435EX', 'distance': 7.45, 'status': 'active'},
  {'orderId': 'DL-5639-435EX', 'distance': 7.45, 'status': 'active'},
  {'orderId': 'DL-5639-435EX', 'distance': 7.45, 'status': 'active'},
  {'orderId': 'DL-5639-435EX', 'distance': 7.45, 'status': 'active'},
  {'orderId': 'DL-5639-435EX', 'distance': 7.45, 'status': 'active'},
];

List<Map<String, dynamic>> newDelivery = [
  {'orderId': 'DL-5680-435EX', 'distance': 9.2, 'status': 'new'},
  {'orderId': 'DL-5668-435EX', 'distance': 8.546, 'status': 'new'},
  {'orderId': 'DL-5639-435EX', 'distance': 4.24, 'status': 'new'},
  {'orderId': 'DL-5639-435EX', 'distance': 4.24, 'status': 'new'},
  {'orderId': 'DL-5639-435EX', 'distance': 4.24, 'status': 'new'},
  {'orderId': 'DL-5639-435EX', 'distance': 4.24, 'status': 'new'},
  {'orderId': 'DL-5639-435EX', 'distance': 4.24, 'status': 'new'},
];
