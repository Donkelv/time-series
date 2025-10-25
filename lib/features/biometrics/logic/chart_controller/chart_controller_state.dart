


class ChartState {
  final String selectedRange;
  final DateTime? hoverDate;
  final Map<String, List<ChartSpot>> spots;

  ChartState({
    required this.selectedRange,
    required this.hoverDate,
    required this.spots,
  });

  factory ChartState.initial() =>
      ChartState(selectedRange: '30d', hoverDate: null, spots: {});

  ChartState copyWith({
    String? selectedRange,
    DateTime? hoverDate,
    Map<String, List<ChartSpot>>? spots,
  }) {
    return ChartState(
      selectedRange: selectedRange ?? this.selectedRange,
      hoverDate: hoverDate ?? this.hoverDate,
      spots: spots ?? this.spots,
    );
  }
}

class ChartSpot {
  final double x;
  final double y;
  final DateTime date;
  ChartSpot(this.x, this.y, this.date);
}
