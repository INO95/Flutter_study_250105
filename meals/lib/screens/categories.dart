import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

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
    // 일반적으로 대부분의 앱은 기본적으로 Scaffold를 사용합니다.
    return Scaffold(
      // AppBar는 화면 상단에 위치하며, 앱의 이름이나 현재 화면의 제목을 표시합니다.
      appBar: AppBar(
        title: const Text('Pick your category'),
      ),
      // body는 화면의 주요 콘텐츠를 표시합니다.
      body: GridView(
        padding: const EdgeInsets.all(24),
        // GridView는 그리드 형태의 레이아웃을 표시합니다.
        gridDelegate:
            // SliverGridDelegateWithFixedCrossAxisCount는 그리드의 열의 개수를 고정된 값으로 설정합니다.
            const SliverGridDelegateWithFixedCrossAxisCount(
          // crossAxisCount는 그리드의 열의 개수를 설정합니다.
          crossAxisCount: 2,
          // childAspectRatio는 그리드의 아이템의 가로 세로 비율을 설정합니다.
          childAspectRatio: 3 / 2,
          // crossAxisSpacing는 그리드의 열 사이의 간격을 설정합니다.
          crossAxisSpacing: 20,
          // mainAxisSpacing는 그리드의 행 사이의 간격을 설정합니다.
          mainAxisSpacing: 20,
        ),
        children: [
          // avaliableCategories.map((category) => CategoryGridItem(category: category)).toList(),
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onSelectedCategory: () {
                _selectCategory(context, category);
              },
            ),
        ],
      ),
    );
  }
}
