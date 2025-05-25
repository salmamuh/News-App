import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/models/article_model.dart';
import 'package:newsapp/services/news_service.dart';
import 'package:newsapp/widgets/news_list_view.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({
    super.key,required this.category,
  });
final String category;
  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}


class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  var future;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    future=NewsService(Dio()).getNews(category: widget.category);

  }
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
        future:future ,
        builder: (context, snapshot) {
          if(snapshot.hasData){
          return NewsListView(
            articles: snapshot.data!,
          );}
          else if(snapshot.hasError){
            return  SliverToBoxAdapter(child: ErrorMessage(errorMessage:"Oops, Try later"),);
          }else{
                return SliverToBoxAdapter(child:
                Container(height: MediaQuery.of(context).size.height,alignment:Alignment.center,child: CircularProgressIndicator())
                );

            }


        });
    // return isLooding? SliverToBoxAdapter(child:
    // Container(height: MediaQuery.of(context).size.height,alignment:Alignment.center,child: CircularProgressIndicator())):
    // articles.isNotEmpty?NewsListView(articles: articles,):
    //     SliverToBoxAdapter(child: Text("oops"),)
    // ;
  }
}

class ErrorMessage extends StatelessWidget {

   ErrorMessage({
    super.key,required this.errorMessage,
  });
  String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Text(errorMessage);
  }
}
