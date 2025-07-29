import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:locus_application/constants/colors.dart';
import 'package:locus_application/constants/styles.dart';
import 'package:locus_application/core/widgets/appbar.dart';
import 'package:locus_application/core/widgets/custom_drawer.dart';
import 'package:locus_application/core/widgets/img_bg.dart';
import 'package:locus_application/features/explore_news/data/models/model1.dart';
import 'package:locus_application/features/explore_news/presentation/logic/news_service.dart';
import 'package:locus_application/features/explore_news/presentation/views/widgets/custom_search_field.dart';
import 'widgets/custom_news_item.dart';

class ExploreView extends StatefulWidget {
  const ExploreView({super.key});

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  List<NewsModel> newsList = [];
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    getNews();
  }

  Future<void> getNews() async {
    newsList = await NewsService().getNews();
    isLoading = false;
    setState(() {
      log(newsList.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();
    return Stack(
      children: <Widget>[
        ImgBG(shadowColor: LocusColors.shadowOfBG),
        Scaffold(
          backgroundColor: Colors.transparent,
          key: scaffoldKey,
          appBar: CustomizedAppBar(sKey: scaffoldKey, isNotification: true),
          drawer: const CustomizedDrawer(),
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(height: 5.h),
                const CustomSearchField(),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Latest News', style: Style().popExtra,),
                  ],
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          itemCount: newsList.length,
                          itemBuilder: (context, index) {
                            return NewsItem(
                              newsModel: newsList[index],
                            );
                          }),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
