import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:water_quality/controller/assets_manager/assets_manager.dart';
import 'package:water_quality/model/account_model.dart';
import 'package:water_quality/screen/colors.dart';
import 'package:water_quality/screen/pages/experiments_screen.dart';
import 'package:water_quality/screen/pages/report_screen.dart';
import 'package:water_quality/screen/pages/setting_screen.dart';
import 'package:water_quality/screen/pages/task_screen.dart';
import 'package:water_quality/screen/widget/unauthorized_widget.dart';
import 'home_screen.dart';

class HomeLayout extends StatelessWidget {
  HomeLayout({Key? key}) : super(key: key);
  
  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return  Builder(
        builder: (context) {
          final isSmallScreen = MediaQuery.of(context).size.width < 600;
          return Scaffold(
            key: _key,
            
            drawer: ExampleSidebarX(controller: _controller),
            body: Row(
              children: [
                if (!isSmallScreen) ExampleSidebarX(controller: _controller),
                Expanded(
                  child: Center(
                    child: _ScreensExample(
                      controller: _controller,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
  }
}

class ExampleSidebarX extends StatelessWidget {
  const ExampleSidebarX({
    Key? key,
    required SidebarXController controller,
  })  : _controller = controller,
        super(key: key);

  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: _controller,
      theme: SidebarXTheme(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: canvasColor,
          borderRadius: BorderRadius.circular(20),
        ),
        textStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
        selectedTextStyle: const TextStyle(color: Colors.white),
        hoverTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        itemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemTextPadding: const EdgeInsets.only(left: 30),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: canvasColor),
        ),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: actionColor.withOpacity(0.37),
          ),
          gradient: const LinearGradient(
            colors: [accentCanvasColor, canvasColor],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.28),
              blurRadius: 30,
            )
          ],
        ),
        iconTheme: IconThemeData(
          color: Colors.white.withOpacity(0.7),
          size: 20,
        ),
        selectedIconTheme: const IconThemeData(
          color: Colors.white,
          size: 20,
        ),
      ),
      extendedTheme: const SidebarXTheme(
        width: 200,
        decoration: BoxDecoration(
          color: canvasColor,
        ),
      ),
      footerDivider: divider,
      headerBuilder: (context, extended) {
        return SizedBox(
          height: 100,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(AssetsManager.logoImage),
          ),
        );
      },
      items: [
        SidebarXItem(
          icon: Icons.home,
          label: 'Home',
          onTap: () {

          },
        ),
        const SidebarXItem(
          icon: Icons.groups_3_outlined,
          label: 'Experiments',
        ),
        const SidebarXItem(
          icon: Icons.task_outlined,
          label: 'Tasks',
        ),
         const SidebarXItem(
          icon:  Icons.topic,
          label: 'Report',
        ),
         const SidebarXItem(
          icon:  Icons.settings_outlined,
          label: 'setting',
        ),
         const SidebarXItem(
          icon:  Icons.logout_outlined,
          label: 'Logout',
        ),
      ],
    );
  }
}

class _ScreensExample extends StatelessWidget {
   _ScreensExample({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SidebarXController controller;
  final List<Widget>screens=[
    HomeScreen(AccountModel.currentUser),
    const ExperimentsScreen(),
    const TaskScreen(),
    ReportScreen(),
    SettingScreen()
  ];
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        if (controller.selectedIndex==5){
          Navigator.pop(context);
        }
        switch (controller.selectedIndex) {
          case 0:
            return screens[0];
          case 1:
            return (AccountModel.accountMap[AccountModel.currentUser]!.jobTitle== 'Operating Techinician'||AccountModel.accountMap[AccountModel.currentUser]!.jobTitle== 'Engineer')? unautorized(): screens[1];
          case 2:
            return (AccountModel.accountMap[AccountModel.currentUser]!.jobTitle== 'Engineer')? screens[2]: unautorized();
          case 3:
            return (AccountModel.accountMap[AccountModel.currentUser]!.jobTitle== 'IT Depertment')? unautorized(): screens[3];
          case 4:
            return screens[4];
          default:
            return Text(
              'error',
              style: theme.textTheme.headlineSmall,
            );
        }
      },
    );
  }
}

const primaryColor = MyColor.blueB3;
const canvasColor = MyColor.blueB3;
const accentCanvasColor = MyColor.blueB3;
const white = Colors.white;
final actionColor = MyColor.blueB3.withOpacity(0.6);
final divider = Divider(color: white.withOpacity(0.3), height: 1);