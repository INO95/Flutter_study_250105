import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals/screens/tabs.dart';

// 식사 앱
// 멀티 스크린 앱
// favorite 버튼을 추가하고 favorite된 meal을 표시하는 화면
// filter 기능을 추가하고 필터링된 결과를 표시하는 화면 (favorite와는 별개)
// Naviate 기능을 주로 사용함
// pop으로 화면을 제거하려 이전 화면으로 돌아갈 수 있음
// push로 화면을 추가하여 이동할 수 있음 (pushReplacement는 현재 화면을 새로운 화면으로 대체함)
// 스크린 스택 개념을 사용하여 화면의 전이 관리를 이해하여 플러터 앱에서 Navigation이 기능하는 것을 이해함
// BottomNavigationBar를 이용하여 탭을 추가할 수 있는 방법, 선택된 탭을 저장할 수 있는 방법을 배움
// SideDrawer를 이용하여 서랍 기반 네비게이션을 통해 다른 화면으로 이동할 수 있는 방법을 배움
// 화면 이동 시 데이터를 전달하는 방법을 배움

// 그러나 문제점 : onToggleFavorite 함수를 이용해서 데이터의 상태를 관리하고 있지만
// 이 방식은 응용 프로그램이 복잡할 수록 데이터 관리가 어려워질 수 있음
// 이런 문제를 해결하기 위해 riverpod Package를 사용하는 법을 배우자 (앱 내 상태관리)
// 이 패키지는 데이터 관리를 쉽게 해주고 데이터의 변경을 추적할 수 있게 해줌
// provider 처럼 비슷한 패키지도 있지만 riverpod 패키지가 더 나은 선택임
// riverpod은 center provider와 consumer 가 존재하며, center provider에서 데이터를 관리하고 consumer에서는 그 데이터를 사용하는 형태.

// 테마 설정
final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(
    // ProviderScope는 모든 프로바이더를 포함하는 위젯으로서, 모든 프로바이더가 하나의 위젯에 포함되어 있어야 한다.
    const ProviderScope(
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  // 앱 실행
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      // 첫 화면 : 카테고리 화면
      home: const TabsScreen(),
    );
  }
}
