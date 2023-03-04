

### **Instalar Kafka**:
1. Descargar Kafka:
    ```bash
    wget https://downloads.apache.org/kafka/3.4.0/kafka_2.13-3.4.0.tgz
    ```
2. Extraer el archivo:
    ```bash
    tar -xzf kafka_2.13-3.4.0.tgz
    ```
3. Ingresar en la carpeta:
    ```bash
    cd kafka_2.13-3.4.0
    ```
4. Iniciar ZooKeeper:
    ```bash
    bin/zookeeper-server-start.sh config/zookeeper.properties
    ```
5. En otra terminal iniciar Kafka:
    ```bash
    bin/kafka-server-start.sh config/server.properties
    ```
6. Crear un topic:
    ```bash
    bin/kafka-topics.sh --create --topic fakedata --bootstrap-server localhost:9092
    ```
7. Inspeccionar el topic:
    ```bash
    bin/kafka-topics.sh --describe --topic fakedata --bootstrap-server localhost:9092
    ```
8. Enviar un mensaje:
    ```bash
    
    ```

____________________________________________________
**Notas:**
1. Si salen problemas de memoria se pueden corregir cambiando los valores de las variables de entorno:
    - Cambiar a 1 Gb de memoria:
        ```bash
        export KAFKA_HEAP_OPTS="-Xmx1G -Xms1G"
        ```
    - Cambiar a 256 Mb de memoria:
        ```bash
        export KAFKA_HEAP_OPTS="-Xmx256M -Xms128M"
        ```
    - Cambiar a 128 Mb de memoria:
        ```bash
        export KAFKA_HEAP_OPTS="-Xmx128M -Xms64M"
        ```
    Ref: https://stackoverflow.com/questions/21448907/kafka-8-and-memory-there-is-insufficient-memory-for-the-java-runtime-environme


____________________________________________________
### **Conectar VSCode a EC2:**

Ref: https://dev.to/cindyledev/remote-development-with-visual-studio-code-on-aws-ec2-4cla

1. Instalar la extensión de Remote - SSH en VSCode.
2. En VSCode, en la barra lateral izquierda, seleccionar el icono de la extensión Remote - SSH.
3. En la ventana que se abre, seleccionar el botón de **Connect to Host...**.
4. En la ventana que se abre, seleccionar el botón de **+**.
5. En la ventana que se abre, escribir el nombre de la instancia EC2 y seleccionar el botón de **Add New SSH Host**.
