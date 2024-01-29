class OnboardingModel {
  String image;
  String title;
  String description;

  OnboardingModel({
    required this.image,
    required this.title,
    required this.description,
  });

  static List<OnboardingModel> onboardingScreens() {
    List<OnboardingModel> screens = [];

    screens.add(
      OnboardingModel(
          image: "assets/on_Boarding_Images/product.svg",
          // image: "/on_Boarding_Images/product.svg",
          title: "Choose Your Product",
          description:
              "Welcome to World of Limitless Choices - Your Perfect Product Awaits!"),
    );

    screens.add(
      OnboardingModel(
          // image: "/on_Boarding_Images/wishlist.svg",
          image: "assets/on_Boarding_Images/wishlist.svg",
          title: "Add in Wishlist",
          description:
              "Add Your Favourites in the Wishlist - Your Favourite Our Favourite!"),
    );

    screens.add(
      OnboardingModel(
          image: "assets/on_Boarding_Images/delivary.svg",
          // image: "/on_Boarding_Images/delivary.svg",
          title: "Delivary At Your Door Step",
          description:
              "From Our Doorstep to Yours-Swift,Secure and Contactless Delivary!"),
    );
    return screens;
  }
}
