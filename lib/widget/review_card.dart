import 'package:flutter/material.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/data/model/restaurant_detail_model.dart';

class ReviewCard extends StatelessWidget {
  final CustomerReview customerReview;

  const ReviewCard({
    super.key,
    required this.customerReview,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
        bottom: 10,
      ),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: cardReviewColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  customerReview.name,
                  style: customStyleText.copyWith(
                    color: reviewerColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                customerReview.date,
                style: customStyleText,
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            customerReview.review,
            textAlign: TextAlign.justify,
            style: customStyleText,
          ),
        ],
      ),
    );
  }
}
