class UserNotificationModel {
  final String id;
  final String title;
  final String message;
  final DateTime timestamp;

  UserNotificationModel({
    required this.id,
    required this.title,
    required this.message,
    required this.timestamp,
  });
}

List<UserNotificationModel> fakeNotifications = [
  UserNotificationModel(
    id: '1',
    title: 'New Message',
    message: 'You have a new message from John Doe.',
    timestamp: DateTime.now(),
  ),
  UserNotificationModel(
    id: '2',
    title: 'Reminder',
    message: 'Don\'t forget to attend the meeting at 10 AM.',
    timestamp: DateTime.now().subtract(const Duration(days: 1)),
  ),
  UserNotificationModel(
    id: '3',
    title: 'Alert',
    message: 'Your subscription will expire soon. Renew now.',
    timestamp: DateTime.now().subtract(const Duration(days: 2)),
  ),
  UserNotificationModel(
    id: '4',
    title: 'New Friend Request',
    message: 'You have a new friend request from Jane Smith.',
    timestamp: DateTime.now().subtract(const Duration(days: 3)),
  ),
  UserNotificationModel(
    id: '5',
    title: 'Reminder',
    message: 'Submit your report by the end of the day.',
    timestamp: DateTime.now().subtract(const Duration(days: 4)),
  ),
  UserNotificationModel(
    id: '6',
    title: 'Alert',
    message: 'Your payment is overdue. Please make a payment.',
    timestamp: DateTime.now().subtract(const Duration(days: 5)),
  ),
  UserNotificationModel(
    id: '7',
    title: 'Notification',
    message: 'You have received a new follower.',
    timestamp: DateTime.now().subtract(const Duration(days: 6)),
  ),
  UserNotificationModel(
    id: '8',
    title: 'Reminder',
    message: 'Tomorrow is the deadline for project submission.',
    timestamp: DateTime.now().subtract(const Duration(days: 7)),
  ),
  UserNotificationModel(
    id: '9',
    title: 'Alert',
    message: 'There is a security update available for your account.',
    timestamp: DateTime.now().subtract(const Duration(days: 8)),
  ),
  UserNotificationModel(
    id: '10',
    title: 'Notification',
    message: 'Your order has been shipped. Track your order now.',
    timestamp: DateTime.now().subtract(const Duration(days: 9)),
  ),
];
