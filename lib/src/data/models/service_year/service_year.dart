class ServiceYear {
  const ServiceYear({
    this.serviceYear = '',
    this.bibleStudies = 0.0,
    this.durationInMinutes = 0,
    this.placements = 0,
    this.remarks = '',
    this.reportsIds = const [],
    this.returnVisits = 0,
    this.minutesLDC = 0,
    this.videos = 0,
  });

  final double bibleStudies;
  final int durationInMinutes;
  final int placements;

  /// max length 650
  final String remarks;
  final int returnVisits;
  final String serviceYear;
  final int minutesLDC;
  final int videos;

  final List<int> reportsIds;

  ServiceYear copyWith({
    double? bibleStudies,
    int? durationInMinutes,
    int? placements,
    String? remarks,
    int? returnVisits,
    List<int>? reportsIds,
    String? serviceYear,
    int? minutesLDC,
    int? videos,
  }) {
    return ServiceYear(
      bibleStudies: bibleStudies ?? this.bibleStudies,
      durationInMinutes: durationInMinutes ?? this.durationInMinutes,
      placements: placements ?? this.placements,
      remarks: remarks ?? this.remarks,
      returnVisits: returnVisits ?? this.returnVisits,
      reportsIds: reportsIds ?? this.reportsIds,
      serviceYear: serviceYear ?? this.serviceYear,
      minutesLDC: minutesLDC ?? this.minutesLDC,
      videos: videos ?? this.videos,
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ServiceYear &&
            (identical(other.serviceYear, serviceYear) || other.serviceYear == serviceYear) &&
            (identical(other.bibleStudies, bibleStudies) || other.bibleStudies == bibleStudies) &&
            (identical(other.durationInMinutes, durationInMinutes) ||
                other.durationInMinutes == durationInMinutes) &&
            (identical(other.placements, placements) || other.placements == placements) &&
            (identical(other.remarks, remarks) || other.remarks == remarks) &&
            (identical(other.reportsIds, reportsIds) || other.reportsIds == reportsIds) &&
            (identical(other.returnVisits, returnVisits) || other.returnVisits == returnVisits) &&
            (identical(other.minutesLDC, minutesLDC) || other.minutesLDC == minutesLDC) &&
            (identical(other.videos, videos) || other.videos == videos));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        serviceYear,
        bibleStudies,
        durationInMinutes,
        placements,
        remarks,
        reportsIds,
        returnVisits,
        minutesLDC,
        videos,
      ]);

  @override
  String toString() {
    return 'ServiceYear(serviceYear: $serviceYear, bibleStudies: $bibleStudies, durationInMinutes: $durationInMinutes, placements: $placements, remarks: $remarks, returnVisits: $returnVisits, minutesLDC: $minutesLDC, videos: $videos, reportsIds: $reportsIds)';
  }
}
