import 'package:dio/dio.dart';
import 'package:locus_application/constants/api_base_url.dart';
import 'package:locus_application/features/explore_news/data/models/model1.dart';

class NewsService {
  var dio = Dio();

  Future<List<NewsModel>> getNews() async {
    Response response = await dio.get(
      newsUrl,
    );
    print(response);
    List<dynamic> news = response.data['results'];

    List<NewsModel> newsList = [];
    for (var news in news) {
      NewsModel newsModel = NewsModel(
          image: news['image_url'], title: news['title'], url: news['url']);
      newsList.add(newsModel);
    }

    return newsList;
    // if (response.statusCode == 200) {
    //   return newsList;
    // } else {
    //   throw Exception('Failed to load news');
    // }
  }
}
