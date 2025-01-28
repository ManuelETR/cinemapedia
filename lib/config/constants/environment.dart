//Arhivo de configuración de variables de entorno

import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {

  //Este es el unico lugar donde se deben definir las variables de entorno
  static String theMovieDbKey = dotenv.env['THE_MOVIEDB_API_KEY'] ?? 'No hay API Key';

}