import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals/models/meal.dart';

// braket 안에 있는 정보를 관리하겠다고 선언한다. 이 경우에는 Meal 타입의 리스트를 관리하겠다는 의미.
class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  // 생성자 : 초기 상태를 설정
  FavoriteMealsNotifier() : super([]);

  // 주의 : 메모리 상에서 데이터를 관리하는 것이므로, 데이터를 직접 수정하는 것이 아니라 새로운 데이터를 반환하는 함수를 만들어야 한다.
  bool toggleMealFavoriteStatus(Meal meal) {
    // 이 프로퍼티는 StateNotifier 클래스에서 사용 가능하다.
    // add, remove 등은 사용하면 안된다.
    final mealIsFavorite = state.contains(meal);

    if (mealIsFavorite) {
      // where 함수를 이용해서 이터러블이나 toList를 사용해서 새로운 목록을 반환할 수 있음.
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      // 스프레드 연산자를 이용해서 기존 데이터에 새로운 데이터를 추가할 수 있음.
      state = [...state, meal];
      return true;
    }
  }
}

// 최종적으로 전달할 프로바이더
final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  // 인스턴스를 생성해서 반환한다.
  return FavoriteMealsNotifier();
});
