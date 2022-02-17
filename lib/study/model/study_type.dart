class DicomTag {
  String vr;
  List value;

  DicomTag({
    this.vr: '',
    this.value: const [''],
  });

  factory DicomTag.fromJson(Map<String, dynamic> json) {
    return DicomTag(
      vr: json['vr'] != null ? json['vr'] : '',
      value: json['Value'] != null ? json['Value'] as List : [''],
    );
  }
}
