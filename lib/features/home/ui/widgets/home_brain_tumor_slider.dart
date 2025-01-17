import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tumer_detection/core/theming/app_colors.dart';

class PatientBrainTumorSlider extends StatelessWidget {
  const PatientBrainTumorSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height:190,
      child: CarouselSlider.builder(
        options: CarouselOptions(
          initialPage: 2,
          autoPlay: true,
          autoPlayCurve: Curves.easeIn,
          enlargeCenterPage: true,
          animateToClosest: true,
          viewportFraction: 0.80,
          autoPlayAnimationDuration: const Duration(milliseconds: 750),
        autoPlayInterval: Duration(milliseconds: 1600),

        ),
        itemCount: _images.length,
        itemBuilder: (context, index, realIndex) {
          return Container(
            decoration: BoxDecoration(
              color: AppColors.defaultColor,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.defaultColor, width: 2),

            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
              width: double.infinity,
                imageUrl: _images[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}

List<String> _images = [
  'https://www.americanoncology.com/static/uploads/747f17b0-5520-4c2d-99f3-d2cc1e307b0c-1715854629302.png',
  'https://www.osmosis.org/_next/image?url=https%3A%2F%2Fd16qt3wv6xm098.cloudfront.net%2F1lIODrO-QdazkNEpmSjFpOysT0GSq27b%2F_.jpg&w=3840&q=75',
  'https://www.osmosis.org/_next/image?url=https%3A%2F%2Fd16qt3wv6xm098.cloudfront.net%2Fv34RyHfDRQeNNq2QMS_f3DAEQKCCM-MR%2F_.jpg&w=3840&q=75',
  'https://api.neohospital.com/uploads/blogs/blog_image-1716789839466-113473216-brain+tumor-1920w.jpg',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsaPawVXzu6XgzX5YTD20LwDac_m1Evi22WSQaUAxFnSy1ioPJfhdeV3EiygyvKdhQ-L4&usqp=CAU',
  'https://www.americanoncology.com/static/uploads/16be6850-89fd-4328-a709-bc956e7d7eca-1709542983781.jpg',
  'https://media.licdn.com/dms/image/D4D12AQGP1X4pMdG7VQ/article-cover_image-shrink_600_2000/0/1668096963907?e=2147483647&v=beta&t=-VMjM4Nzb_owxhFRw2gLkRHoEXtKV2HPM6-qXgb60Yc',
];
