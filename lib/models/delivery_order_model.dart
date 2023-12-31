class DeliveryOrderModel {
  final String orderId;
  final String price;
  final String datetime;
  final String fromLocation;
  final String toLocation;
  final String distance;
  final bool paid;
  final bool schedule;
  final bool active;
  final bool history;
  final bool details;
  final bool special;

  DeliveryOrderModel(
      {required this.datetime,
      required this.distance,
      required this.fromLocation,
      required this.orderId,
      required this.paid,
      required this.price,
      required this.toLocation,
      required this.schedule,
      required this.active,
      required this.history,
      required this.details,
      required this.special});
}

List<DeliveryOrderModel> newScheduleOrders = [
  DeliveryOrderModel(
      datetime: 'JUN 10 2023 11:00am',
      distance: '10.342 km',
      fromLocation: '36 Adeola Adeleye St, ....',
      orderId: 'DL-5679-435EX',
      paid: false,
      price: 'N5,600',
      toLocation: '213 Ikorodu-Ososun R...',
      schedule: true,
      active: false,
      history: false,
      details: false,
      special: true),
  DeliveryOrderModel(
      datetime: 'JUN 10 2023 11:00am',
      distance: '10.342 km',
      fromLocation: '36 Adeola Adeleye St, ....',
      orderId: 'DL-5679-435EX',
      paid: false,
      price: 'N5,600',
      toLocation: '213 Ikorodu-Ososun R...',
      schedule: true,
      active: false,
      history: false,
      details: false,
      special: false),
  DeliveryOrderModel(
      datetime: 'JUN 10 2023 11:00am',
      distance: '10.342 km',
      fromLocation: '36 Adeola Adeleye St, ....',
      orderId: 'DL-5679-435EX',
      paid: false,
      price: 'N5,600',
      toLocation: '213 Ikorodu-Ososun R...',
      schedule: true,
      active: false,
      history: false,
      details: false,
      special: true),
];

List<DeliveryOrderModel> newExpressOrders = [
  DeliveryOrderModel(
      datetime: 'Mon Jun 2 2023 12:38:37 ',
      distance: '10.342 km',
      fromLocation: '36 Adeola Adeleye St, ....',
      orderId: 'DL-5679-435EX',
      paid: false,
      price: 'N5,600',
      toLocation: '213 Ikorodu-Ososun R...',
      schedule: false,
      active: false,
      history: false,
      details: false,
      special: false),
  DeliveryOrderModel(
      datetime: 'Mon Jun 2 2023 12:38:37 ',
      distance: '10.342 km',
      fromLocation: '36 Adeola Adeleye St, ....',
      orderId: 'DL-5679-435EX',
      paid: true,
      price: 'N5,600',
      toLocation: '213 Ikorodu-Ososun R...',
      schedule: false,
      active: false,
      history: false,
      details: false,
      special: true),
  DeliveryOrderModel(
      datetime: 'Mon Jun 2 2023 12:38:37 ',
      distance: '10.342 km',
      fromLocation: '36 Adeola Adeleye St, ....',
      orderId: 'DL-5679-435EX',
      paid: true,
      price: 'N5,600',
      toLocation: '213 Ikorodu-Ososun R...',
      schedule: false,
      active: false,
      history: false,
      details: false,
      special: false),
];

List<DeliveryOrderModel> activeScheduleOrders = [
  DeliveryOrderModel(
      datetime: 'JUN 10 2023 11:00am',
      distance: '10.342 km',
      fromLocation: '36 Adeola Adeleye St, ....',
      orderId: 'DL-5679-435EX',
      paid: false,
      price: 'N5,600',
      toLocation: '213 Ikorodu-Ososun R...',
      schedule: true,
      active: true,
      history: false,
      details: false,
      special: true),
  DeliveryOrderModel(
      datetime: 'JUN 10 2023 11:00am',
      distance: '10.342 km',
      fromLocation: '36 Adeola Adeleye St, ....',
      orderId: 'DL-5679-435EX',
      paid: true,
      price: 'N5,600',
      toLocation: '213 Ikorodu-Ososun R...',
      schedule: true,
      active: true,
      history: false,
      details: false,
      special: false),
  DeliveryOrderModel(
      datetime: 'JUN 10 2023 11:00am',
      distance: '10.342 km',
      fromLocation: '36 Adeola Adeleye St, ....',
      orderId: 'DL-5679-435EX',
      paid: true,
      price: 'N5,600',
      toLocation: '213 Ikorodu-Ososun R...',
      schedule: true,
      active: true,
      history: false,
      details: false,
      special: false),
];

List<DeliveryOrderModel> activeExpressOrders = [
  DeliveryOrderModel(
      datetime: 'Mon Jun 2 2023 12:38:37 ',
      distance: '10.342 km',
      fromLocation: '36 Adeola Adeleye St, ....',
      orderId: 'DL-5679-435EX',
      paid: false,
      price: 'N5,600',
      toLocation: '213 Ikorodu-Ososun R...',
      schedule: false,
      active: true,
      history: false,
      details: false,
      special: true),
  DeliveryOrderModel(
      datetime: 'Mon Jun 2 2023 12:38:37 ',
      distance: '10.342 km',
      fromLocation: '36 Adeola Adeleye St, ....',
      orderId: 'DL-5679-435EX',
      paid: true,
      price: 'N5,600',
      toLocation: '213 Ikorodu-Ososun R...',
      schedule: false,
      active: true,
      history: false,
      details: false,
      special: false),
  DeliveryOrderModel(
      datetime: 'Mon Jun 2 2023 12:38:37 ',
      distance: '10.342 km',
      fromLocation: '36 Adeola Adeleye St, ....',
      orderId: 'DL-5679-435EX',
      paid: true,
      price: 'N5,600',
      toLocation: '213 Ikorodu-Ososun R...',
      schedule: false,
      active: true,
      history: false,
      details: false,
      special: true),
];

List<DeliveryOrderModel> historyScheduleOrders = [
  DeliveryOrderModel(
      datetime: 'JUN 10 2023 11:00am',
      distance: '10.342 km',
      fromLocation: '36 Adeola Adeleye St, Ilupeju, Lagos....',
      orderId: 'DL-5679-435EX',
      paid: true,
      price: 'N5,600',
      toLocation: '213 Ikorodu-Ososun Rd, Ejigbo, Lag.....',
      schedule: true,
      active: true,
      history: true,
      details: false,
      special: false),
  DeliveryOrderModel(
      datetime: 'JUN 10 2023 11:00am',
      distance: '10.342 km',
      fromLocation: '36 Adeola Adeleye St, Ilupeju, Lagos....',
      orderId: 'DL-5679-435EX',
      paid: true,
      price: 'N5,600',
      toLocation: '213 Ikorodu-Ososun Rd, Ejigbo, Lag.....',
      schedule: true,
      active: true,
      history: true,
      details: false,
      special: true),
  DeliveryOrderModel(
      datetime: 'JUN 10 2023 11:00am',
      distance: '10.342 km',
      fromLocation: '36 Adeola Adeleye St, Ilupeju, Lagos....',
      orderId: 'DL-5679-435EX',
      paid: true,
      price: 'N5,600',
      toLocation: '213 Ikorodu-Ososun Rd, Ejigbo, Lag.....',
      schedule: true,
      active: true,
      history: true,
      details: false,
      special: false),
];

List<DeliveryOrderModel> historyExpressOrders = [
  DeliveryOrderModel(
      datetime: 'Mon Jun 2 2023 12:38:37 ',
      distance: '10.342 km',
      fromLocation: '36 Adeola Adeleye St, Ilupeju, Lagos....',
      orderId: 'DL-5679-435EX',
      paid: true,
      price: 'N5,600',
      toLocation: '213 Ikorodu-Ososun Rd, Ejigbo, Lag.....',
      schedule: false,
      active: true,
      history: true,
      details: false,
      special: true),
  DeliveryOrderModel(
      datetime: 'Mon Jun 2 2023 12:38:37 ',
      distance: '10.342 km',
      fromLocation: '36 Adeola Adeleye St, Ilupeju, Lagos....',
      orderId: 'DL-5679-435EX',
      paid: true,
      price: 'N5,600',
      toLocation: '213 Ikorodu-Ososun Rd, Ejigbo, Lag.....',
      schedule: false,
      active: true,
      history: true,
      details: false,
      special: false),
  DeliveryOrderModel(
      datetime: 'Mon Jun 2 2023 12:38:37 ',
      distance: '10.342 km',
      fromLocation: '36 Adeola Adeleye St, Ilupeju, Lagos....',
      orderId: 'DL-5679-435EX',
      paid: true,
      price: 'N5,600',
      toLocation: '213 Ikorodu-Ososun Rd, Ejigbo, Lag.....',
      schedule: false,
      active: true,
      history: true,
      details: false,
      special: true),
];
