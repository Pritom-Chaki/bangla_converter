
# **Bangla Converter**

The 'Bangla Converter' Flutter package transforms numbers seamlessly between Bangla and English, aiding developers in creating globally adaptable applications, improving numeric communication in various contexts, supporting localization efforts, and serving as an educational reference for implementing similar functionalities.

## **Features**

- Convert Bangla numeric to English numeric.
- Convert English numeric to Bangla numeric.
- Ignore other character(s) with the Number.
- Support all kind of Data Types.
- Suitable for al type of flutter applications.
- Bangla Date convert From English Date.
- English Date convert From Bangla Date.


## **Installation**

To use the 'Bangla Converter' Flutter package, follow these steps:

1. Add the following line to the dependencies section in your project's **`pubspec.yaml`** file:

```yaml
flutter pub add bangla_convertor
```

2. Import the package in your Dart code:

```dart
import 'package:bangla_convertor/bangla_convertor.dart';
```

## **Usage**

### **Bangla to English**
To Bangla to English, use the **`BanglaConverter.banToEng(number)`** method

### **English to Bangla**
To English to Bangla, use the **`BanglaConverter.engToBan(number)`** method

### **English Date to Bangla Date**
To Bangla Date to Bangla Date, use the **`BanglaConverter.banglaDate(englishDate: DateTime.parse("2023-02-01"))`** method

### **Bangla Date to English Date**
To Bangla Date to English Date, use the **`BanglaConverter.englishDate(banglaDay: "1", banglaMonth: "1" banglaYear: "1432")`** method

```dart
import 'package:bangla_converter/model/bangla_date_return_model.dart';
import 'package:flutter/material.dart';

///import [bangla_converter] package
import 'package:bangla_converter/bangla_converter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bangla Convertor',
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _digitConvert(),
            SizedBox(height: 30),
            _dateConvert(),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
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
    BanglaDateReturn? _banglaToDate = BanglaConverter.banglaDate(isToday: true);
    BanglaDateReturn? _banglaDateByDate = BanglaConverter.banglaDate(
      englishDate: DateTime.parse("2023-02-01"),
    );
    BanglaDateReturn? _banglaDateByValue = BanglaConverter.banglaDate(
      day: "5",
      month: "4",
      year: "2024",
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
          '${_banglaToDate!.date} ${_banglaToDate.month} ${_banglaToDate.year} বঙ্গাব্দ, ${_banglaToDate.weekDay}',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(height: 15),
        const Text(
          'Bangla Date by Date variable \n EX: BanglaConverter.banglaDate(englishDate: DateTime.parse("2023-02-01"))',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          '${_banglaDateByDate!.date} ${_banglaDateByDate.month} ${_banglaDateByDate.year} বঙ্গাব্দ, ${_banglaDateByDate.weekDay}',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(height: 15),
        const Text(
          'Bangla Date by Date, Month, Year \n EX: BanglaConverter.banglaDate(day: "5",month: "4",year: "2024")',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          '${_banglaDateByValue!.date} ${_banglaDateByValue.month} ${_banglaDateByValue.year} বঙ্গাব্দ, ${_banglaDateByValue.weekDay}',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(height: 15),
        const Text(
          'English Date by Bangle Date, Month, Year \n EX: BanglaConverter.englishDate(banglaDay: "1", banglaMonth: "1", banglaYear: "1432")',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          '${BanglaConverter.englishDate(banglaDay: "1", banglaMonth: "1", banglaYear: "1432")}',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ],
    );
  }
}
```
## **Example Render UI**
<img src="https://github.com/Pritom-Chaki/bangla_converter/blob/main/example/images/example_ss.png?raw=true">

## **Contributions**

Contributions are welcome! If you encounter any issues or have suggestions for improvements, please feel free to open an issue or submit a pull request.

## **License**

The 'Bangla Converter' Flutter plugin is released under the **[MIT License](https://github.com/Pritom-Chaki/bangla_converter/blob/main/LICENSE)**.