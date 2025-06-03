import 'package:dozan/model/offer_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OfferCard extends StatelessWidget {
  final OfferModel offer;

  const OfferCard({super.key, required this.offer});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 14.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: Colors.grey.shade300),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.asset(
              offer.imageUrl,
              width: 302.w,
              height: 90.h,
              fit: BoxFit.cover,
              errorBuilder:
                  (context, error, stackTrace) => Icon(Icons.image, size: 80.w),
            ),
          ),
          Row(
            children: [
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      offer.serviceType,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text("Apartment: ${offer.apartmentSize}"),
                    Text("Location: ${offer.location}"),
                    Text("Date: ${offer.requestedDate}"),
                    Text("Time: ${offer.arrivalTime}"),
                    Text("Payment: ${offer.paymentMethod}"),
                    Text(
                      "Status: ${offer.status}",
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
