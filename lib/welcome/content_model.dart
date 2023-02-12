class UnbordingContent {
  String image;
  String title;
  String discription;

  UnbordingContent(
      {required this.image, required this.title, required this.discription});
}

List<UnbordingContent> contents = [
  UnbordingContent(
      title: 'Bienvenue',
      image: 'images/push_services_med.png',
      discription: "Prenez rendez-vous avec votre"
          "médecin "),
  UnbordingContent(
      title: "Déplacez le docteur",
      image: 'images/medecin-gps.png',
      discription: "Profitez de la fonction de transport"
          "du médecin vers votre zone de"
          "résidence ! "),
  UnbordingContent(
      title: 'rechercher Doctor',
      image: 'images/find medcine.png',
      discription:
          "Trouvez votre médecin "
         "facilement .")
];
