import 'package:flutter/material.dart';
import 'package:helpfortrauma/core/constants/color_constants.dart';

class CustomerReviews extends StatelessWidget {
  final List<Testimonial> testimonials = [
    Testimonial(
      quote: "Cum molestias sed quam eos repudiandae repellat! Sunt ex atque tempore eligendi magni vel obcaecati facere. Cupiditate repellat deleniti eos eum atque possimus ducimus quis.",
      authorName: "Jitu Chauhan",
      authorRole: "Front End Developers",
      authorCompanyHandle: "codescandy",
      logoAsset: "assets/images/avatar/avatar-1.jpg",
    ),
    Testimonial(
      quote: "Cum molestias sed quam eos repudiandae repellat! Sunt ex atque tempore eligendi magni vel obcaecati facere. Cupiditate repellat deleniti eos eum atque possimus ducimus quis.",
      authorName: "Sandeep Chauhan",
      authorRole: "Front End Developers",
      authorCompanyHandle: "codescandy",
      logoAsset: "assets/images/avatar/avatar-2.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: defaultPadding * 5, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Customer success stories",
            style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          Text(
            "Create convincing customer success stories to boost sales, build trust with",
            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
          ),
          Text(
            "prospects and increase customer loyalty.",
            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(children: [
              for (var testimonial in testimonials)
                Expanded(flex: 1, child: TestimonialCard(testimonial: testimonial)),
            ],)
          )
        ],
      ),
    );
  }
}

class Testimonial {
  final String quote;
  final String authorName;
  final String authorRole;
  final String authorCompanyHandle;
  final String logoAsset;

  Testimonial({
    required this.quote,
    required this.authorName,
    required this.authorRole,
    required this.authorCompanyHandle,
    required this.logoAsset,
  });
}

class TestimonialCard extends StatelessWidget {
  final Testimonial testimonial;

  TestimonialCard({required this.testimonial});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 0,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Container(
        padding: EdgeInsets.all(16),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Quote Text
              Text(
                '"${testimonial.quote}"',
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              ),
              SizedBox(height: 22),
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(testimonial.logoAsset),
                    radius: 25,
                  ),
                  SizedBox(width: 18.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        testimonial.authorName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 6.0),
                      Text(
                        "${testimonial.authorRole} @${testimonial.authorCompanyHandle}",
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                        ),
                      ),
                    ]
                  )
                ]
              )
            ],
          ),
        ),
      ),
    );
  }
}
