void main() {
  // Map of pizza prices
  const pizzaPrices = {
    'margherita': 5.5,
    'pepperoni': 7.5,
    'vegetarian': 6.5,
  };

  // Example order
  const order = ['margherita', 'pepperoni', 'pineapple'];

  // Your code
  double total = 0.0;
  for (var item in order) {
    if (!pizzaPrices.containsKey(item)) {
      print('$item is coming soon');
      return;
    }
    total += pizzaPrices[item]!;
  }

  print('Total: \$${total.toStringAsFixed(2)}');
}
