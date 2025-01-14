import 'package:motion_week2_sg/models/product_models.dart';
import 'dart:ui';

class DummyData {
  static final List<String> listDummyCatagory = [
    'All',
    'Watch',
    'Shirt',
    'Shoes',
    'Pant',
  ];
  static final List<ProductModel> DummyProduct = [
    ProductModel(
      id: '1',
      image: 'assets/images/product.png',
      name: 'Mi Band 8 Pro',
      price: 54.00,
      description:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
      isFavorite: true,
      type: 'Watch',
      productColor: const Color(0xfFf3f1ed),
    ),
    ProductModel(
      id: '2',
      image: 'assets/images/product2.png',
      name: 'Lycra Men\'s shirt',
      price: 12.00,
      description:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
      type: 'Shirt',
      isFavorite: false,
      productColor: const Color(0xfff5f9e0),
    ),
    ProductModel(
      id: '3',
      image: 'assets/images/product3.png',
      name: 'Siberia 800',
      price: 45.00,
      description:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
      type: 'Wearable',
      isFavorite: false,
      productColor: const Color(0xFFf5f9e0),
    ),
    ProductModel(
      id: '4',
      image: 'assets/images/product4.png',
      name: 'Nike Air Jordan',
      price: 35.00,
      description:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
      type: 'Shoes',
      isFavorite: true,
      productColor: const Color(0xfFfae4e6),
    ),
  ];
}
