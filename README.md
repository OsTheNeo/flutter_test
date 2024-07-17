# Cat Breeds

Cat Breeds es una aplicación Flutter que permite a los usuarios buscar y visualizar información sobre diferentes razas de gatos. La aplicación consume una API externa para obtener datos sobre las razas de gatos y los muestra de manera interactiva y visualmente atractiva.

## Descripción del Proyecto

Este proyecto fue desarrollado para proporcionar una referencia detallada y visual sobre las diversas razas de gatos. Los usuarios pueden buscar razas específicas, ver detalles sobre cada raza y acceder a imágenes relacionadas.

### Funcionalidades

- **Pantalla de Inicio:** Presenta un logo y una pantalla de bienvenida.
- **Pantalla de Búsqueda:** Permite a los usuarios buscar razas de gatos por nombre.
- **Pantalla de Detalles:** Muestra información detallada sobre la raza seleccionada.
- **Integración con API:** Consume datos de una API externa para obtener información actualizada sobre las razas de gatos.
- **Gestión de Estado con BLoC:** Utiliza el patrón BLoC para la gestión del estado de la aplicación.
- **Imágenes Cacheadas:** Usa `cached_network_image` para manejar y cachear imágenes de manera eficiente.

### Estructura del Proyecto

- **main.dart:** Punto de entrada de la aplicación.
- **landing_screen.dart:** Pantalla de bienvenida que se muestra al iniciar la aplicación.
- **splash_screen.dart:** Pantalla de splash que se muestra brevemente al iniciar la aplicación.
- **search_bar.dart:** Barra de búsqueda para que los usuarios puedan buscar razas de gatos.
- **cat_breed_card.dart:** Componente de tarjeta que muestra información resumida sobre cada raza de gato.
- **detail_screen.dart:** Pantalla que muestra información detallada sobre una raza de gato seleccionada.
- **cat_repository.dart:** Clase que maneja la obtención de datos desde la API.
- **cat_api_service.dart:** Servicio que realiza las llamadas HTTP a la API externa.
- **cat_breeds_bloc.dart, cat_breeds_event.dart, cat_breeds_state.dart:** Archivos relacionados con la implementación del patrón BLoC.
- **theme.dart:** Configuración de temas para la aplicación.
- **constants.dart:** Archivo que contiene constantes usadas en la aplicación.

### Tests

El proyecto incluye varios tests unitarios y de widgets para asegurar el correcto funcionamiento de la aplicación.

- **cat_repository_test.dart:** Tests para el repositorio de datos.
- **cat_breed_test.dart:** Tests para el modelo de datos de razas de gatos.
- **cat_breeds_bloc_test.dart:** Tests para el BLoC de razas de gatos.
- **cat_breed_card_test.dart:** Tests para el componente de tarjeta de raza de gatos.
- **search_bar_test.dart:** Tests para la barra de búsqueda.
- **app_test.dart:** Tests generales de la aplicación.

### Dependencias

Las principales dependencias utilizadas en el proyecto son:

- `flutter`: SDK de Flutter.
- `http`: Para realizar solicitudes HTTP.
- `flutter_bloc`: Para la gestión del estado usando BLoC.
- `equatable`: Para facilitar comparaciones de objetos.
- `cached_network_image`: Para manejar y cachear imágenes.
- `integration_test`, `bloc_test`, `mockito`, `build_runner`: Para pruebas y generación de código.

### Instalación y Uso

1. Clona el repositorio.
2. Navega al directorio del proyecto.
3. Instala las dependencias usando `flutter pub get`.
4. Corre la aplicación usando `flutter run`.

```sh
git clone <url-del-repositorio>
cd catbreeds
flutter pub get
flutter run
