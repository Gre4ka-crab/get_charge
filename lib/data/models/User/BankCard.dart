class BankCard {
  final String id;
  final String userId;
  final int numberCard;
  final DateTime workingPeriod;
  final int cvv;

  BankCard(
      {required this.id,
      required this.userId,
      required this.numberCard,
      required this.workingPeriod,
      required this.cvv});
}
