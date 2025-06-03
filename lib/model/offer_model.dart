class OfferModel {
  final String serviceType;
  final String apartmentSize;
  final String location;
  final String requestedDate;
  final String arrivalTime;
  final String paymentMethod;
  final String status;
  final String imageUrl;

  OfferModel({
    required this.serviceType,
    required this.apartmentSize,
    required this.location,
    required this.requestedDate,
    required this.arrivalTime,
    required this.paymentMethod,
    required this.status,
    required this.imageUrl,
  });

  // تحويل من Map لـ OfferModel
  factory OfferModel.fromMap(Map<String, dynamic> map) {
    return OfferModel(
      serviceType: map['serviceType'],
      apartmentSize: map['apartmentSize'],
      location: map['location'],
      requestedDate: map['requestedDate'],
      arrivalTime: map['arrivalTime'],
      paymentMethod: map['paymentMethod'],
      status: map['status'],
      imageUrl: map['image'],
    );
  }
}
