import 'package:fitness_health_ui/main_tab/select_view.dart';
import 'package:flutter/material.dart';
import '../common/color_extension.dart';
import '../common_widget/tab_button.dart';
import '../photo_progress/photo_progress_view.dart';
import '../profile/profile_view.dart';
import '../view/home_screen/home_view.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> {
  int selectTab = 0;
  final PageStorageBucket pageBucket = PageStorageBucket();
  Widget currentTab = const HomeView();

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    Color backgroundColor = isDarkMode ? Colors.black : TColo.white;
    Color tabIconActiveColor = isDarkMode ? Colors.white : TColo.black;
    Color tabIconInactiveColor = isDarkMode ? Colors.blue : TColo.grey;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: PageStorage(bucket: pageBucket, child: currentTab),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: InkWell(
          onTap: () {},
          child: Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: TColo.primaryG,
              ),
              borderRadius: BorderRadius.circular(35),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 2,
                ),
              ],
            ),
            child: Icon(
              Icons.search,
              color: TColo.white,
              size: 35,
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: backgroundColor,
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            boxShadow: const [
              BoxShadow(color: Colors.black12, blurRadius: 2, offset: Offset(0, -2)),
            ],
          ),
          height: kToolbarHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TabButton(
                icon: "assets/img/home_tab.png",
                selectIcon: "assets/img/home_tab_select.png",
                isActive: selectTab == 0,
                activeColor: tabIconActiveColor,
                inactiveColor: tabIconInactiveColor,
                onTap: () {
                  setState(() {
                    selectTab = 0;
                    currentTab = const HomeView();
                  });
                },
              ),
              TabButton(
                icon: "assets/img/activity_tab.png",
                selectIcon: "assets/img/activity_tab_select.png",
                isActive: selectTab == 1,
                activeColor: tabIconActiveColor,
                inactiveColor: tabIconInactiveColor,
                onTap: () {
                  setState(() {
                    selectTab = 1;
                    currentTab = const SelectView();
                  });
                },
              ),
              const SizedBox(width: 40),
              TabButton(
                icon: "assets/img/camera_tab.png",
                selectIcon: "assets/img/camera_tab_select.png",
                isActive: selectTab == 2,
                activeColor: tabIconActiveColor,
                inactiveColor: tabIconInactiveColor,
                onTap: () {
                  setState(() {
                    selectTab = 2;
                    currentTab = const PhotoProgressView();
                  });
                },
              ),
              TabButton(
                icon: "assets/img/profile_tab.png",
                selectIcon: "assets/img/profile_tab_select.png",
                isActive: selectTab == 3,
                activeColor: tabIconActiveColor,
                inactiveColor: tabIconInactiveColor,
                onTap: () {
                  setState(() {
                    selectTab = 3;
                    currentTab = const ProfileView();
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}