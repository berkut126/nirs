import 'package:flutter/material.dart';
import 'package:nirs/slide.dart';
import 'package:optional/optional.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Методика анализа исходного кода для мобильной ОС Аврора',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _MyHomePageState();

  SlideHolder holder = SlideHolder([
    Slide(
        'Методика анализа исходного кода для мобильной ОС Аврора',
        """Актуальность: ОС Аврора стала коммерчески доступной.
• Новизна: разработчик ОС Аврора не имеет документации о безопасной разработке.
• Цель: построение методики анализа ПО для мобильной ОС Аврора .
• Объект и предмет: доступные на рынке анализаторы для кода и их применимость для мобильной ОС Аврора
• Задачей исследования является построение методики статического и динамического анализа исходного кода приложений для мобильной ОС Аврора.""",
        null),
    Slide(
        'Архитектура',
        """
• Целевые архитектуры сборок для авроры – i486 и armhf
• ОС основана на Sailfish, MeeGo, Mer
• Графическая подсистема реализована через Wayland
• Основной фреймворк работы с графическим интерфейсом – Qt""",
        null),
    Slide(
        'SDK: языки программирования',
        """Qt:
– Сборка: qmake/cmake
– Код: С/С++
– UI – QML
Flutter:
– Сборка: CLI flutter
– Код: Dart
Kotlin multiplatform:
– Сборка: CLI
– Код: Kotlin/JS""",
        null),
    Slide('Статичекий анализ кода', '',
        const Image(image: AssetImage('assets/sast.png'))),
    Slide('Sonar', '', const Image(image: AssetImage('assets/sonar.png'))),
    Slide('PVS Studio', '', const Image(image: AssetImage('assets/pvs.png'))),
    Slide(
        'Динамический анализ кода',
        """Анализ программного обеспечения,
производящийся при помощи выполнения программ
на реальном или виртуальном процессоре
• Часто применяется QEMU + GDB
• Для полносистемного динамического анализа могут
применяться трассы, например, Tral""",
        null),
    Slide('Особенность SDK', '',
        const Image(image: AssetImage('assets/sdk.png'))),
    Slide(
        'Компоненты',
        """ Gitlab – хранение кода, запуск CI/CD
• SDK Авроры
• Sonar – статический анализ кода
• Trivy – анализ артефактов
• Virtualbox – среда запуска для динамического
анализа
• Renode – динамический анализ""",
        null),
    Slide('Pipeline', '', const Image(image: AssetImage('assets/pipeline.png')))
  ]);

  String _title = 'Методика анализа исходного кода для мобильной ОС Аврора';
  String _body = """Актуальность: ОС Аврора стала коммерчески доступной.
• Новизна: разработчик ОС Аврора не имеет документации о безопасной разработке.
• Цель: построение методики анализа ПО для мобильной ОС Аврора .
• Объект и предмет: доступные на рынке анализаторы для кода и их применимость для мобильной ОС Аврора
• Задачей исследования является построение методики статического и динамического анализа исходного кода приложений для мобильной ОС Аврора.""";
  Optional _image = const Optional.empty();
  int _counter = 0;

  void _nextSlide() {
    if (_counter < holder.slides.length - 1) {
      _counter++;
      updateView();
    }
  }

  void _previousSlide() {
    if (_counter > 0) {
      _counter--;
      updateView();
    }
  }

  void updateView() {
    setState(() {
      _title = holder.slides[_counter].title;
      _body = holder.slides[_counter].text;
      _image = Optional.ofNullable(holder.slides[_counter].picture);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(_title),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _body,
              style: const TextStyle(fontSize: 20),
            ),
            _image.orElse(Container())
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_left),
            label: 'Предыдущий',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.arrow_right), label: 'Следующий')
        ],
        onTap: (int index) {
          switch (index) {
            case 0:
              _previousSlide();
            case 1:
              _nextSlide();
          }
        },
      ),
    );
  }
}
