# Resumen del Procesamiento Multiciclo

## 1. Componentes Clave del Sistema de Procesamiento Multiciclo:

- **Memoria**: Contiene tanto instrucciones como datos.
- **Registro de Instrucciones (IR)**: Almacena la instrucción completa después de leerla de la memoria.
- **Registro de Datos de Memoria (MBR)**: Almacena los datos leídos de la memoria.
- **Banco de Registros**: Contiene los registros A y B, que mantienen los datos para la ALU.
- **Unidad Aritmética y Lógica (ALU)**: Realiza operaciones aritméticas o lógicas en los datos de los registros A y B. El resultado se almacena en el registro ALU Out.
- **Registro ALU Out**: Almacena el resultado de las operaciones de la ALU.
- **Controlador**: Controla las conexiones entre las diversas partes del hardware, permitiendo que las tareas se ejecuten en cada ciclo de reloj.

## 2. Etapas de Procesamiento de Instrucciones:

- **Búsqueda de Instrucción**: Leer la instrucción de la memoria y almacenarla en el IR. Simultáneamente, se incrementa el contador del programa.
- **Decodificación de la Instrucción**: Analizar la instrucción almacenada en el IR para determinar las referencias de los registros y la operación codificada.
- **Acceso a los Registros**: Obtener los datos requeridos del banco de registros y almacenarlos en los registros A y B.
- **Ejecución de la Instrucción**: Dependiendo del tipo de operación, se puede realizar una de las siguientes acciones:
  - **Operaciones Tipo R**: Las operaciones se realizan en los registros y no requieren acceso a la memoria.
  - **Operaciones Load (LW)**: Calculan la dirección de memoria y luego leen los datos de la memoria.
  - **Operaciones Store (SW)**: Calculan la dirección de memoria y luego escriben los datos en la memoria.
  - **Operaciones Branch Equal (BEQ)**: Comparan dos registros y, si son iguales, alteran el flujo de control saltando a una nueva dirección en el programa.
- **Acceso a la Memoria**: En las operaciones LW y SW, los datos se leen de la memoria o se escriben en ella.
- **Escritura en Registros (Right Back)**: Los resultados de la operación se escriben en los registros correspondientes.

Dependiendo de la operación en curso, es posible que algunas etapas no sean necesarias. En tales casos, algunas partes del ciclo de reloj pueden desperdiciarse. Sin embargo, este enfoque permite un uso más eficiente de los recursos de hardware en comparación con los sistemas de procesamiento monociclo.
