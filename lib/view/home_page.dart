import 'package:cryptoapp/model/get_currency_model.dart';
import 'package:cryptoapp/service/get_currency_service.dart';
import 'package:cryptoapp/view/drawer_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController = PageController();

  @override
  void initState() {
    scrollItem();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      
      body: SafeArea(
        child: Column(
          children: [
            // Expanded for AppBar
            Expanded(flex: 3, child: _appbar()),
            const SizedBox(
              height: 20,
            ),
            // Expanded for Portfolio Value
            Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: _portfolio(),
                )),
            // Expanded space between Portfolio & Watchlist
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Text(
                            "Watchlist",
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 3,
                        width: double.infinity,
                        decoration: const BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, -5.0),
                              blurRadius: 5.0)
                        ]),
                      )
                    ],
                  ),
                )),
            Expanded(flex: 4, child: _watchlist()),
          ],
        ),
      ),
    );
  }

  // This is for Appbar Bro :)
  Container _appbar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade700,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
        
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            const CircleAvatar(backgroundImage: AssetImage("assets/tom.jpg"),radius: 30,),
          const Text(
            """Welcome back\nJohn""",
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
            // FOR SCAN & CARD BUTTONS
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                  color: Colors.grey[850],
                  borderRadius: BorderRadius.circular(10)),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add_card,
                    color: Colors.grey,
                  )),
            ),
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                  color: Colors.grey[850],
                  borderRadius: BorderRadius.circular(10)),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.document_scanner,
                    color: Colors.grey,
                  )),
            ),
          ]),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle:
                      TextStyle(color: Colors.grey.shade700, fontSize: 20),
                  filled: true,
                  fillColor: Colors.grey[850],
                  border: InputBorder.none,
                  prefixIcon: const Icon(Icons.search_rounded,
                      color: Colors.grey, size: 30),
                  suffixIcon: InkWell(
                      onTap: () {},
                      child: const Icon(Icons.format_list_bulleted_rounded,
                          color: Colors.grey)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none)),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 5,
            width: 50,
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(50)),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  // This is for Portfolio value
  SizedBox _portfolio() {
    return SizedBox(
        child: FutureBuilder(
      future: GetCurrencyService.getCurrency(),
      builder: (context, AsyncSnapshot snapshot) {
        if (!(snapshot.hasData)) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return PageView.builder(
            controller: pageController,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: const DecorationImage(
                        image: AssetImage("assets/bgcolor2.jpg"),
                        fit: BoxFit.cover)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "Portfolio Value",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white60,
                            fontWeight: FontWeight.w500),
                      ),
                      Text("${snapshot.data[index]['cb_price']} sum",
                          style: const TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.w500)),
                      Text(snapshot.data[index]['title'],
                          style: const TextStyle(
                              fontSize: 18,
                              color: Colors.amber,
                              fontWeight: FontWeight.w600))
                    ],
                  ),
                ),
              );
            },
            itemCount: (snapshot.data as List).length,
          );
        }
      },
    ));
  }

  // This is for WatchList
  SizedBox _watchlist() {
    return SizedBox(
      child: FutureBuilder(
        future: GetCurrencyService.getCurrency(),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/error.jpg"),
                      fit: BoxFit.cover)),
            );
          } else {
            return ListView.builder(
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Container(
                        width: double.infinity,
                        height: 70,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade900,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(),
                          child: ListTile(
                              trailing: Text(
                                "${snapshot.data[index]['cb_price']} sum",
                                style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.white54,
                                    fontWeight: FontWeight.w600),
                              ),
                              subtitle: Text(
                                "Date: ${snapshot.data[index]['date']}",
                                style: const TextStyle(
                                    color: Colors.amber,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15),
                              ),
                              title: Text("${snapshot.data[index]['title']}",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18)),
                              leading: Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    image: const DecorationImage(
                                        image: AssetImage('assets/lead.jpg'),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                    child: Text(snapshot.data[index]['code'],
                                        style: const TextStyle(
                                            fontSize: 20,
                                            color: Colors.amber,
                                            fontWeight: FontWeight.w800))),
                              )),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                );
              },
              itemCount: snapshot.data!.length,
            );
          }
        },
      ),
    );
  }

  void scrollItem() async {
    for (var i = 0; i < 1; i) {
      await Future.delayed(const Duration(seconds: 3));
      pageController.nextPage(
          duration: const Duration(seconds: 3),
          curve: Curves.bounceInOut);
    }
  }
}
