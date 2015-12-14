# RQT-GraPharo


## Introducción 
ROS es un framework para el desarrollo de software para robots. Éste se basa en un sistema de nodos que reciben y envían mensajes entre ellos. Actualmente existen herramientas visuales que permiten mostrar al usuario la interacción entre estos nodos, pero presentan algunos problemas que no permiten al usuario entender el sistema de una manera simple y rápida.

Nosotros somos Jorge Ampuero y Pablo Polanco, estudiantes de Ingeniería Civil en Computación de la Universidad de Chile y como proyecto hemos decidido trabajar sobre la visualización de la interacción nodo-tópico en ROS, de forma que realicemos una contribución al software.

Para ello se realizaron varias actividades inicialmente, de manera de conocer y poder identificar los problemas existentes. A continuación se detallarán los resultados de la investigación hecha.

## ¿Qué es RQT-GraPharo?

Es una nueva aplicación hecha en Pharo que pretende imitar y mejorar la funcionalidad existente en rqt_ros

##¿Porque rqt_ros?

En rqt_ros se muestran todos los nodos actualmente operativos y los tópicos relacionados entre ellos. Esto hace que la herramienta sea útil para realizar debugging o entender el funcionamiento básico de los nodos. Pero este sistema tiene ciertas fallas o carencias para realizar un buen debug.

##Problemas detectados 

1. No entrega información de tipos-datos: Si bien se realiza un diagrama donde se muestran las relaciones, no existe forma de saber el tipo de datos que reciben, entregan o a qué corresponde el nodo/tópico. Esto no es problema directamente pero uno de los grandes usos que se le da a rqt_graph es debug, por lo que se vuelve un elemento muy importante en la visualización.

2. Exceso de tópicos/nodos/información en pantalla: rqt_graph da la opción de ocultar los nodos que se encuentran inactivos, pero cuando se realiza debugging de un tópico o nodos específicos y es necesario tener otros nodos activos, estos últimos no desaparecen, imposibilitando al usuario de concentrarse en la relación a trabajar. Esto sucede bajo casos donde el número de nodos y tópicos es muy grande. Además, el exceso de tópicos, nodos y nombres en la pantalla complican y entorpecen la visualización correcta de los elementos objetivo.

3. Datos en tiempo real: Las relaciones que se muestran son estáticas, de forma que no es posible mostrar la información que va pasando a través de los tópicos, así como tampoco es posible ver la data que los nodos reciben o envían.

4. Interacción en tiempo real: Cuando un usuario esta debuggeando un programa trata de enviar información a través de los canales, de forma tal que pueda asegurar la buena conexión entre los nodos. Al usarse rqt_graph como un método de debugging este no entrega una posibilidad de envío de mensajes a través de tópicos, lo cual muestra una falencia en la herramienta a la hora de usarla.

Estos problemas no son completamente cruciales en ROS, pero si retrasan el trabajo de los usuarios (tanto primerizos como quienes utilizan múltiples conexiones entre nodos).

## RQT-GraPharo

 La idea es corregir y agregar las funcionalidades anteriormente planteadas. Para ello se optó como primera opción modificar rqt_graph, pero esto conduce a realizar modificaciones en diferentes niveles de ROS además de problemáticas con la adquisición de información en tiempo real, por lo que se descartó.
 
 Como una de las mayores problemáticas son los cambios en el tiempo, se decidió crear una aplicación en Pharo de forma que alteración en la información presente sea fácilmente visualizable.
 
 Esta nueva interfaz gráfica debe conservar las funcionalidades implementadas por rqt_graph y agregar algunas de las provistas por ros topic como ros topic echo o ros topic list.

Las funcionalidades pensadas para la interfaz son las siguientes:
* Poder seleccionar los tópicos más usados y así poder filtrar algunos nodos que no son relevantes.

* Poder mostrar/esconder la información de cada nodo dependiendo de lo que el usuario desee.

* Poder visualizar los datos transmitidos por los nodos en tiempo real.

* Poder buscar un nodo/tópico en específico.

* Poder ver de manera detallada la información del tipo de mensaje y los mensajes publicados.

* Poder enviar mensajes desde la interfaz.

## Instalación

Se provee el archivo imagen executable de pharo en el repositorio github para llegar y utilizar en linux.
Esta imagen viene con las dependencias ya instaladas.

En caso de ejecutar en otro sistema operativo exportar el .st con la clase  RQT-Pharo, para instalar se requiere instalar las dependecias de Roassal2 (versión estable), OSProcess (versión estable).

Ademas se debe agregar el siguiente repositorio e instalar los paquetes del cliente y executar la configuración para instalar sus dependencias.

```
MCHttpRepository
    location: 'http://ss3.gemstone.com/ss/XMLRPC'
    user: ''
    password: ''
   
```

Esto fue probado en ubuntu 14.04 de 64bits y windows 10 .


##Ejecución

Para ejecutarlo sólo debe estar corriendo ros y luego ejecutar en un playground lo  siguiente:
```
PhaRos new.
```

Al hacerlo se abrirá una ventana con la aplicación que graficará automáticamente las conexiones entre nodos y tópicos por lo que el usuario puede ocuparlo sin tener que ejecutar ningún otro comando.


##Extensiones.

Si se desea implementar alguna funcionalidad extra, se puede hacer de manera bastante sencilla, para esto basta entender los distintos objetos existentes:

* Adapter : Se encarga de la extracción de datos desde ros a objetos en Pharo.
* DataWindow: Es la ventana que se crea cuando se hace click en un nodo/tópico
* Graph : Es el objeto Roassal que genera el grafo.
* HideWindow: Es la ventana que se crea cuando se hace click en nodes/topics para esconder/ver nodos/tópicos.
* Node: Objeto Nodo.
* Pharos: aplicación principal que se encarga de crear los objetos para la visualización de la aplicación.
* ROSAPI: api para conectar Pharo con ros.
* RQTGMainWindow: ventana principal de la aplicación.
* TestingGraph: test del grafo.
* Topic: Objeto Nodo.


