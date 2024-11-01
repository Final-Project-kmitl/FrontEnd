import "Product.dart";

List<Map<dynamic, String>> productMock = [
  {
    "ingredient": "Water",
    "Category": "Solvent",
    "Rating": "Good",
    "Benefit": "Hydration"
  },
  {
    "ingredient": "Isopentyldiol",
    "Category": "Humectant, Solvent",
    "Rating": "Good",
    "Benefit": "Hydration"
  },
  {
    "ingredient": "Glycerin",
    "Category": "Humectant,Solvent,Texture Enhancer",
    "Rating": "Best",
    "Benefit": "Anti-Aging,Hydration"
  },
  {
    "ingredient": "1,2-Hexanediol",
    "Category": "Humectant,Preservative,Solvent,Texture Enhancer",
    "Rating": "Not Rated",
    "Benefit": "Hydration"
  },
  {
    "ingredient": "Butylene Glycol",
    "Category": "Humectant,Texture Enhancer",
    "Rating": "Good",
    "Benefit": "Hydration"
  },
  {
    "ingredient": "Betaine",
    "Category": "Humectant",
    "Rating": "Not Rated",
    "Benefit": "Hydration"
  },
  {
    "ingredient": "Hydroxyethylcellulose",
    "Category": "Film-Forming Agent,pH Adjuster/Stabilizer,Texture Enhancer",
    "Rating": "Good",
    "Benefit": ""
  },
  {
    "ingredient": "Ascorbic Acid",
    "Category": "Antioxidant,pH Adjuster/Stabilizer",
    "Rating": "Best",
    "Benefit": "Anti-Aging,Dark Spot Fading,Evens Skin Tone"
  },
  {
    "ingredient": "Sodium Citrate",
    "Category":
        "Antioxidant,Chelating Agent,pH Adjuster/Stabilizer,Preservative",
    "Rating": "Not Rated",
    "Benefit": ""
  },
  {
    "ingredient": "Tromethamine",
    "Category": "pH Adjuster/Stabilizer",
    "Rating": "Average",
    "Benefit": ""
  },
  {
    "ingredient": "Ethylhexylglycerin",
    "Category": "Humectant,Preservative",
    "Rating": "Not Rated",
    "Benefit": "Hydration"
  },
  {
    "ingredient": "Dipotassium Glycyrrhizate",
    "Category": "Antioxidant,Plant Extracts",
    "Rating": "Best",
    "Benefit": "Soothing"
  },
  {
    "ingredient": "Propanediol",
    "Category": "Solvent,Texture Enhancer",
    "Rating": "Good",
    "Benefit": "Hydration"
  },
  {
    "ingredient": "Polyglyceryl-10 Laurate",
    "Category": "Cleansing Agent,Emulsifier,Polymer",
    "Rating": "Good",
    "Benefit": ""
  },
  {
    "ingredient": "Disodium EDTA",
    "Category": "Chelating Agent",
    "Rating": "Good",
    "Benefit": ""
  },
  {
    "ingredient": "Sodium Hyaluronate",
    "Category": "Antioxidant,Humectant",
    "Rating": "Best",
    "Benefit": "Anti-Aging,Hydration,Soothing"
  },
  {
    "ingredient": "Hippophae Rhamnoides Fruit Extract",
    "Category": "Antioxidant,Plant Extracts",
    "Rating": "Best",
    "Benefit": "Anti-Aging,Soothing"
  },
  {
    "ingredient": "Beta-Glucan",
    "Category": "Antioxidant,Plant Extracts,Texture Enhancer",
    "Rating": "Best",
    "Benefit": "Hydration,Soothing"
  },
  {
    "ingredient": "Ascorbyl Glucoside",
    "Category": "Antioxidant",
    "Rating": "Bad",
    "Benefit": "Anti-Aging,Dark Spot Fading,Evens Skin Tone"
  },
  {
    "ingredient":
        "Ascorbyl Glucoside า่ฟ้ืหพ ่่ืฟไ้ำพื ฟร่ajn falwerkj aosifn aes hnalkjf",
    "Category":
        "Antioxidant,akjsfmlakwjermf aosikjfmaskldrfmnalksdaf,aseiptrjmasfklasdmfaskejutoksadgf,asijtmailkfjasioperjasiopfikaspe",
    "Rating": "Bad",
    "Benefit": "Anti-Aging,Dark Spot Fading,Evens Skin Tone"
  },
];

Product mockProdcut = Product(
    productName:
        "INGU Lotus Cleansing Micellar Milk 100 ml. For removing makeup and cleaning face",
    brand: "INGU",
    price: "",
    favorite: false,
    score: "31",
    productImg: "assets/test_img.png",
    ingredients: [
      Ingredient(
          ingredient: "Water",
          category: "Solvent",
          rating: "Good",
          benefit: "Hydration"),
      Ingredient(
          ingredient: "Isopentyldiol",
          category: "Humectant, Solvent",
          rating: "Good",
          benefit: "Hydration"),
      Ingredient(
          ingredient: "Glycerin",
          category: "Humectant,Solvent,Texture Enhancer",
          rating: "Best",
          benefit: "Anti-Aging,Hydration"),
      Ingredient(
          ingredient: "1,2-Hexanediol",
          category: "Humectant,Preservative,Solvent,Texture Enhancer",
          rating: "Not Rated",
          benefit: "Hydration"),
      Ingredient(
          ingredient: "Butylene Glycol",
          category: "Humectant,Texture Enhancer",
          rating: "Bad",
          benefit: ""),
      Ingredient(
          ingredient: "Tromethamine",
          category: "pH Adjuster/Stabilizer",
          rating: "Average",
          benefit: "Soothing"),
    ]);
