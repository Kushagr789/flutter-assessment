

class TermsAndConditions {
  final String title;
  final String content;

  TermsAndConditions({required this.title, required this.content});

  factory TermsAndConditions.fromJson(Map<String, dynamic> json) {
    return TermsAndConditions(
      title: json['title'],
      content: json['content'],
    );
  }
}