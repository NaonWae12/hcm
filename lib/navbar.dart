import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'activity/page_activity.dart';
import 'analytic/page_analytic.dart';
import 'attendance/page_attendance.dart';
import 'home/page_home.dart';
import 'profile/page_profile.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0; // Menyimpan index halaman yang aktif

  static final List<Widget> _pages = <Widget>[
    const PageHome(),
    const PageAnalytic(),
    const PageActivity(),
    const PageProfile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      floatingActionButton: ClipOval(
        child: Material(
          color: Theme.of(context).colorScheme.primary,
          child: InkWell(
            splashColor: Theme.of(context)
                .colorScheme
                .secondaryContainer, // Efek splash ketika ditekan
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PageAttendance()),
              );
            },
            child: SizedBox(
              width: 70,
              height: 70,
              child: Transform.scale(
                scale: 0.5,
                child: SvgPicture.asset(
                  'assets/icons/scan_attendace.svg',
                  fit: BoxFit.contain,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.surface,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 7.0,
          color: Theme.of(context).colorScheme.primaryContainer,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: IconButton(
                  iconSize: 20,
                  icon: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                          _selectedIndex == 0
                              ? 'assets/icons/home_smile_rounded.svg'
                              : 'assets/icons/home_smile_outlined.svg',
                          colorFilter: ColorFilter.mode(
                            _selectedIndex == 0
                                ? Theme.of(context).colorScheme.primary
                                : Colors.grey,
                            BlendMode.srcIn,
                          )),
                      Flexible(
                        child: Text(
                          "Home",
                          style: GoogleFonts.quicksand(
                            color: _selectedIndex == 0
                                ? Theme.of(context).colorScheme.primary
                                : Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {
                    _onItemTapped(0);
                  },
                ),
              ),
              Expanded(
                child: IconButton(
                  iconSize: 20,
                  icon: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                          _selectedIndex == 1
                              ? 'assets/icons/pie_chart_rounded.svg'
                              : 'assets/icons/pie_chart_outlined.svg',
                          colorFilter: ColorFilter.mode(
                            _selectedIndex == 1
                                ? Theme.of(context).colorScheme.primary
                                : Colors.grey,
                            BlendMode.srcIn,
                          )),
                      Flexible(
                        child: Text(
                          "Analytic",
                          style: GoogleFonts.quicksand(
                            color: _selectedIndex == 1
                                ? Theme.of(context).colorScheme.primary
                                : Colors.grey,
                            fontSize: 12,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {
                    _onItemTapped(1);
                  },
                ),
              ),
              Expanded(
                child: SizedBox(
                  width: 4,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 24),
                      Text(
                        "Attend",
                        style: GoogleFonts.quicksand(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: IconButton(
                  iconSize: 20,
                  icon: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                          _selectedIndex == 2
                              ? 'assets/icons/hourglass_line_rounded.svg'
                              : 'assets/icons/hourglass_line_outlined.svg',
                          colorFilter: ColorFilter.mode(
                            _selectedIndex == 2
                                ? Theme.of(context).colorScheme.primary
                                : Colors.grey,
                            BlendMode.srcIn,
                          )),
                      Flexible(
                        child: Text(
                          "Activity",
                          style: GoogleFonts.quicksand(
                            color: _selectedIndex == 2
                                ? Theme.of(context).colorScheme.primary
                                : Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {
                    _onItemTapped(2);
                  },
                ),
              ),
              Expanded(
                child: IconButton(
                  iconSize: 20,
                  icon: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                          _selectedIndex == 3
                              ? 'assets/icons/profile_rounded.svg'
                              : 'assets/icons/profile_outlined.svg',
                          colorFilter: ColorFilter.mode(
                            _selectedIndex == 3
                                ? Theme.of(context).colorScheme.primary
                                : Colors.grey,
                            BlendMode.srcIn,
                          )),
                      Flexible(
                        child: Text(
                          "Profile",
                          style: GoogleFonts.quicksand(
                            color: _selectedIndex == 3
                                ? Theme.of(context).colorScheme.primary
                                : Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {
                    _onItemTapped(3);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
