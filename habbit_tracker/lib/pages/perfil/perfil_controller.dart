class UserProfile {
  final String id;
  final String name;
  final String bio;
  final DateTime birthdate;
  final String imageUrl;

  UserProfile({
    required this.id,
    required this.name,
    required this.bio,
    required this.birthdate,
    required this.imageUrl,
  });

  // Métodos adicionales para la actualización y eliminación del perfil del usuario.
}
