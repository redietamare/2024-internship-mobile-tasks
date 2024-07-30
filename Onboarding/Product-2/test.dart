import 'dart:io';

void main() {
  ProductManager productManager = ProductManager();

  while (true) {
    print("\nProduct Management System");
    print("1. Add New Product");
    print("2. View Products");
    print("3. View Single Product");
    print("4. Edit Product");
    print("5. Delete Product");
    print("6. Exit");

    var choice = stdin.readLineSync();
    int? menuChoice = int.tryParse(choice ?? '');

    switch (menuChoice) {
      case 1:
        productManager.addNewProduct();
        break;
      case 2:
        productManager.viewProducts();
        break;
      case 3:
        productManager.viewSingleProduct();
        break;
      case 4:
        productManager.editProduct();
        break;
      case 5:
        productManager.deleteProduct();
        break;
      case 6:
        exit(0);
      default:
        print("Invalid choice. Please select a valid option.");
    }
  }
}

class Product {
  String? name, description;
  double? price;

  void setProductName(String? name) {
    this.name = name;
  }

  void setProductDescription(String? description) {
    this.description = description;
  }

  void setProductPrice(double? price) {
    this.price = price;
  }

  String? getProductName() {
    return name;
  }

  String? getProductDescription() {
    return description;
  }

  double? getProductPrice() {
    return price;
  }

  @override
  String toString() {
    return 'Product Name: $name\nProduct Description: $description\nProduct Price: \$${price?.toStringAsFixed(2)}';
  }
}

class ProductManager {
  List<Product> listOfProducts = [];

  void addNewProduct() {
    print("Enter the name of the product:");
    String? name = stdin.readLineSync();
    print("Enter the description of the product:");
    String? description = stdin.readLineSync();
    print("Enter the price of the product:");
    String? priceInput = stdin.readLineSync();

    try {
      double? price = double.tryParse(priceInput ?? '');
      if (price == null) {
        throw FormatException("Invalid price format");
      }

      Product newProduct = Product();
      newProduct.setProductName(name);
      newProduct.setProductDescription(description);
      newProduct.setProductPrice(price);
      listOfProducts.add(newProduct);
      print("Your product has been inserted successfully.");
    } catch (e) {
      print("Error: $e");
    }
  }

  void viewProducts() {
    if (listOfProducts.isEmpty) {
      print("No products available.");
      return;
    }

    int i = 1;
    for (var prod in listOfProducts) {
      print("Product $i:");
      print(prod.toString());
      print(""); // Adds a blank line between products for better readability
      i++;
    }
  }

  void viewSingleProduct() {
    print("Enter the name of the product you're looking for:");
    String? prodName = stdin.readLineSync();
    bool found = false;

    for (var prod in listOfProducts) {
      if (prod.getProductName() == prodName) {
        print("Here is the product:");
        print(prod.toString());
        found = true;
        break;
      }
    }

    if (!found) {
      print("The product you're looking for doesn't exist.");
    }
  }

  void editProduct() {
    print("Enter the name of the product you want to edit:");
    String? prodName = stdin.readLineSync();
    bool found = false;

    for (var prod in listOfProducts) {
      if (prod.getProductName() == prodName) {
        found = true;
        print("What do you want to edit?");
        print("1. Product Name");
        print("2. Product Description");
        print("3. Product Price");
        String? choiceInput = stdin.readLineSync();
        int? choice = int.tryParse(choiceInput ?? '');

        switch (choice) {
          case 1:
            print("Enter the new name:");
            String? newName = stdin.readLineSync();
            prod.setProductName(newName);
            break;
          case 2:
            print("Enter the new description:");
            String? newDescription = stdin.readLineSync();
            prod.setProductDescription(newDescription);
            break;
          case 3:
            print("Enter the new price:");
            String? newPriceInput = stdin.readLineSync();
            try {
              double? newPrice = double.tryParse(newPriceInput ?? '');
              if (newPrice == null) {
                throw FormatException("Invalid price format");
              }
              prod.setProductPrice(newPrice);
            } catch (e) {
              print("Error: $e");
            }
            break;
          default:
            print("Invalid choice.");
        }
        print("Product updated successfully.");
        break;
      }
    }

    if (!found) {
      print("The product you're looking for doesn't exist.");
    }
  }

  void deleteProduct() {
    print("Enter the name of the product you want to delete:");
    String? prodName = stdin.readLineSync();
    bool found = false;

    for (var prod in listOfProducts) {
      if (prod.getProductName() == prodName) {
        listOfProducts.remove(prod);
        found = true;
        print("Product deleted.");
        break;
      }
    }

    if (!found) {
      print("The product you're looking for doesn't exist.");
    }
  }
}
