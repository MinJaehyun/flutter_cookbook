import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var appName = 'exam themes';
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        useMaterial3: true,
        // note: M3 기능 및 light 밝기 조정
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          brightness: Brightness.light,
        ),
        // note: text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          displayLarge: const TextStyle(
            fontSize: 72,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: GoogleFonts.oswald(
            fontSize: 30,
            fontStyle: FontStyle.italic,
          ),
          bodyMedium: GoogleFonts.merriweather(),
          displaySmall: GoogleFonts.pacifico(),
        ),
      ),
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              // note: primary 사용하여 컨테이너 색상 설정
              color: Theme.of(context).colorScheme.primary,
              child: Text(
                'Text with a background color',
                // note: copyWith 사용하여 재정의, onPrimary 사용하여 컨테이너 내 text 색상 변경
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
              ),
            ),
            Container(
              child: Theme(
                data: ThemeData(
                  colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
                ),
                child: Center(
                  child: Column(
                    children: [
                      // note: 아래 Text 는 primary 설정 안 됐으므로, pink 지정되는게 아니다
                      // note: 다운로드 한 Oswald 폰트 적용
                      Text('theme data Text', style: TextStyle(fontFamily: 'Oswald')),
                      // note: 위 Theme 내 data 내 ThemeData 설정하면 unique 한 설정을 할 수 있다
                      FloatingActionButton(
                        onPressed: () {},
                        child: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
