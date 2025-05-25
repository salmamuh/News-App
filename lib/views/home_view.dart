import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/models/article_model.dart';
import 'package:newsapp/services/news_service.dart';
import 'package:newsapp/widgets/categories_list_view.dart';
import 'package:newsapp/widgets/category_card.dart';
import 'package:newsapp/widgets/news_list_view.dart';
import 'package:newsapp/widgets/news_list_view_builder.dart';
import 'package:newsapp/widgets/news_tile.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Row(mainAxisSize: MainAxisSize.min, children: [
            Text(
              "News",
              style: TextStyle(color: Colors.black),
            ),
            Text(
              "Cloud",
              style: TextStyle(color: Colors.orange),
            ),
          ]),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: CategoriesListView()),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                ),
              ),
              NewsListViewBuilder(category: 'general',)
              
            ],
          ),
          // child: Column(
          //   children:
          //   [
          //    CategoriesListView(),
          //    ,
          //     Expanded(child: NewsListView()),
          //   ]
          // ),
        ));
  }
}







// ListView(
//         scrollDirection: Axis.vertical,
//         children: [
//           ListView(
//             scrollDirection: Axis.horizontal,
//             children: [
//               Stack(
//                 children: [
//                   SizedBox(
//                 width: 200, // Adjust width according to your image size
//                 height: 150, // Adjust height according to your image size
//                 child: Image.asset("assets/business.avif", fit: BoxFit.cover),
//               ),
//                   Text("Bussiness")
//                 ],
//               )
//             ],
//           )
//         ],
//       ),