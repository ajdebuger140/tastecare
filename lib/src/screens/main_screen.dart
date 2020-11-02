import 'package:flutter/material.dart';
//import 'package:foodapp/src/scoped_model/food_model.dart';
import 'package:foodapp/src/scoped_model/main_model.dart';
import 'package:foodapp/src/seller/pages/add_food_item.dart';
//pages
import '../pages/home_page.dart';
import '../pages/order_page.dart';
import '../pages/favorite_page.dart';
import '../pages/profile_page.dart';

class MainScreen extends StatefulWidget {
  final MainModel model;
  MainScreen({this.model});
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentTabIndex = 0;
  List<Widget> pages;
  Widget currentPage;
  HomePage homePage;
  OrderPage orderPage;
  FavoritePage favoritePage;
  ProfilePage profilePage;

  @override
  void initState() {
    homePage = HomePage();
    orderPage = OrderPage();
    favoritePage = FavoritePage(model: widget.model);
    profilePage = ProfilePage();
    pages = [homePage, favoritePage, orderPage, profilePage];
    currentPage = homePage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var bottomNavigationBarItem = BottomNavigationBarItem(
        // ignore: deprecated_member_use
        icon: Icon(Icons.person),
        // ignore: deprecated_member_use
        title: Text("Profile"));
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        // drawer: Drawer(
        //   child: Column(
        //     children: [
        //       ListTile(
        //         onTap: () {
        //           Navigator.of(context).push(MaterialPageRoute(
        //               builder: (BuildContext context) => AddFoodItem()));
        //         },
        //         leading: Icon(
        //           Icons.list,
        //           color: Colors.black,
        //         ),
        //         title: Text(
        //           "Become Seller",
        //           style: TextStyle(fontSize: 16.0, color: Colors.pink),
        //         ),
        //       )
        //     ],
        //   ),
        // ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            setState(() {
              currentTabIndex = index;
              currentPage = pages[index];
            });
          },
          currentIndex: currentTabIndex,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            // ignore: deprecated_member_use
            BottomNavigationBarItem(
                // ignore: deprecated_member_use
                icon: Icon(Icons.home),
                // ignore: deprecated_member_use
                title: Text("Home")),
            BottomNavigationBarItem(
                // ignore: deprecated_member_use
                icon: Icon(Icons.explore),
                // ignore: deprecated_member_use
                title: Text("Explore")),
            BottomNavigationBarItem(
                // ignore: deprecated_member_use
                icon: Icon(
                  Icons.shopping_cart,
                ),
                // ignore: deprecated_member_use
                title: Text("Orders")),
            bottomNavigationBarItem,
          ],
        ),
        body: currentPage,
      ),
    );
  }
}
