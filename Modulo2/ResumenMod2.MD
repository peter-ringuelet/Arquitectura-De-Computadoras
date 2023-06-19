# Contenido

- [Procesamiento Multiciclo](#procesamiento-multiciclo)
- [Segmentación de Cauce o Pipelining](#segmentacion-de-cauce)

## Procesamiento Multiciclo

### Componentes Clave del Sistema de Procesamiento Multiciclo:

- **Memoria**: Contiene tanto instrucciones como datos.
- **Registro de Instrucciones (IR)**: Almacena la instrucción completa después de leerla de la memoria.
- **Registro de Datos de Memoria (MBR)**: Almacena los datos leídos de la memoria.
- **Banco de Registros**: Contiene los registros A y B, que mantienen los datos para la ALU.
- **Unidad Aritmética y Lógica (ALU)**: Realiza operaciones aritméticas o lógicas en los datos de los registros A y B. El resultado se almacena en el registro ALU Out.
- **Registro ALU Out**: Almacena el resultado de las operaciones de la ALU.
- **Controlador**: Controla las conexiones entre las diversas partes del hardware, permitiendo que las tareas se ejecuten en cada ciclo de reloj.

### Etapas de Procesamiento de Instrucciones:

1. **Búsqueda de Instrucción**: Leer la instrucción de la memoria y almacenarla en el IR. Simultáneamente, se incrementa el contador del programa.
2. **Decodificación de la Instrucción**: Analizar la instrucción almacenada en el IR para determinar las referencias de los registros y la operación codificada.
3. **Acceso a los Registros**: Obtener los datos requeridos del banco de registros y almacenarlos en los registros A y B.
4. **Ejecución de la Instrucción**: Dependiendo del tipo de operación, se puede realizar una de las siguientes acciones:
    - **Operaciones Tipo R**: Las operaciones se realizan en los registros y no requieren acceso a la memoria.
    - **Operaciones Load (LW)**: Calculan la dirección de memoria y luego leen los datos de la memoria.
    - **Operaciones Store (SW)**: Calculan la dirección de memoria y luego escriben los datos en la memoria.
    - **Operaciones Branch Equal (BEQ)**: Comparan dos registros y, si son iguales, alteran el flujo de control saltando a una nueva dirección en el programa.
5. **Acceso a la Memoria**: En las operaciones LW y SW, los datos se leen de la memoria o se escriben en ella.
6. **Escritura en Registros (Right Back)**: Los resultados de la operación se escriben en los registros correspondientes.

## Segmentación de Cauce o Pipelining

La segmentación de cauce, o pipelining, es una técnica para organizar el hardware de la CPU de forma que se pueda realizar más de una operación al mismo tiempo. Esta técnica descompone el proceso de las instrucciones en fases o etapas que permiten su ejecución simultánea, explotando así el paralelismo entre las instrucciones de un flujo secuencial.

### Analogía de Lavandería

Una analogía útil para entender la segmentación de cauce es una lavandería. En este escenario, cada prenda pasa por tres etapas: lavado, secado y doblado.Si organizas estas tareas de manera que mientras una prenda está siendo secada, otra está siendo lavada, y otra está siendo doblada, optimizas el uso de los recursos y mejoras la eficiencia general del proceso.

### Hardware y Ruta de Datos Segmentados

Este concepto de organización secuencial también se aplica a nivel de hardware, específicamente a la ruta de datos segmentados. En esta configuración, los elementos de hardware se reorganizan y se agregan registros de segmentación que coordinan la ejecución de tareas en cada etapa, permitiendo su realización independiente de las otras.

Los registros de segmentación son controlados por el ciclo de reloj del procesador. Cuando termina un ciclo de reloj y comienza el siguiente, los datos que están en una etapa de la ruta de datos segmentados pasan a la siguiente etapa.

### Ventajas de la Segmentación de Cauce

La segmentación de cauce ofrece varias ventajas. La principal es que teóricamente, se puede completar una instrucción en cada ciclo de reloj, lo que incrementa la productividad o throughput. Esto no significa que cada instrucción se ejecuta más rápido; más bien, da la sensación de que el procesador es más rápido porque en cada ciclo de reloj se completa una instrucción.

### Implementación de la Segmentación de Cauce

Un ejemplo de implementación de la segmentación de cauce implica el paso de cinco instrucciones por la ruta de datos segmentados. Al observar la evolución temporal de cada instrucción, se puede notar que una instrucción se completa en cada ciclo de reloj.

En cada etapa del ciclo de ejecución de una instrucción, se utiliza un hardware específico: en la etapa de fetch se utiliza la memoria de instrucciones; en la etapa de decodificación se utiliza el banco de registros; en la etapa de ejecución se utiliza la unidad aritmética; en la etapa de acceso a memoria se utiliza la memoria de datos; y en la etapa de escritura o write back se vuelve a utilizar el banco de registros.

