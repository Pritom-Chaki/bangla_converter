

> The Bangla Converter Flutter package seamlessly converts numbers between Bangla and English, helping developers build localized, globally adaptable apps with better numeric communication.

[![Package Version](https://img.shields.io/pub/v/bangla_converter?color=teal&style=plastic)](https://pub.dev/packages/bangla_converter "Published package version")
[![LICENSE](https://img.shields.io/badge/License-MIT-red.svg?style=plastic)](https://github.com/Pritom-Chaki/bangla_converter/blob/main/LICENSE "Project's LICENSE")
[![Last Commit](https://img.shields.io/github/last-commit/Pritom-Chaki/bangla_converter.svg?logo=github&style=plastic)](https://github.com/Pritom-Chaki/bangla_converter)


# **Bangla Converter**

The 'Bangla Converter' Flutter package transforms numbers seamlessly between Bangla and English, aiding developers in creating globally adaptable applications, improving numeric communication in various contexts, supporting localization efforts, and serving as an educational reference for implementing similar functionalities.


## **Features**

- Convert Bangla numeric to English numeric.
- Convert English numeric to Bangla numeric.
- Ignore other character(s) with the Number.
- Support all kind of Data Types.
- Suitable for all types of flutter applications.
- Bangla Date convert From English Date.
- English Date convert From Bangla Date.


## **Installation**

To use the 'Bangla Converter' Flutter package, follow these steps:

1. Add the following line to the dependencies section in your project's **`pubspec.yaml`** file:

```yaml
flutter pub add bangla_converter
```

2. Import the package in your Dart code:

```dart
import 'package:bangla_converter/bangla_converter.dart';
```

## **Usage**

### **Bangla to English**
To convert Bangla to English, use the **`BanglaConverter.banToEng(number)`** method

### **English to Bangla**
To convert English to Bangla, use the **`BanglaConverter.engToBan(number)`** method

### **English Date to Bangla Date**
To convert English Date to Bangla Date, use the **`BanglaConverter.banglaDate(englishDate: DateTime.parse("2023-02-01"))`** method

### **Bangla Date to English Date**
To convert Bangla Date to English Date, use the **`BanglaConverter.englishDate(banglaDay: 1, banglaMonth: 1, banglaYear: 1432)`** method

```dart
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
```
## **Example Render UI**
<img src="https://raw.githubusercontent.com/Pritom-Chaki/bangla_converter/main/example/images/example_ss.png?raw=true">

[![Contact Me](https://www.pritom.me/assets/contact_me.gif?raw=true)](https://www.pritom.me/contact?source=pubget)

## **Demo**

For a complete example app, see the [example directory](https://github.com/Pritom-Chaki/bangla_converter/tree/main/example).


## **Help**

Found a bug? [Report it here.](https://github.com/Pritom-Chaki/bangla_converter/issues/new?assignees=&labels=&template=bug_report.md&title=)
Have a feature request? [Request it here.](https://github.com/Pritom-Chaki/bangla_converter/issues/new?assignees=&labels=&template=feature_request.md&title=)

## **Changelog**

See [CHANGELOG.md](CHANGELOG.md) for detailed version history.

## **Contributions**

Contributions are welcome! If you encounter any issues or have suggestions for improvements, please feel free to open an issue or submit a pull request.


## **License**

Released under the [MIT License](LICENSE).
