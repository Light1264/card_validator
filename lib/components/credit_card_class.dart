

  enum CardType {
  Visa,
  MasterCard,
  AmericanExpress,
  Discover,
  Unknown,
}

class CreditCard {
  final String cardNumber;
  final CardType cardType;

  CreditCard({required this.cardNumber, required this.cardType});
}