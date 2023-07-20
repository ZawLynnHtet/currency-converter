import 'package:flutter/material.dart';
import 'theme/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required String title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var countryLis = [
    "MMK",
    "USD",
    "EUR",
    "JPY",
    "AUD",
    "GBP",
    "KHR",
    "CNY",
    "HKD",
    "INR",
    "MYR"
  ];

  var firstCountry = "USD";
  var secondCountry = "MMK";
  var result = 2100;
  TextEditingController currencyValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        title: Text(
          "CURRENCY CONVERTER",
          style: TextStyle(
            fontFamily: "oswald",
            color: textWhite,
            letterSpacing: 2,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.currency_exchange,
                size: 30,
                color: Colors.yellow,
              )),
        ],
        backgroundColor: const Color.fromARGB(179, 55, 4, 132),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 50, top: 50),
              child: Image.asset(
                "images/currency.png",
                width: 200,
                height: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                onChanged: (value) {
                  debugPrint(value);
                },
                autofocus: true,
                controller: currencyValue,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontFamily: "owsald",
                ),
                decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    border: InputBorder.none,
                    fillColor: bgWhite,
                    filled: true,
                    labelText: "Convert currency",
                    labelStyle: TextStyle(
                      color: secondaryColor,
                      fontSize: 18,
                      fontFamily: "owsald",
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    // color: Colors.white,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      color: bgWhite,
                    ),
                    child: DropdownButton(
                        isDense: true,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        value: firstCountry,
                        items: countryLis
                            .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(
                                  e,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "owsald",
                                  ),
                                )))
                            .toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            firstCountry = newValue!;
                          });
                        }),
                  ),
                  FloatingActionButton(
                    shape: const CircleBorder(side: BorderSide.none),
                    backgroundColor: secondaryColor,
                    onPressed: () {
                      setState(() {
                        result = int.parse(currencyValue.text) * 2100;
                        print(result);
                        currencyValue.clear();
                      });
                    },
                    child: Icon(
                      Icons.swap_horiz,
                      color: bgWhite,
                    ),
                  ),
                  Container(
                    // color: Colors.white,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      color: bgWhite,
                    ),
                    child: DropdownButton(
                        isDense: true,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        value: secondCountry,
                        items: countryLis
                            .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(
                                  e,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "owsald",
                                  ),
                                )))
                            .toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            secondCountry = newValue!;
                          });
                        }),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.topCenter,
                width: MediaQuery.of(context).size.width,
                height: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: bgWhite,
                ),
                child: Column(
                  children: [
                    const Text(
                      "Result",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: "oswald",
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      result.toString(),
                      textAlign: TextAlign.end,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: "oswald",
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
