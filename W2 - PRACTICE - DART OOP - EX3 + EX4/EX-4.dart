enum OrderType{
    delivery,
    pickup
}

class Product{
    final int productID;
    final String name;
    final double price;
    final String description;

    Product({
        required this.productID,
        required this.name,
        required this.price,
        required this.description
    });

    @override
    String toString() {
        return 'Product(productID: $productID, name: $name, price: \$${price.toStringAsFixed(2)}, description: $description)';
    }
}

class OrderItem{
    final Product product;
    final int quantity;

    OrderItem({
        required this.product,
        required this.quantity
    });

    double totalPerItem(){
        return product.price * quantity;
    }

    @override
    String toString() {
        return 'OrderItem(product: ${product.name}, quantity: $quantity, total: \$${totalPerItem().toStringAsFixed(2)})';
    }
}

class Order{
    final DateTime orderDate;
    final OrderType orderType;
    final List<OrderItem> items;

    Order({
        required this.orderDate,
        required this.orderType,
        required this.items
    });

    void addItem(Product product, int quantity){
        items.add(OrderItem(product: product, quantity: quantity));
    }

    void removeItem(Product product){
        items.removeWhere((item) => item.product.productID == product.productID);
    }

    double calculateTotal(){
        double total = 0.0;
        for(var item in items){
            total += item.totalPerItem();
        }
        return total;
    }

    @override
    String toString() {
        return 'Order(orderDate: $orderDate, orderType: $orderType, items: $items, total: \$${calculateTotal().toStringAsFixed(2)})';
    }
}

class Customer{
    final String customerID;
    final String customerName;
    final String customerAddress;

    Customer({
        required this.customerID,
        required this.customerName,
        required this.customerAddress
    });

    @override
    String toString() {
        return 'Customer(customerID: $customerID, name: $customerName, address: $customerAddress)';
    }
}

class Shop {
    final String shopName;
    final String shopAddress;
    final List<Order> orders = [];
    final List<Product> products = [];
    final List<Customer> customers = [];

    Shop({
        required this.shopName,
        required this.shopAddress
    });

    Order createOrder({required DateTime orderDate, required String customerID, required OrderType orderType}){
        Order newOrder = Order(orderDate: orderDate, orderType: orderType, items: []);
        orders.add(newOrder);
        return newOrder;
    }

    @override
    String toString() {
        return 'Shop(name: $shopName, address: $shopAddress, products: ${products.length}, customers: ${customers.length}, orders: ${orders.length})';
    }
}

void main() {
    Shop myShop = Shop(shopName: "SuperDuper", shopAddress: "BKK Street");
    
    // Add products to the shop
    Product product1 = Product(productID: 1, name: "Ketchup", price: 7.00, description: "Homemade with fresh tomatoes");
    Product product2 = Product(productID: 2, name: "Mayo", price: 8.00, description: "Homemade mayonnaise");
    Product product3 = Product(productID: 3, name: "Mustard", price: 9.00, description: "Abomination");
    
    myShop.products.addAll([product1, product2, product3]);
    
    // Add customers
    Customer customer1 = Customer(customerID: "A96", customerName: "Ronan", customerAddress: "Chrouy Changvar");
    Customer customer2 = Customer(customerID: "Z69", customerName: "KMern", customerAddress: "Sek Sokh");
    
    myShop.customers.addAll([customer1, customer2]);
    
    // Create orders
    Order order1 = myShop.createOrder(
        orderDate: DateTime.now(), 
        customerID: "A96", 
        orderType: OrderType.delivery
    );
    
    // Add items to order
    order1.addItem(product1, 1);
    order1.addItem(product2, 2);
    order1.addItem(product3, 3);
    
    Order order2 = myShop.createOrder(
        orderDate: DateTime.now(), 
        customerID: "Z69", 
        orderType: OrderType.pickup
    );
    
    order2.addItem(product3, 1);
    order2.addItem(product2, 1);
    order2.addItem(product1, 1);

    Order order3 = myShop.createOrder(
        orderDate: DateTime.now(), 
        customerID: "Z69", 
        orderType: OrderType.delivery
    );

    order3.addItem(product2, 5);
    order3.addItem(product1, 2);
    order3.addItem(product3, 1);
    
    // Display shop information
    print(myShop);
    for (var product in myShop.products) {
        print(product);
    }
    
    for (var customer in myShop.customers) {
        print(customer);
    }
    
    for (var order in myShop.orders) {
        print(order);
    }

    print("Order 1 total: \$${order1.calculateTotal().toStringAsFixed(2)}");
    print("Order 2 total: \$${order2.calculateTotal().toStringAsFixed(2)}");
    print("Order 3 total: \$${order3.calculateTotal().toStringAsFixed(2)}");
}