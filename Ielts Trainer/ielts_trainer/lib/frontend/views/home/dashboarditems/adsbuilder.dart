import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../backend/services/adscontent_service.dart';
import '../../../../backend/services/adsnavigation_service.dart';
import '../../../utils/const/mycolors.dart';
import '../../home_view.dart';

getAdsBuilder(Size s) {
  AdsContentService adsContentService = AdsContentService();
  return FutureBuilder<List<AdsModel>>(
    future: adsContentService.getAdsContents(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
            height: s.height * 0.3,
            width: s.width * 0.3,
            child: Center(
                child: CircularProgressIndicator(
              color: MyColors.primaryBtnC.withOpacity(0.3),
            )),
          ),
        );
      }
      if (snapshot.hasData) {
        return Opacity(
          opacity: 0.8,
          child: SizedBox(
              height: s.height * 0.4,
              child: CarouselSlider(
                  items: snapshot.data!.map((e) {
                    return GestureDetector(
                      onTap: () {
                        Widget res = AdsNavigtion.getNavigatedRoute(e.linkto);
                        if (res == const HomeView()) {
                        } else {
                          Navigator.push(context,
                              CupertinoPageRoute(builder: (context) => res));
                        }
                      },
                      child: CachedNetworkImage(
                        imageUrl: e.image,
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                  options: CarouselOptions(
                    height: s.height * 0.25,
                    aspectRatio: 0.5,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    scrollDirection: Axis.horizontal,
                  ))),
        );
      }
      return const AnimatedOpacity(
        opacity: 1,
        duration: Duration(seconds: 2),
        child: Icon(Icons.image),
      );
    },
  );
}
