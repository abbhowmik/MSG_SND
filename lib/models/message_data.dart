class MessageData {
  MessageData(
      {required this.dateMessege,
      required this.message,
      required this.messageDate,
      required this.profilePicture,
      required this.senderName});
  late String senderName;
  late String message;
  late DateTime messageDate;
  late String dateMessege;
  late String profilePicture;
}
