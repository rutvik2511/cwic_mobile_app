class Message {
  final String name;
  final String propertyTitle;
  final String propertyType;
  final String avatarUrl;
  final String message;
  final String date;
  final String time;

  Message(
      {required this.date,
      required this.time,
      required this.message,
      required this.name,
      required this.propertyTitle,
      required this.propertyType,
      required this.avatarUrl});
}