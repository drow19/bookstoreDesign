class Recommendations {
  final String id, image, title, author, price;

  Recommendations({this.id, this.image, this.title, this.author, this.price});
}

List<Recommendations> recommendationList = [
  Recommendations(
      id: "1",
      title: "Anything is Possible",
      image: "images/elizabeth.jpg",
      author: "Elizabeth Strout",
      price: "IDR 59.5K"),
  Recommendations(
      id: "1",
      title: "Nebula",
      image: "images/nebula.jpg",
      author: "Tere Liye",
      price: "IDR 59.5K"),
  Recommendations(
      id: "1",
      title: "Happy Little Soul",
      image: "images/happy.jpg",
      author: "Retno Hening Palupi",
      price: "IDR 75K"),
];

List<Recommendations> bestSellerList = [
  Recommendations(
      id: "1",
      title: "Good is not Enough",
      image: "images/good.png",
      author: "Frans Goldena",
      price: "IDR 60K"),
  Recommendations(
      id: "1",
      title: "Nanti Kita Cerita Tentang Hari Ini",
      image: "images/nkchi.png",
      author: "Archella FP",
      price: "IDR 125K"),
  Recommendations(
      id: "1",
      title: "Cinta Dalam Diam",
      image: "images/cinta.jpg",
      author: "Shineeshinka",
      price: "IDR 70K"),
];
