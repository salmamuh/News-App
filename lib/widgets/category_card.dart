import 'package:flutter/material.dart';
import 'package:newsapp/models/category_model.dart';
import 'package:newsapp/views/category_view.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,required this.category
  });
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context){
          return CategoryView(
            category:category.categoryName ,
          );
        }));
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Container(
          height: 90,
          width: 150,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill, image: AssetImage(category.image)),
              borderRadius: BorderRadius.circular(16)),
          child: Center(
              child: Text(
            category.categoryName,
            style: TextStyle(
              color: Colors.white,fontSize: 18, fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }
}
