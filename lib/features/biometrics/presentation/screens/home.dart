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
import 'package:time_series/features/biometrics/presentation/widgets/loading_states.dart';
import 'package:time_series/features/biometrics/presentation/widgets/performance_monitor.dart';
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
    ref.listen(combinedChartDataProvider, (prev, next) {
      if (next != null) {
        ref
            .read(chartControllerProvider.notifier)
            .generateSpots(
              entries: next['biometrics'] as List<BiometricsModel>,
              journals: next['journal'] as List<JournalModel>,
            );
      }
    });

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
                return MobileView();
              }
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: TimeSeriesColors.cadmiumRed,
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
                    : WebsafeSvg.asset(
                      "dark".svg,
                      colorFilter: const ColorFilter.mode(
                        TimeSeriesColors.white,
                        BlendMode.srcIn,
                      ),
                    ),
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
    final themeMode = ref.watch(themeModeProvider);
    final isDarkMode = themeMode == ThemeMode.dark;

    return SizedBox(
      height: context.screenHeight,
      width: context.screenWidth,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child:
            ref
                .watch(journalProvider)
                .whenOrNull(
                  successful: (journalData) {
                    return ref
                        .watch(getBiometricsDataProvider)
                        .when(
                          initial: () => const LoadingSkeleton(),
                          loading: () => const LoadingSkeleton(),
                          successful: (data) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                ChartToolbar(),
                                BiometricsChart(title: "HRV", metric: "hrv"),
                                BiometricsChart(title: "RHR", metric: "rhr"),
                                BiometricsChart(
                                  title: "Steps",
                                  metric: "steps",
                                ),
                                const PerformanceMonitor(),
                                const PerformanceNote(),
                              ],
                            );
                          },
                          error:
                              (error) => ErrorState(
                                errorMessage: error?.message,
                                onRetry: () {
                                  ref
                                      .read(getBiometricsDataProvider.notifier)
                                      .biometrics();
                                  ref.read(journalProvider.notifier).journal();
                                },
                              ),
                          empty:
                              () => EmptyState(
                                message:
                                    'No journal data available. Please check your device connection.',
                                onRefresh: () {
                                  ref
                                      .read(getBiometricsDataProvider.notifier)
                                      .biometrics();
                                  ref.read(journalProvider.notifier).journal();
                                },
                              ),
                        );
                  },
                  empty: () {
                    return EmptyState(
                      message:
                          'No journal data available. Please check your device connection.',
                      onRefresh: () {
                        ref.read(journalProvider.notifier).journal();
                      },
                    );
                  },
                  error: (error) {
                    return ErrorState(
                      errorMessage: error?.message,
                      onRetry: () {
                        ref.read(journalProvider.notifier).journal();
                      },
                    );
                  },
                ) ??
            LoadingSkeleton(),
      ),
    );
  }
}
