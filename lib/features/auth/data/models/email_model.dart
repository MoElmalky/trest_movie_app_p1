import 'package:equatable/equatable.dart';

class EmailModel extends Equatable{
  final String? to;
  final String? subject;
  final String? body;

  const EmailModel({
    this.to,
    this.subject,
    this.body,
  });

  factory EmailModel.fromJson(Map<String, dynamic> json) {
    return EmailModel(
      to: json['to'],
      subject: json['subject'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['to'] = to;
    data['subject'] = subject;
    data['body'] = body;
    return data;
  }
  
  @override
  List<Object?> get props => [
    to,
    subject,
    body
  ];
}
