import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_grid_item.dart';

// 카테고리 화면
class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  // 카테고리가 선택되었을 때의 처리
  void _selectCategory(BuildContext context, Category category) {
    // 매개변수로 받은 카테고리의 id를 이용하여 filteredMeals 리스트를 생성
    final filteredMeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    // Navigator.of를 사용하여 화면을 해당 카테고리의 메뉴 화면으로 이동
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredMeals,
        ),
      ),
    ); // Navigator.push(context, route)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick your category'),
      ),
      // 그리드 형태의 레이아웃을 사용하여 카테고리 아이템을 표시
      body: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          // avaliableCategories.map((category) => CategoryGridItem(category: category)).toList(),
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              // 카테고리가 선택되었을 때의 처리
              onSelectedCategory: () {
                _selectCategory(context, category);
              },
            ),
        ],
      ),
    );
  }
}
