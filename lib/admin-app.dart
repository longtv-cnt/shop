import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(
    MaterialApp(
      home: AdminApp(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class AdminApp extends StatelessWidget {
  final titleTab = ['All', 'Free', 'Reserved'];
  final amount = [15, 5, 10];
  final pages = ['Tables', 'Items', 'Orders', 'Users', 'Stats'];
  final _icon = [
    Icons.table_rows_rounded,
    Icons.icecream_sharp,
    Icons.add_shopping_cart_sharp,
    Icons.people_outline_sharp,
    Icons.stacked_bar_chart_sharp
  ];
  static List<String> tables = [
    '4',
    '3',
    '9',
    '2',
    '11',
    '6',
    '11',
    '13',
    '15',
    '8',
    '2'
  ];

  final List<bool> isButtonPressedList =
      List.generate(tables.length, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                // Add your menu button onPressed logic here
              },
            ),
            const Text('Tables'),
            IconButton(
              icon: Stack(
                children: [
                  const Icon(Icons.notifications_outlined, size: 40),
                  Positioned(
                    right: 0,
                    child: Container(
                      constraints:
                          const BoxConstraints(minWidth: 20, minHeight: 20),
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
              onPressed: () {
                // Add your notifications button onPressed logic here
              },
            ),
          ],
        ),
      ),
      body: DefaultTabController(
        length: titleTab.length,
        initialIndex: 1,
        child: Column(
          children: [
            TabBar(
              indicatorColor: Colors.red,
              tabs: [
                for (int i = 0; i < titleTab.length; i++)
                  Tab(
                    child: Column(
                      children: [
                        Text(titleTab[i], style: const TextStyle(fontSize: 16)),
                        Text('${amount[i]}',
                            style: const TextStyle(fontSize: 12)),
                      ],
                    ),
                  ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  for (int i = 0; i < titleTab.length; i++)
                    if (titleTab[i] == 'All')
                      Container(
                        child: const Center(
                          child: Text('All Tables'),
                        ),
                      )
                    else if (titleTab[i] == 'Free')
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: Column(
                          children: [
                            const Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Select Table: ',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.blue),
                                  ),
                                ),
                              ],
                            ),
                            SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child: Wrap(
                                runSpacing: 3,
                                children: [
                                  Container(
                                    constraints: BoxConstraints(
                                      maxWidth:
                                          MediaQuery.of(context).size.width *
                                              0.8,
                                      maxHeight:
                                          MediaQuery.of(context).size.height *
                                              0.4,
                                    ),
                                    child: GridView.builder(
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        crossAxisSpacing: 3,
                                        mainAxisSpacing: 3,
                                        childAspectRatio: 1.5,
                                      ),
                                      itemCount: tables.length,
                                      itemBuilder: (context, index) {
                                        return ElevatedButton(
                                          onPressed: () {
                                            // Toggle button state
                                            isButtonPressedList[index] =
                                                !isButtonPressedList[index];
                                          },
                                          style: ElevatedButton.styleFrom(
                                            foregroundColor:
                                                isButtonPressedList[index]
                                                    ? const Color.fromARGB(
                                                        255, 22, 80, 128)
                                                    : Colors.transparent,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(0),
                                              side: const BorderSide(
                                                  color: Color.fromARGB(
                                                      255, 20, 54, 82)),
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                tables[index],
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: isButtonPressedList[
                                                          index]
                                                      ? Colors.white
                                                      : const Color.fromARGB(
                                                          255, 137, 178, 212),
                                                ),
                                              ),
                                              const Text(
                                                'Table',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Color.fromARGB(
                                                        255, 132, 183, 224)),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              // constraints: BoxConstraints(
                              //   maxWidth:
                              //       MediaQuery.of(context).size.width * 0.8,
                              //   maxHeight:
                              //       MediaQuery.of(context).size.height * 0.1,
                              // ),
                              margin: const EdgeInsets.only(bottom: 3),
                              child: const Center(
                                child: Text(
                                  '120.25',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 1),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  // Pay button

                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    child: ElevatedButton.icon(
                                        onPressed: () {},
                                        icon: const Icon(Icons.payment_sharp),
                                        label: const Text(
                                          'Payment',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.redAccent,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 50, vertical: 10),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                        )),
                                  ),

                                  Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    child: ElevatedButton.icon(
                                        onPressed: () {},
                                        icon: const Icon(Icons.search_sharp),
                                        label: const Text(
                                          'View',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.redAccent,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 50, vertical: 10),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    else if (titleTab[i] == 'Reserved')
                      Container(
                        child: const Center(
                          child: Text('Reserved Tables'),
                        ),
                      )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        buttonBackgroundColor: Colors.redAccent,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        color: Colors.red,
        items: [
          for (int i = 0; i < pages.length; i++)
            CurvedNavigationBarItem(
              child: Icon(_icon[i], size: 30, color: Colors.white),
              label: pages[i],
              labelStyle: const TextStyle(
                  fontSize: 12, color: Color.fromARGB(255, 252, 252, 252)),
            ),
        ],
        onTap: (index) {
          // Handle button tap
        },
      ),
    );
  }
}
