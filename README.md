# Aplicación de Gestión y Venta de Cursos/Eventos Académicos
[![N|Solid](https://i.imgur.com/2ozG5eA.png)](https://nodesource.com/products/nsolid)
Esta aplicación web y móvil permite la gestión y venta de cursos/eventos académicos en la Facultad de Ingeniería en Sistemas, Electrónica e Industrial. Proporciona funcionalidades para administrar la información, inscribirse en eventos, realizar pagos y generar reportes.

## Requisitos previos
- [FlutterFlow:](https://flutterflow.io/) Asegúrate de tener instalado FlutterFlow para el desarrollo de la aplicación móvil del estudiante.
- [React Native:](https://reactnative.dev/) Asegúrate de tener instalado React Native para el desarrollo de la aplicación móvil del docente.
- [Firebase:](https://firebase.google.com/?hl=es) Configura una cuenta de Firebase y crea un proyecto para utilizarlo como base de datos y alojamiento de la aplicación.

## Configuración del entorno

### Aplicación web
Clona este repositorio en tu máquina local
```sh
git clone https://github.com/xHakris/Proyecto-DAS.git
```
Accede al directorio de la aplicación web
```sh
cd aplicacion-web
```
Instala las dependencias
```sh
npm install
```

### Aplicación móvil del estudiante
Clona este repositorio en tu máquina local
```sh
git clone https://github.com/xHakris/Proyecto-DAS.git
```
Accede al directorio de la aplicación móvil del estudiante
```sh
cd aplicacion-movil-estudiante
```
Instala las dependencias
```sh
flutter pub get
```
Configura las credenciales de Firebase
```sh
Agrega el archivo
google-services.json
proporcionado por Firebase en la carpeta 
android/app/
y el archivo 
GoogleService-Info.plist
en la carpeta 
ios/Runner/
```


### Aplicación móvil del docente
Clona este repositorio en tu máquina local
```sh
git clone https://github.com/xHakris/Proyecto-DAS.git
```
Accede al directorio de la aplicación móvil del docente
```sh
cd aplicacion-movil-docente
```
Instala las dependencias
```sh
npm install
```
## Configuración de Firebase
1. Crea un proyecto de Firebase en [https://console.firebase.google.com](https://console.firebase.google.com) si aún no lo has hecho.
2. Configura Firebase Authentication para habilitar la autenticación de usuarios.
3. Configura Firestore para almacenar los datos relacionados con los eventos y usuarios.
4. Configura Firebase Cloud Messaging para enviar notificaciones a los usuarios.

## Ejecución

### Aplicación web
En el directorio de la aplicación web, ejecuta
```sh
npm start
```
Abre tu navegador y accede a [http://localhost:3000](http://localhost:3000) para ver la aplicación en funcionamiento.

### Aplicación móvil del estudiante
En el directorio de la aplicación móvil del estudiante, ejecuta
```sh
flutter run
```
Asegúrate de tener un emulador o un dispositivo físico conectado para ejecutar la aplicación.

### Aplicación móvil del docente
En el directorio de la aplicación móvil del docente, ejecuta
```sh
npx react-native run-android (android) - npx react-native run-ios (iOS)
```
Asegúrate de tener un emulador o un dispositivo físico conectado para ejecutar la aplicación.

## Contribución

Si deseas contribuir a este proyecto, sigue los siguientes pasos:

1. Haz un fork de este repositorio.
2. Crea una rama para tus cambios
```sh
git checkout -b feature/nueva-caracteristica
```
3. Realiza los cambios necesarios y realiza los commits
```sh
git commit -am 'Agrega una nueva característica'
```
4. Envía los cambios a tu repositorio
```sh
git push origin feature/nueva-caracteristica
```
5. Abre un Pull Request en este repositorio.

## Información adicional

Para obtener más detalles sobre la arquitectura, los flujos de la aplicación y otras consideraciones técnicas, consulta la documentación en la carpeta `docs/`.


