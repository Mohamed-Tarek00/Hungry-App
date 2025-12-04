import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungryapp/core/constant.dart';
import 'package:hungryapp/core/utils/keep_alive_warper.dart';
import 'package:hungryapp/features/cart/presentation/views/cart_view.dart';
import 'package:hungryapp/features/home/presentation/views/home_view.dart';
import 'package:hungryapp/features/orderHistory/presentation/views/order_history_view.dart';
import 'package:hungryapp/features/profile/presentation/views/profile_view.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  late final PageController controller;
  late final List<Widget> screens;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: currentPage);

    screens = [
      KeepAliveWrapper(child: HomeView()),
      KeepAliveWrapper(child: CartView()),
      KeepAliveWrapper(child: OrderHistoryView()),
      const KeepAliveWrapper(child: ProfileView()),
    ];
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _onNavTap(int index) {
    setState(() => currentPage = index);
    controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView(
        controller: controller,
        children: screens,
        onPageChanged: (index) {
          setState(() => currentPage = index);
        },
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: BottomNavigationBar(
          elevation: 0,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey.shade500,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          currentIndex: currentPage,
          onTap: _onNavTap,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_restaurant_outlined),
              label: 'Order History',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.profile_circled),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
