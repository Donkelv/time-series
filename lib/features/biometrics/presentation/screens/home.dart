import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_series/core/extensions/context_extensions.dart';
import 'package:time_series/core/extensions/string_extensions.dart';
import 'package:time_series/core/theme/colors.dart';
import 'package:time_series/core/theme/theme_notifier.dart';
import 'package:websafe_svg/websafe_svg.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeModeProvider);
    final isDarkMode = themeMode == ThemeMode.dark;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        // For Android.
        // Use [light] for white status bar and [dark] for black status bar.
        statusBarIconBrightness: Brightness.light,
        // For iOS.
        // Use [dark] for white status bar and [light] for black status bar.
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: context.colorScheme.primary,
        body: SafeArea(
          top: true,
          bottom: false,
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < 600) {
                return MobileView();
              } else {
                return const Text('Tablet/ Desktop Home Screen');
              }
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ref.read(themeModeProvider.notifier).toggleTheme();
          },
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            child:
                isDarkMode
                    ? WebsafeSvg.asset(
                      "light".svg,
                      colorFilter: const ColorFilter.mode(
                        TimeSeriesColors.white,
                        BlendMode.srcIn,
                      ),
                    )
                    : WebsafeSvg.asset("dark".svg),
          ),
        ),
      ),
    );
  }
}

class MobileView extends StatelessWidget {
  const MobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: SizedBox(
        height: context.screenHeight,
        width: context.screenWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [],
        ),
      ),
    );
  }
}
