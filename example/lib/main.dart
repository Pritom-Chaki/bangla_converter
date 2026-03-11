import 'package:flutter/material.dart';
import 'package:bangla_converter/bangla_converter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bangla Converter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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
  int _counter = 0;
  String banglaPhoneNumber = "০১৭৩৩-৪৫২XXX";
  String englishPhoneNumber = "01733-452XXX";
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Flutter Bangla Converter Page'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _digitConvert(),
              SizedBox(height: 30),
              _dateConvert(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  Column _digitConvert() {
    return Column(
      children: [
        const Text(
          'Bangla To English Converter',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text("Input: $banglaPhoneNumber"),
        Text("Output:  ${BanglaConverter.banToEng(banglaPhoneNumber)}"),
        const SizedBox(height: 10),
        const Text(
          'English To Bangla Converter',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text("Input: $englishPhoneNumber"),
        Text("Output:  ${BanglaConverter.engToBan(englishPhoneNumber)}"),
        const SizedBox(height: 10),
        const Text(
          'You have pushed the button this\nmany times in Bangla Language:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          BanglaConverter.engToBan('$_counter'),
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ],
    );
  }

  Column _dateConvert() {
    BanglaDateReturn? banglaToDate = BanglaConverter.banglaDate(isToday: true);
    BanglaDateReturn? banglaDateByDate = BanglaConverter.banglaDate(
      englishDate: DateTime.parse("2023-02-01"),
    );
    BanglaDateReturn? banglaDateByValue = BanglaConverter.banglaDate(
      day: 14,
      month: 4,
      year: 2024,
    );
    return Column(
      children: [
        const Text(
          'English Date Convert to Bangla',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        const Text(
          'Bangla Date for TODAY \n EX: BanglaConverter.banglaDate(isToday: true)',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          '${banglaToDate!.date} ${banglaToDate.month} ${banglaToDate.year} বঙ্গাব্দ, ${banglaToDate.weekDay}',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(height: 15),
        const Text(
          'Bangla Date by Date variable \n EX: BanglaConverter.banglaDate(englishDate: DateTime.parse("2023-02-01"))',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          '${banglaDateByDate!.date} ${banglaDateByDate.month} ${banglaDateByDate.year} বঙ্গাব্দ, ${banglaDateByDate.weekDay}',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(height: 15),
        const Text(
          'Bangla Date by Date, Month, Year \n EX: BanglaConverter.banglaDate(day: 14, month: 4, year: 2024)',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          '${banglaDateByValue!.date} ${banglaDateByValue.month} ${banglaDateByValue.year} বঙ্গাব্দ, ${banglaDateByValue.weekDay}',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(height: 15),
        const Text(
          'English Date by Bangla Date, Month, Year \n EX: BanglaConverter.englishDate(banglaDay: 1, banglaMonth: 1, banglaYear: 1432)',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          '${BanglaConverter.englishDate(banglaDay: 1, banglaMonth: 1, banglaYear: 1432)}',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ],
    );
  }
}
