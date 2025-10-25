import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_series/core/extensions/context_extensions.dart';
import 'package:time_series/core/extensions/string_extensions.dart';
import 'package:time_series/core/theme/colors.dart';
import 'package:time_series/core/theme/theme_notifier.dart';
import 'package:time_series/features/biometrics/data/entity/biometrics_model.dart';
import 'package:time_series/features/biometrics/data/entity/journal_model.dart';
import 'package:time_series/features/biometrics/logic/biometrics/biometrics_provider.dart';
import 'package:time_series/features/biometrics/logic/chart_controller/chart_provider.dart';
import 'package:time_series/features/biometrics/logic/journal/journal_provider.dart';
import 'package:time_series/features/biometrics/presentation/widgets/biometrics_charts.dart';
import 'package:time_series/features/biometrics/presentation/widgets/chart_tool_bar.dart';
import 'package:websafe_svg/websafe_svg.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    Future.microtask(() {
      ref.read(getBiometricsDataProvider.notifier).biometrics();
      ref.read(journalProvider.notifier).journal();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final combined = ref.watch(combinedChartDataProvider);

    if (combined != null) {
      ref
          .read(chartControllerProvider.notifier)
          .generateSpots(
            entries: combined['biometrics'] as List<BiometricsModel>,
            journals: combined['journal'] as List<JournalModel>,
          );
    }
    // ref.listen(getBiometricsDataProvider, (_, state) {
    //   state.whenOrNull(
    //     successful: (data) {
    //       ref.listen(journalProvider, (_, journalState) {
    //         journalState.whenOrNull(
    //           successful: (journalData) {
    //             ref
    //                 .read(chartControllerProvider.notifier)
    //                 .generateSpots(entries: data, journals: journalData);
    //           },
    //         );
    //       });
    //     },
    //   );
    // });
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
        backgroundColor: context.colorScheme.surface,
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

class MobileView extends ConsumerWidget {
  const MobileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chartState = ref.watch(chartControllerProvider);
    final themeMode = ref.watch(themeModeProvider);
    final isDarkMode = themeMode == ThemeMode.dark;
    final combined = ref.watch(combinedChartDataProvider);

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: SizedBox(
        height: context.screenHeight,
        width: context.screenWidth,
        child:
            ref
                .watch(getBiometricsDataProvider)
                .whenOrNull(
                  successful: (data) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ChartToolbar(
                          selectedRange: chartState.selectedRange,
                          onRangeChange: (r) {
                            ref
                                .read(chartControllerProvider.notifier)
                                .updateRange(r);
                            if (combined != null) {
                              ref
                                  .read(chartControllerProvider.notifier)
                                  .generateSpots(
                                    entries:
                                        combined['biometrics']
                                            as List<BiometricsModel>,
                                    journals:
                                        combined['journal']
                                            as List<JournalModel>,
                                  );
                            }
                          },
                        ),
                        BiometricsChart(title: "HRV", metric: "hrv"),
                        BiometricsChart(title: "RHR", metric: "rhr"),
                        BiometricsChart(title: "Steps", metric: "steps"),
                      ],
                    );
                  },
                  error: (error) {
                    return Center(
                      child: Text(
                        error?.message ?? 'An error occurred',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: TimeSeriesColors.cadmiumRed,
                        ),
                      ),
                    );
                  },
                ) ??
            Center(
              child: CircularProgressIndicator.adaptive(
                valueColor: AlwaysStoppedAnimation(
                  isDarkMode
                      ? TimeSeriesColors.white
                      : TimeSeriesColors.vampireBlack,
                ),
              ),
            ),
      ),
    );
  }
}
