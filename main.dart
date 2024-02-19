import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lec03/book_details.dart';

void main() => runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => MyApp(), // Wrap your entire app with MyApp
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Leceros 03"),
        ),
        body: Books(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  print("click text Button");
                },
                child: Icon(Icons.home)),
            IconButton(
                onPressed: () {
                  print("click icon Button");
                },
                icon: Icon(Icons.favorite)),
            Container(
              color: Colors.red,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.resolveWith((states) => Colors.red),
                ),
                onPressed: () {
                  print("Click ElevatedButton");
                },
                child: const Icon(Icons.brightness_low),
              ),
            ),
            Container(
              child: OutlinedButton(
                  onPressed: () {
                    print("Click OutlineButton");
                  },
                  child: const Text("Click Here")),
            ),
          ],
        ),
        // child: Image.asset("assets/3.jpg"),
        // image: NetworkImage(
        //     "https://th.bing.com/th/id/OIP.QCBSDDPKNoYS7GD1KmdAwAHaGQ?w=201&h=180&c=7&r=0&o=5&pid=1.7"),
      ),
    );
  }
}

/*
buttontype - iconButton / TextButton / ElevatedButton  / OutlineButton
style: ButtonStyle(backgroundColor: mater.....resowith((state) => colors.red))
*/

class TextWigets extends StatelessWidget {
  const TextWigets({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 200,
      margin: EdgeInsets.all(40),
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 173, 157, 7),
        border: Border.all(
          color: Color.fromARGB(255, 247, 39, 39),
          width: 5,
        ),
      ),
      child: const Text(
        "Hello Wold!",
        style:
            TextStyle(fontSize: 50, color: Color.fromARGB(255, 255, 255, 255)),
      ),
    );
  }
}
/*
style: textStyle=> font size, 
ontainer => padding / margine / decoration -> color, border
*/

class rowcolum extends StatelessWidget {
  const rowcolum({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          "Hellow wold!!!",
          style: TextStyle(backgroundColor: Colors.red),
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text("Click here"),
        ),
        Container(
          child: Text("input data"),
          color: Colors.amber,
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "Hellow wold!!!",
                style: TextStyle(backgroundColor: Colors.red),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("Click here"),
              ),
              Container(
                child: Text("input data"),
                color: Colors.amber,
              ),
            ],
          ),
        )
      ],
    );
  }
}

class task02 extends StatelessWidget {
  const task02({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Image.asset("assets/3.jpg"),
        ),
        const Expanded(
          flex: 1,
          child: Text("nothing"),
        ),
        const Expanded(
          flex: 1,
          child: Text("data"),
        ),
      ],
    );
  }
}
/* over flow desplay =>
  Expaned(
    flex:
    child:
  )
*/

class Books extends StatefulWidget {
  const Books({super.key});

  @override
  State<Books> createState() => _BooksState();
}

List<BookDetails> book = [
  BookDetails(title: "ABOUT THE SAUL", auther: "JONE DE"),
  BookDetails(title: "THE FORZEN", auther: "KAMAL HAAN"),
  BookDetails(title: "THE LYBRARYL", auther: "SHAN DEVIL"),
  BookDetails(title: "ABOUT THE SAUL", auther: "JONE DE"),
  BookDetails(title: "ABOUT THE SAUL", auther: "JONE DE"),
  BookDetails(title: "ABOUT THE SAUL", auther: "JONE DE"),
  BookDetails(title: "THE FORZEN", auther: "KAMAL HAAN"),
  BookDetails(title: "THE LYBRARYL", auther: "SHAN DEVIL"),
  BookDetails(title: "ABOUT THE SAUL", auther: "JONE DE"),
  BookDetails(title: "ABOUT THE SAUL", auther: "JONE DE"),
  BookDetails(title: "ABOUT THE SAUL", auther: "JONE DE"),
  BookDetails(title: "THE FORZEN", auther: "KAMAL HAAN"),
  BookDetails(title: "THE LYBRARYL", auther: "SHAN DEVIL"),
  BookDetails(title: "ABOUT THE SAUL", auther: "JONE DE"),
  BookDetails(title: "ABOUT THE SAUL", auther: "JONE DE"),
  BookDetails(title: "ABOUT THE SAUL", auther: "JONE DE"),
  BookDetails(title: "THE FORZEN", auther: "KAMAL HAAN"),
  BookDetails(title: "THE LYBRARYL", auther: "SHAN DEVIL"),
  BookDetails(title: "ABOUT THE SAUL", auther: "JONE DE"),
  BookDetails(title: "ABOUT THE SAUL", auther: "JONE DE"),
];

class _BooksState extends State<Books> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: book.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(book[index].title),
                leading: const Icon(Icons.delete),
                trailing: Text(book[index].auther),
              );
            },
          ),
        ),
      ],
    );
  }
}

/*
ListView.builder(iteamCount: , iteamBuilder: ,){ 
ListTile(
  title: text(),
  leading: icon(),
  trailing: icon(),
)
}
*/
