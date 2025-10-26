


class ChartState {
  final String selectedRange;
  final DateTime? hoverDate;
  final Map<String, List<ChartSpot>> spots;
  final Map<String, List<ChartSpot>> hrvBands; // 7-day rolling mean ±1σ
  final List<JournalAnnotation> journalAnnotations;
  final bool isLargeDataset;
  final bool isDecimated;
  final DecimationMetrics? decimationMetrics;

  ChartState({
    required this.selectedRange,
    required this.hoverDate,
    required this.spots,
    required this.hrvBands,
    required this.journalAnnotations,
    required this.isLargeDataset,
    required this.isDecimated,
    this.decimationMetrics,
  });

  factory ChartState.initial() => ChartState(
    selectedRange: '30d',
    hoverDate: null,
    spots: {},
    hrvBands: {},
    journalAnnotations: [],
    isLargeDataset: false,
    isDecimated: false,
  );

  ChartState copyWith({
    String? selectedRange,
    DateTime? hoverDate,
    Map<String, List<ChartSpot>>? spots,
    Map<String, List<ChartSpot>>? hrvBands,
    List<JournalAnnotation>? journalAnnotations,
    bool? isLargeDataset,
    bool? isDecimated,
    DecimationMetrics? decimationMetrics,
  }) {
    return ChartState(
      selectedRange: selectedRange ?? this.selectedRange,
      hoverDate: hoverDate ?? this.hoverDate,
      spots: spots ?? this.spots,
      hrvBands: hrvBands ?? this.hrvBands,
      journalAnnotations: journalAnnotations ?? this.journalAnnotations,
      isLargeDataset: isLargeDataset ?? this.isLargeDataset,
      isDecimated: isDecimated ?? this.isDecimated,
      decimationMetrics: decimationMetrics ?? this.decimationMetrics,
    );
  }
}

class ChartSpot {
  final double x;
  final double y;
  final DateTime date;
  ChartSpot(this.x, this.y, this.date);
}

class JournalAnnotation {
  final DateTime date;
  final int mood;
  final String note;
  final double x;

  JournalAnnotation({
    required this.date,
    required this.mood,
    required this.note,
    required this.x,
  });
}

class DecimationMetrics {
  final int originalSize;
  final int decimatedSize;
  final double compressionRatio;
  final double minY;
  final double maxY;

  DecimationMetrics({
    required this.originalSize,
    required this.decimatedSize,
    required this.compressionRatio,
    required this.minY,
    required this.maxY,
  });

  @override
  String toString() {
    return 'DecimationMetrics(original: $originalSize, decimated: $decimatedSize, '
           'ratio: ${compressionRatio.toStringAsFixed(2)}x, '
           'range: $minY-$maxY)';
  }
}
