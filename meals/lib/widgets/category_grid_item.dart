import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    super.key,
    required this.category,
    required this.onSelectedCategory,
  });

  final Category category;
  final void Function() onSelectedCategory;

  @override
  Widget build(BuildContext context) {
    // 콘테이너는 일반적으로 배경색 또는 배경 장식을
    // 설정할 수 있는 많은 옵션을 제공합니다.
    // InkWell은 터치 이벤트를 처리할 수 있는 위젯입니다.
    return InkWell(
      // onTap은 위젯이 터치되었을 때 호출되는 콜백입니다.
      onTap: onSelectedCategory,
      // splashColor는 터치 이벤트가 발생했을 때 표시되는 색상을 설정합니다.
      splashColor: Theme.of(context).primaryColor,
      // borderRadius는 콘테이너의 모서리를 둥글게 만듭니다.
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.55),
              category.color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          category.title,
          // !를 정의함으로서 titleLarge가 null이 아님을 보장합니다.
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
    );
  }
}
