import 'package:flutter/material.dart';
import 'package:locus_application/constants/colors.dart';
import 'package:locus_application/constants/styles.dart';
import 'package:locus_application/features/explore_news/data/models/model1.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({
    super.key,
    required this.newsModel,
  });
  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: InkWell(
        onTap: () {},
        child: Container(
          alignment: Alignment.centerLeft,
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: LocusColors.primaryColor1.withOpacity(0.8), width: 5),
            image: DecorationImage(
              image: NetworkImage(newsModel.image),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 8),
            child: Text(
              newsModel.title,
              textAlign: TextAlign.center,
              style: Style().popDays
            ),
          ),
        ),
      ),
    );
  }
}
