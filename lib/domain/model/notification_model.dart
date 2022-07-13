class NotificationModel {
  final String? avatar;
  final String? name;
  final String? company;
  final String? message;

  NotificationModel({this.avatar, this.name, this.company, this.message});
}

extension NotificationModelExtension on NotificationModel {
  List<NotificationModel> onNotificationList() {
    return <NotificationModel>[
      NotificationModel(
          avatar: 'avatar_1.png',
          name: 'Joel Rowe',
          company: 'Bitrow Company',
          message:
              'Sorry, all the artists in the Interior Design category are busy '
              'right now. If your task is still relevant - '
              'go to the task details page and click "Extend task”.'),
      NotificationModel(
          avatar: 'avatar_2.png',
          name: 'Cole Payne',
          company: 'Corporation Kraton',
          message:
              'We have found a contractor for your task "Cleaning services”. Please see the details.'),
      NotificationModel(
          avatar: 'avatar_3.png',
          name: 'Elva Stone',
          company: 'Grand Service Company',
          message:
              "David Coleman is ready to complete your assignment and get started soon!"
              " View David's profile and carefully review the order details. Then confirm the order."),
    ];
  }
}
