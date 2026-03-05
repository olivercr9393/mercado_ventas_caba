Evolución del mercado de ventas de inmuebles en CABA (2018-2025): análisis de precios por m2, barrios y tipos de vivienda.

1. Contexto

El mercado de compra/venta en la Ciudad Autónoma de Buenos Aires ha sufrido una marcada volatilidad en el periodo de análisis de este proyecto (2018-2025), reflejando un retroceso en los precios debido al contexto económico y posteriores recuperaciones nominales.

Hay que destacar que el contexto macroeconómico y regulatorio influyó en la dinámica del mercado, sin embargo, este análisis se centra exclusivamente en la evolución cuantitativa de los precios.

Este análisis busca ser de utilidad para todos aquellos que deseen comprender la transformación del mercado de compra/venta y tomar decisiones basadas en él.

2. Objetivo del proyecto

El objetivo principal es analizar la evolución del mercado de compra/venta de departamentos de 1, 2 y 3 ambientes en CABA y responder las siguientes preguntas:

¿Cómo evolucionó el precio del m2 en CABA desde el 2018-2025 según la cantidad de ambientes y estado del inmueble?

¿Cuáles han sido históricamente los barrios más caros y más baratos para comprar por m2 en dólares?

¿Cuáles han sido históricamente los barrios más caros y más baratos para comprar por m2 en dólares según su estado (nuevo/usado)?

¿Cuáles han sido históricamente los barrios más caros y más baratos para comprar por m2 en dólares según los ambientes (1, 2 y 3)?

¿Cuáles han sido históricamente los barrios más caros y más baratos para comprar por m2 en dólares según los ambientes (1, 2 y 3) y el estado (nuevo y usados)?

¿Cuánta diferencia porcentual de precio existe entre un apartamento nuevo y usado por m2 en dólares?

¿Cuáles son HOY los barrios más caros y baratos para comprar?

El foco de esta investigación no está en solo describir precios, sino en entender la dinámica del mercado y comprender qué le puede convenir a cada persona según sus necesidades económicas.

3. Fuentes de datos.

Los datos públicos oficiales utilizados provienen del Instituto De Estadística y Censos de la Ciudad Autónoma de Buenos Aires (IDECBA) con un historial desde 2018 a 2025, los cuales se construyen a partir de datos de los principales portales inmobiliarios, para fines de esta investigación nos basamos en:

•	Precio promedio del m2 de departamentos en venta de 1 ambiente a estrenar por barrio.

•	Precio promedio del m2 de departamentos en venta de 2 ambientes a estrenar por barrio.

•	Precio promedio del m2 de departamentos en venta de 3 ambientes a estrenar por barrio.

•	Precio promedio del m2 de departamentos en venta de 1 ambiente usados por barrio.

•	Precio promedio del m2 de departamentos en venta de 2 ambientes usados por barrio.

•	Precio promedio del m2 de departamentos en venta de 3 ambientes usados por barrio.

•	Tiempo medio de publicación de departamentos en venta por cantidad de ambientes.

Todos los datasets descargados fueron previamente limpiados en una hoja de cálculo de Excel por medio de Power Query y estandarizados para su posterior análisis, no se alteró ningún valor original ni se imputó algún dato faltante.

Los valores expresados en los datasets están expresados en dólares estadounidenses (USD).

Nota: Los datos representan precios promedio de publicación por m2 y no precios efectivos de cierre.

4. Metodología

4.1.	Limpieza de datos

-	Se eliminaron filas descriptivas y encabezados no estructurados en Excel ya que no aportaban valor analítico a la posterior limpieza.
  
-	Se eliminaron las filas de barrios donde había más de un 40% de datos faltantes, esto con el objetivo de reducir sesgos derivados de series temporales incompletas.
  
-	Cambio de orientación, de filas a columnas. El dataset original tiene los datos para mostrarlo en un formato estadístico, pero poco práctico para la limpieza y posterior análisis, por lo que se procedió en Power Query por medio de un pivot a cambiar la ubicación de los datos sin alterar su contenido ni agregar ni modificar dígitos.
  
-	Los seis datasets sobre barrios fueron unificados en una tabla analítica con nombre ‘compra_barrios’. Se agregaron ambientes, trimestres y estado (nuevo o usado) como columnas para una mejor comprensión en el análisis y simplificar las consultas en SQL.
  
-	Validación de datos faltantes y duplicados, no se encontraron datos duplicados, pero se sustituyeron los datos faltantes ‘///’ por un ‘NULL’ para su correcta interpretación en SQL y Power BI.
  
4.2.	Modelado de datos.

Los datos fueron modelados en una estructura tabular normalizada por medio de Power Query, para que cada fila representara una observación única, de esta forma el análisis es más comprensible en cada consulta de MySQL.

Las bases de datos correspondientes a 1, 2 y 3 ambientes fueron unificadas en una sola tabla por medio de la variable “ambientes” y “estado” en SQL para facilitar el análisis comparativo entre tipos de unidades.

Esta decisión se hizo para facilitar las consultas en SQL y su posterior visualización en Power BI.

4.3.	Análisis exploratorio.

En esta etapa se exploraron patrones generales, diferencias territoriales y comportamientos relativos entre tipos de unidades.

-	Comparaciones por barrios, ambientes y estado general del departamento.

-	Variaciones porcentuales.

-	Establecer rankings con los datos.

4.4.	Visualización.

-	Dashboard interactivo desarrollado en Power BI permitiendo filtros por barrios, ambiente y periodo.

-	Enfoque narrativo orientado a la toma de decisiones personales y comparativas de mercado.

5. Resultados

5.1. ¿Cómo evolucionó el precio del m2 en CABA desde el 2018-2025 según su cantidad de ambientes y estado del inmueble?
Para responder a esta pregunta, primero tomamos en cuenta la evolución del precio por m2, es decir hacemos un promedio de los precios por año, con esa variable tenemos que:

| Año  | Precio promedio (USD/m2) |
|------|--------------------------|
| 2018 | 2.907                    |
| 2019 | 2.893                    |
| 2020 | 2.722                    |
| 2021 | 2.481                    |
| 2022 | 2.289                    |
| 2023 | 2.228                    |
| 2024 | 2.337                    |
| 2025 | 2.465                    |

Se puede apreciar una caída acumulada entre el 2018 y 2023, reflejando un ajuste real del mercado. A partir del 2024 al 2025 muestra señales de recuperación con una tendencia alcista.

Nota: esta respuesta puede contener mucha información general al no segmentar la consulta con otras variables, pero es útil para un primer vistazo sobre la evolución de los precios.

Luego, para entender mejor esta tendencia debemos hacer un promedio del precio por m2 pero segmentando la consulta por el estado del inmueble:

| Año  | Estado | Precio promedio (USD/m2) |
|------|--------|--------------------------|
| 2018 | Nuevo  | 3.271                    |
| 2018 | Usado  | 2.738                    |
| 2019 | Nuevo  | 3.249                    |
| 2019 | Usado  | 2.727                    |
| 2020 | Nuevo  | 3.082                    |
| 2020 | Usado  | 2.558                    |
| 2021 | Nuevo  | 2.850                    |
| 2021 | Usado  | 2.316                    |
| 2022 | Nuevo  | 2.665                    |
| 2022 | Usado  | 2.115                    |
| 2023 | Nuevo  | 2.585                    |
| 2023 | Usado  | 2.060                    |
| 2024 | Nuevo  | 2.766                    |
| 2024 | Usado  | 2.136                    |
| 2025 | Nuevo  | 2.978                    |
| 2025 | Usado  | 2.233                    |
  
Mientras que en 2018 un departamento nuevo costaba en promedio 3271usd por m2 en el 2025 costaba 2978usd por m2. Aunque a simple vista veamos que se haya reducido, la tendencia actual va en crecimiento debido a los datos a partir del 2024.

Ahora podemos hacer un promedio del precio por m2 pero en esta ocasión segmentando la consulta por la cantidad de ambientes del inmueble (1, 2 y 3 ambientes), encontramos que:


| Año  | Ambientes | Precio promedio (USD/m2) |
|------|-----------|--------------------------|
| 2018 | 1         | 3.079                    |
| 2018 | 2         | 2.910                    |
| 2018 | 3         | 2.802                    |
| 2019 | 1         | 3.049                    |
| 2019 | 2         | 2.899                    |
| 2019 | 3         | 2.780                    |
| 2020 | 1         | 2.819                    |
| 2020 | 2         | 2.727                    |
| 2020 | 3         | 2.636                    |
| 2021 | 1         | 2.533                    |
| 2021 | 2         | 2.489                    |
| 2021 | 3         | 2.423                    |
| 2022 | 1         | 2.338                    |
| 2022 | 2         | 2.290                    |
| 2022 | 3         | 2.243                    |
| 2023 | 1         | 2.267                    |
| 2023 | 2         | 2.236                    |
| 2023 | 3         | 2.186                    |
| 2024 | 1         | 2.404                    |
| 2024 | 2         | 2.358                    |
| 2024 | 3         | 2.254                    |
| 2025 | 1         | 2.534                    |
| 2025 | 2         | 2.490                    |
| 2025 | 3         | 2.377                    |



En esta consulta podemos observar el decrecimiento del precio en los periodos 2018-2023 y luego un aumento desde el 2024-2025.

Tras los resultados de las 2 consultas anteriores, podemos unificar ambas para poder apreciar aún más la tendencia de la manera más segmentada posible, para eso necesitamos calcular los precios promedio por periodo entre el 2018 y 2025, segmentando la consulta por cantidad de ambientes y estado del inmueble, de esta forma podemos obtener un panorama más claro y detallado sobre las diferencias, bajo ese concepto tenemos:


| Año  | Ambientes | Estado | Precio promedio (USD/m2) |
|------|-----------|--------|--------------------------|
| 2018 | 1         | Nuevo  | 3.157                    |
| 2018 | 1         | Usado  | 3.018                    |
| 2018 | 2         | Nuevo  | 3.202                    |
| 2018 | 2         | Usado  | 2.762                    |
| 2018 | 3         | Nuevo  | 3.507                    |
| 2018 | 3         | Usado  | 2.595                    |
| 2019 | 1         | Nuevo  | 3.182                    |
| 2019 | 1         | Usado  | 2.970                    |
| 2019 | 2         | Nuevo  | 3.194                    |
| 2019 | 2         | Usado  | 2.752                    |
| 2019 | 3         | Nuevo  | 3.386                    |
| 2019 | 3         | Usado  | 2.564                    |
| 2020 | 1         | Nuevo  | 3.055                    |
| 2020 | 1         | Usado  | 2.700                    |
| 2020 | 2         | Nuevo  | 3.048                    |
| 2020 | 2         | Usado  | 2.569                    |
| 2020 | 3         | Nuevo  | 3.157                    |
| 2020 | 3         | Usado  | 2.440                    |
| 2021 | 1         | Nuevo  | 2.800                    |
| 2021 | 1         | Usado  | 2.412                    |
| 2021 | 2         | Nuevo  | 2.810                    |
| 2021 | 2         | Usado  | 2.331                    |
| 2021 | 3         | Nuevo  | 2.951                    |
| 2021 | 3         | Usado  | 2.214                    |
| 2022 | 1         | Nuevo  | 2.599                    |
| 2022 | 1         | Usado  | 2.213                    |
| 2022 | 2         | Nuevo  | 2.619                    |
| 2022 | 2         | Usado  | 2.127                    |
| 2022 | 3         | Nuevo  | 2.790                    |
| 2022 | 3         | Usado  | 2.018                    |
| 2023 | 1         | Nuevo  | 2.503                    |
| 2023 | 1         | Usado  | 2.156                    |
| 2023 | 2         | Nuevo  | 2.545                    |
| 2023 | 2         | Usado  | 2.074                    |
| 2023 | 3         | Nuevo  | 2.717                    |
| 2023 | 3         | Usado  | 1.965                    |
| 2024 | 1         | Nuevo  | 2.687                    |
| 2024 | 1         | Usado  | 2.273                    |
| 2024 | 2         | Nuevo  | 2.732                    |
| 2024 | 2         | Usado  | 2.164                    |
| 2024 | 3         | Nuevo  | 2.882                    |
| 2024 | 3         | Usado  | 1.991                    |
| 2025 | 1         | Nuevo  | 2.883                    |
| 2025 | 1         | Usado  | 2.381                    |
| 2025 | 2         | Nuevo  | 2.962                    |
| 2025 | 2         | Usado  | 2.258                    |
| 2025 | 3         | Nuevo  | 3.084                    |
| 2025 | 3         | Usado  | 2.077                    |


Al igual que en las consultas anteriores, desde el 2018 al 2023 hubo una caída en el valor del m2, pero luego a partir del 2024 los precios comienzan a recuperarse.

Se puede observar que los departamentos nuevos mantienen mejor el valor, los usados caen más rápido y se recuperan más lento, esta tendencia la podemos observar con mayor claridad en el último cuadro, para eso fue necesario hacer las consultas anteriores.

Los de 1 ambiente fluctúan más rápido mientras que los 3 ambientes son más estables, esto nos sugiere que las unidades más pequeñas son más sensibles al contexto económico y cambios en la demanda.

Esta tendencia puede interpretarse como que el mercado presenta hoy una buena oportunidad para comprar un departamento, teniendo en cuenta que el mercado aún no se ha recuperado a los niveles de inicios del 2018, primer año de estudio de este proyecto.

5.2. ¿Cuáles han sido históricamente los barrios más caros y más baratos para comprar por m2 en dólares?

Para responder a esta pregunta debemos establecer un ranking por cada variante sobre el promedio del valor, y los principales hallazgos fueron:

Top 5 barrios más caros:

•	Barrio Puerto Madero con un valor histórico de 5.670 USD por m2.

•	Barrio Palermo con un valor de 3.385 USD por m2.

•	Barrio Belgrano con un valor de 3.297 USD por m2.

•	Barrio Recoleta con un valor de 3.223 USD por m2.

•	Barrio Núñez con un valor de 3.200 USD por m2.

Top 5 barrios más baratos:

•	Barrio Villa Lugano con un valor histórico de 1.075 USD por m2.

•	Barrio Nueva Pompeya con un valor de 1.505 USD por m2.

•	Barrio Boca con un valor de 1.628 USD por m2.

•	Barrio Parque Avellaneda con un valor de 1.636 USD por m2.

•	Barrio Constitución con un valor de 1.719 USD por m2.

Podemos concluir en base a los resultados de esta consulta que la parte norte de la ciudad es más cara que la parte sur.

Esta tendencia puede interpretarse como que el mercado ofrece inmuebles más accesibles en la parte sur de la ciudad, ideal para aquellas personas que no cuentan con una alta capacidad de compra.

Nota: Esta respuesta se basa en una tendencia general de precios, poco práctico para variables más específicas.

5.3. ¿Cuáles han sido históricamente los barrios más caros y más baratos para comprar por m2 en dólares según su estado (nuevo/usado)?

Para responder a esta pregunta debemos establecer un ranking por estado del inmueble, y los principales hallazgos fueron:

Para los departamentos nuevos más caros:

•	Barrio Palermo con un valor por m2 de 3.661 USD

•	Barrio Belgrano con un valor por m2 de 3.613 USD

•	Barrio Recoleta con un valor por m2 de 3.544 USD

•	Barrio Núñez con un valor por m2 de 3.381 USD

•	Barrio Colegiales con un valor por m2 de 3.227 USD

Para los departamentos usados más caros:

•	Barrio Puerto Madero con un valor por m2 de 5.670 USD

•	Barrio Palermo con un valor por m2 de 3.115 USD

•	Barrio Núñez con un valor por m2 de 3.029 USD

•	Barrio Belgrano con un valor por m2 de 2.985 USD

•	Barrio Recoleta con un valor por m2 de 2.906 USD

Para los departamentos nuevos más baratos:

•	Barrio San Cristóbal con un valor por m2 de 2.273 USD

•	Barrio Monte Castro con un valor por m2 de 2.409 USD

•	Barrio Mataderos con un valor por m2 de 2.475 USD

•	Barrio Villa Luro con un valor por m2 de 2.500 USD

•	Barrio Liniers con un valor por m2 de 2.509 USD

Para los departamentos usados más baratos:

•	Barrio Villa Lugano con un valor por m2 de 1.075 USD

•	Barrio Nueva Pompeya con un valor por m2 de 1.505 USD

•	Barrio Boca con un valor por m2 de 1.628 USD

•	Barrio Parque Avellaneda con un valor por m2 de 1.636 USD

•	Barrio Constitución con un valor por m2 de 1.719 USD

Al igual que en la respuesta 5.2, los departamentos más caros se ubican generalmente en la parte norte de la Ciudad, mientras que los más baratos son los que están en la parte sur.

Además, en esta consulta se ve con mayor claridad la diferencia de precios entre un departamento nuevo y usado. Cuanto más nuevo es el inmueble conserva un mayor valor, independientemente de la ubicación.

Nota: Puede haber barrios no incluidos en la lista, esto debido a que, por la naturaleza de los datasets, que se dividen individualmente por barrio y ambiente, hay muchos datos faltantes, para efectos de este análisis se excluyeron los barrios con más de 40% por datos faltantes.

5.4. ¿Cuáles han sido históricamente los barrios más caros y más baratos para comprar por m2 en dólares según los ambientes (1, 2 y 3)?

Para responder a esta pregunta debemos establecer un ranking por cantidad de ambientes, y los principales hallazgos fueron:

Departamentos de 1 ambientes más caros:

•	Barrio Palermo con 3.345 USD

•	Barrio Belgrano con 3.299 USD

•	Barrio Recoleta con 3.249 USD

Departamentos de 1 ambientes más baratos:

•	Barrio Boca con 1.723 USD.

•	Barrio Floresta con 1.997 USD.

•	Barrio Constitución con 2.012 USD.

Departamentos de 2 ambientes más caros:

•	Barrio Puerto Madero con 5.802 USD

•	Barrio Palermo con 3.374 USD

•	Barrio Belgrano con 3.290 USD

Departamentos de 2 ambientes más baratos:

•	Barrio Nueva Pompeya con 1.505 USD

•	Barrio Boca con 1.630 USD

•	Barrio Constitución con 1.660 USD

Departamentos de 3 ambientes más caros:

•	Barrio Puerto Madero con 5.527 USD

•	Barrio Palermo con 3.435 USD

•	Barrio Belgrano con 3.303 USD

Departamentos de 3 ambientes más baratos:

•	Barrio Villa Lugano con 1.075 USD

•	Barrio Nueva Pompeya con 1.505 USD

•	Barrio Constitución con 1.506 USD

Al igual que las dos respuestas anteriores, podemos observar que los barrios donde se conserva un mayor valor están en la parte norte, caso contrario en la parte sur.

5.5. ¿Cuáles han sido históricamente los barrios más caros y más baratos para comprar por m2 en dólares según los ambientes (1, 2 y 3) y el estado (nuevo y usados)?

Para responder a esta pregunta debemos segmentar por cantidad de ambientes y el estado del inmueble, utilizando el valor promedio entre 2018 y 2025, así que tenemos como resultado:

Departamentos nuevos de 1 ambiente.

Más baratos:

•	Barrio San Cristóbal con 2.277 USD

•	Barrio Villa Luro con 2.358 USD

•	Barrio Flores con 2.431 USD.

Más caros:

•	Barrio Recoleta con 3.482 USD

•	Barrio Belgrano con 3.469 USD

•	Barrio Palermo con 3.466 USD

Departamentos usados de 1 ambiente.

Más baratos:

•	Barrio Boca con 1.723 USD

•	Barrio Liniers con 1.993 USD

•	Barrio Floresta con 1.997 USD

Más caros:

•	Barrio Palermo con 3.231 USD

•	Barrio Núñez con 3.141 USD

•	Barrio Belgrano con 3.134 USD

Departamentos nuevos de 2 ambientes.

Más baratos:

•	Barrio San Cristóbal con 2.270 USD

•	Barrio Monte Castro con 2.409 USD

•	Barrio Mataderos con 2.459 USD

Más caros:

•	Barrio Recoleta con 3.687 USD

•	Barrio Belgrano con 3.610 USD

•	Barrio Palermo con 3.609 USD

Departamentos usados de 2 ambientes.

Más baratos: 

•	Barrio Nueva Pompeya con 1.505 USD

•	Barrio Boca con 1.630 USD

•	Barrio Constitución con 1.660 USD

Más caros:

•	Barrio Puerto Madero con 5.802 USD

•	Barrio Palermo con 3.140 USD

•	Barrio Núñez con 3.050 USD

Departamentos nuevos de 3 ambientes.

Más baratos:

•	Barrio Balvanera con 2.484 USD

•	Barrio Mataderos con 2.491 USD

•	Barrio Villa del Parque con 2.575 USD

Más caros:

•	Barrio Palermo con 3.896 USD

•	Barrio Belgrano con 3.754 USD

•	Barrio Recoleta con 3.468 USD

Departamentos usados de 3 ambientes.

Más baratos:

•	Barrio Villa Lugano con 1.075 USD

•	Barrio Nueva Pompeya con 1.505 USD

•	Barrio Constitución con 1.506 USD

Más caros:

•	Barrio Puerto Madero con 5.527 USD

•	Barrio Palermo con 2.973 USD

•	Barrio Núñez con 2.904 USD

En esta sección podemos detallar la segmentación de la ciudad y la diferencia de precios existentes entre las distintas variables a la hora de elegir inmuebles. Es decir, la parte norte de la ciudad es donde se ubican generalmente las unidades más elevadas en precio, por otro lado, la parte sur es la más accesible.

Esta puede ser una buena oportunidad para aquellas personas que deseen invertir en inmuebles, la zona sur de la ciudad se encuentra en crecimiento y expansión y con el tiempo se pueden ver precios más elevados en estas zonas, pero esto no es competente para el análisis actual, simplemente es una observación.

5.6. ¿Cuánta diferencia porcentual de precio existe entre un apartamento nuevo y usado por m2 en dólares?

Tomando en cuenta todo el periodo de análisis, encontramos que un departamento nuevo en promedio vale 2.906USD por m2, mientras que uno usado vale 2.340USD por m2, marcando una diferencia porcentual de 24.21%.

Esta variación es general, no toma en cuenta ambientes ni estado del inmueble. Para tener esa variable debemos preguntarnos: ¿Cuánta diferencia de precio existe entre el estado de un departamento y la cantidad de ambientes por m2 en dólares?

Podemos encontrar que:

| Ambientes | Precio nuevo (USD/m2) | Precio usado (USD/m2) | Diferencia (USD) | Diferencia (%) |
|-----------|-----------------------|-----------------------|------------------|----------------|
| 1         | 2.835                 | 2.450                 | 385              | 15,71%         |
| 2         | 2.869                 | 2.365                 | 504              | 21,31%         |
| 3         | 3.026                 | 2.231                 | 795              | 35,63%         |

Para cuantificar esta diferencia entre nuevos y usados, se calcularon precios promedios históricos del m2 entre 2018 y 2025, segmentados por cantidad de ambientes.

Y podemos agregar una pregunta adicional para conocer el estado actual del mercado: ¿Cuánta diferencia de precio existe entre el estado de un departamento y la cantidad de ambientes por m2 en dólares HOY?

A partir de ahí encontramos:

| Ambientes | Precio nuevo (USD/m2) | Precio usado (USD/m2) | Diferencia (USD) | Diferencia (%) |
|-----------|-----------------------|-----------------------|------------------|----------------|
| 1         | 2.901                 | 2.390                 | 511              | 21,38%         |
| 2         | 3.005                 | 2.261                 | 744              | 32,91%         |
| 3         | 3.168                 | 2.081                 | 1.087            | 52,23%         |

Para analizar las diferencias actuales de precio por m2, se calcularon precios promedio del año 2025, segmentando por el estado del inmueble según la cantidad de ambientes. 

Estas diferencias reflejan una prima de valor asociada al estado del inmueble, que se amplifica a medida que aumenta la cantidad de ambientes, es decir, las unidades nuevas aumentan proporcionalmente con la cantidad de ambientes.

Es decir, la diferencia de precio entre un departamento nuevo y usado de 1 ambiente suele ser menor que la misma diferencia, pero en departamentos de 3 ambientes.

Nota: Las diferencias se hacen entre precios promedio, por lo que en la realidad puede haber una mayor o menor diferencia, dependiendo del estado y la condición del inmueble.

Ahora, para saber la diferencia entre un departamento nuevo y usado por barrio tomamos en cuenta los siguientes:

Entre los barrios con mayor variación entre el estado del inmueble encontramos:

•	Barrio Recoleta hay una diferencia marcada de 638 USD entre usado/nuevo.

•	Barrio Belgrano hay una diferencia de 627 USD entre usado/nuevo.

•	Barrio Mataderos hay una diferencia de 587 USD entre usado/nuevo.

•	Barrio Montserrat hay una diferencia de 579 USD entre usado/nuevo.

•	Barrio Balvanera hay una diferencia de 564 USD entre usado/nuevo.

Entre los barrios con menos variación entre el estado del inmueble encontramos:

•	Barrio Saavedra con una diferencia de 166 USD entre nuevo/usado.

•	Barrio Coghlan con una diferencia de 179 USD entre nuevo/usado.

•	Barrio Monte Castro con una diferencia de 216 USD entre nuevo/usado.

•	Barrio Villa Urquiza con 235 USD entre nuevo/usado.

•	Barrio Villa del Parque con 237 USD entre nuevo/usado.

En esta variante en específica, podemos apreciar que las diferencias de precio mayores no suelen estar concentradas en una posición geográfica de la ciudad, están repartidas en distintas zonas.

Caso contrario a los que tienen menor variación, que están ubicadas en la parte noroeste de la ciudad.

Nota: Debido al faltante de datos en algunos datasets puede haber barrios que no se incluyan acá.

5.7. ¿Cuáles son los barrios más caros y baratos para comprar hoy en día?

Para responder a esta pregunta debemos ver cuáles son los valores del último trimestre del último año de estudio, y nos encontramos con que: 

Departamentos de 1 ambientes más caros:

•	Barrio Palermo con 3.730 USD

•	Barrio Núñez con 3.536 USD

•	Barrio Belgrano con 3.534 USD

Departamentos de 1 ambientes más baratos:

•	Barrio Boca con 1.542 USD.

•	Barrio Floresta con 1.995 USD.

•	Barrio Barracas con 2.001 USD.

Departamentos de 2 ambientes más caros:

•	Barrio Puerto Madero con 5.915 USD

•	Barrio Belgrano con 3.939 USD

•	Barrio Palermo con 3.834 USD

Departamentos de 2 ambientes más baratos:

•	Barrio Nueva Pompeya con 1.391 USD

•	Barrio Boca con 1.515 USD

•	Barrio Constitución con 1.614 USD

Departamentos de 3 ambientes más caros:

•	Barrio Puerto Madero con 5.719 USD

•	Barrio Palermo con 4.205 USD

•	Barrio Núñez con 3.959 USD

Departamentos de 3 ambientes más baratos:

•	Barrio Villa Lugano con 998 USD

•	Barrio Constitución con 1.335 USD

•	Barrio Boca con 1.366 USD

Podemos concluir que los departamentos más caros están concentrados en la parte norte de la ciudad con diferencia, los más baratos suelen estar al sur de la ciudad.

Esto puede ser de relevancia para las personas con poco capital para comprar y buscan las opciones en zonas más accesibles.

Nota: ‘Hoy en día’ representa al último trimestre disponible del año 2025, esto debido a la naturaleza del dataset.

5.8. ¿Cuánto tiempo duran publicados los departamentos según su ambiente?

Para responder a esta pregunta tomamos en cuenta el promedio histórico por cada tipo de ambiente, esto permite identificar los movimientos de rotación promedio en el mercado.

| Ambientes   | Días promedio publicado |
|-------------|-------------------------|
| 1 ambiente  | 311                     |
| 2 ambientes | 312                     |
| 3 ambientes | 306                     |

Pero si queremos analizar la situación actual del mercado, debemos calcular el tiempo promedio de publicación de los departamentos por tipo de ambiente, considerando únicamente el último año disponible en la base de datos.

| Ambientes   | Días promedio publicado |
|-------------|-------------------------|
| 1 ambiente  | 297                     |
| 2 ambientes | 323                     |
| 3 ambientes | 325                     |

En promedio los departamentos tardan alrededor de 300 días en ser concretados o no.

Esta información puede ser de utilidad para las personas que deseen vender una propiedad y quieran saber cuánto tiempo tardan las publicaciones en promedio hasta que se vendan o se retiren de los portales.

Nota: estos son días de publicación, entre las estadísticas puede haber días específicos de cierres o días donde fue excluida una publicación, que no quiere decir que se vendió exclusivamente.

6. Insights

Los hallazgos más relevantes son:

•	El mercado de compra/venta en CABA experimentó una caída progresiva en precios entre el 2018 y 2023.

•	A partir de 2024 comenzó una recuperación parcial, aunque no ha alcanzado los niveles de 2018.

•	Los departamentos nuevos mantienen mejor el valor en el tiempo frente a los usados.

•	Las unidades de 1 ambiente son las que muestran mayor volatilidad, las más estables son las unidades de 3 ambientes.

•	Existe una clara segmentación territorial norte-sur en valores por m2.

•	Puerto Madero es el barrio más caro tanto históricamente como actual, por otro lado, las unidades más bajas se encuentran generalmente al sur. 

•	La brecha de precios entre nuevos y usados aumenta a medida que aumenta la cantidad de ambientes.

•	En 2025, los precios nominales reflejan una leve recuperación, pero aún se mantienen por debajo de los precios al inicio del periodo de análisis (2018).

•	En el periodo histórico todas las unidades permanecían casi el mismo tiempo publicadas, en el último año las unidades más grandes permanecieron más tiempo publicadas.

7. Limitaciones

Como estos datos son extraídos de portales inmobiliarios (Argenprop) y recogidos por el IDECBA nos encontramos con las siguientes limitaciones:

•	Los valores de todos los datasets que se dividen por barrio son por m2, estos son precios promedio, no precios finales de publicación y puede variar mucho según el tamaño de un inmueble.

•	Los valores promedios del m2 analizados corresponden a valores de publicación, pero no son valores finales de cierre, que pueden ser muy cambiantes.

•	No se incorporan variables macroeconómicas externas (inflación, salarios). Se recomienda interpretar los resultados considerando el contexto macroeconómico.

•	El análisis por barrio es exclusivamente con departamentos (1, 2 y 3 ambientes) y no incluye otros tipos.

•	Algunos datos del último trimestre del 2025 no están disponibles.

•	Algunos datos en general en 2025 pueden presentar pequeñas variaciones en un futuro debido al retraso de la actualización en la página de extracción de los datos.

•	En algunas secciones pueden faltar datos de Puerto Madero como por ejemplo en unidades 1 ambiente y en departamentos nuevos.

Estas limitaciones no invalidan el análisis, pero deben ser resaltadas para interpretar de una mejor manera el resultado.

8. Próximos pasos

•	Incorporar accesibilidad a créditos para identificar oportunidades.

•	Comparar al mercado de alquiler vs compra.

•	Analizar el impacto de cambios en leyes, demandas, trabas burocráticas, inflación…

•	Ajustar precios por inflación.

•	Profundizar el análisis espacial con mapas detallados (movilidad urbana, zonas económicas, etc…)

9. Herramientas

•	Excel y Power Query (Limpieza)

•	SQL (consultas y agregaciones)

•	Power BI (dashboard y visualización)

•	GitHub (documentación y versionado)

10. Nota final.

Este proyecto fue desarrollado con fines educativos y de portfolio, aplicando criterios de análisis de datos orientados a negocio y toma de decisiones. Esto demuestra el uso de Power Query para transformar los datos, MySQL para consultas analíticas y responder preguntas, Power BI para visualización orientada a la toma de decisiones.
