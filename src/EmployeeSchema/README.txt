- This directory shows an example of using the base Gilhari docker image to easily create a new docker image (gilhari_simple_example) that can run as a RESTful microservice (server) to persist app specific JSON objects.

- The underlying JSON object model has just one type (class) of objects - Employee. 

- The src directory contains the underlying shell (container) classes (e.g., JSON_Employee) that are used to define the object relational mapping for the corresponding JSON object model classes. 

- JSON_Employee is a simple shell (container) class defining a domain model object class for Employee objects. The JDX_JSONObject class serves as a base class for persisting instances of a domain specific class (JSON_Employee). This domain-specific class (JSON_Employee) needs to define just two constructors. Most of the processing is handled by the superclass JDX_JSONObject. 

- The object relational mapping (ORM) specification for the container classes corresponding to the JSON object model classes is defined in the file config/gilhari_simple_example.jdx. Change the database URL and the JDBC driver in that file as per your setup.

- Essentially, the (container) domain model classes parallel to the JSON object model classes are defined as subclasses of the JDX_JSONObject class and appropriate mappings are defined in the ORM specification on the (container) domain model classes. 

- Please see the "Persisting JSON Objects" section in the JDX User Manual for details on defining and using the container classes and the ORM specification for a JSON object model. 

- The compile.cmd (compile.sh) file is used to compile the container domain model classes. The sources.txt file contains a list of the source (.java) files for the underlying shell (container) classes.

- Using the local Dockerfile, the build.cmd file creates the docker image (gilhari_simple_example) for the sample RESTful microservice.

- The Dockerfile contains the commands to build the docker image of a RESTful microservice using the base Gilhari image, the app specific class files, and configuration files including an ORM specification file.

- The configuration file gilhari_service.config is used to specify various runtime parameters to run the RESTful microservice. Here are examples of the various parameters that can be configured through settings in the file gilhari_service.config:

{"jdx_orm_spec_file": "./config/gilhari_simple_example.jdx",
 "jdbc_driver_path": "/node/node_modules/jdxnode/external_libs/mysql-connector-java-5.1.39-bin.jar",
 "jdx_debug_level": 3,
 "jdx_force_create_schema": "true",
 "jdx_persistent_classes_location": "./bin",
 "classnames_map_file": "config/classnames_map_example.js",
 "gilhari_rest_server_port": 8081
 }

Most of the settings in the above examples are self-explanatory. Here is a brief explanation:
 
   "jdx_orm_spec_file": The name and location of the ORM specification file
    (e.g., gilhari_simple_example.jdx located in the config directory),
    which contains the mapping specification for the persistent (container)
    classes used by JDX ORM.

   "jdbc_driver_path": The location of the JDBC driver (.jar) file to be 
    used for accessing the relational data source. A JDBC driver for SQLite
    database has already been added as a default JDBC driver in the classpath.
    If you are using a different database, the path to the corresponding 
    JDBC driver (.jar) should be specified here.

   "jdx_debug_level": A value in the range from 0 to 5 (e.g., 3) for getting 
    the debug output from the JDX ORM engine. 
    0 for the most verbose output and 5 for the minimal output. 
    A value of 3 will output all the SQL statements used by JDX.
    Default is 5.

   "jdx_force_create_schema": Specifies if the database schema should be 
    freshly created everytime the server is run. A value of 
    "true" means yes => could be useful during development phase when the 
                       object model and the mapping is changing frequently.
    "false" means no => the schema will be created only the first time the 
                       server is run.
    Default is "false".

   "jdx_persistent_classes_location": Specifies the root location 
    (e.g., ./bin directory) for the compiled persistent (container) classes.
    Could be the path of a jar file. Used as a java CLASSPATH.

   "classnames_map_file": This is an optional json file consisting of the 
    mappings between the conceptual JSON class names and the corresponding 
    persistent (container) class names used by JDX ORM. If this file is 
    not specified or if it does not contain the mapping for a conceptual 
    JSON class specified in a REST URL, the specified class name in 
    the URL is used as is by the JDX ORM engine.

   "gilhari_rest_server_port": The port number (e.g., 8081) where the 
    service listens to the RESTful requests. Default is 8081. This port 
    may be mapped to different port number (e.g., 80) by a docker run command.

- After the microservice starts running (e.g., using run_docker_app.cmd), you may access it RESTfully (using GET, POST, PUT, PATCH, and DELETE commands) in your local browser using   "http://localhost:<port>/gilhari/v1/:className" prefix. For example:
 
  http://localhost:80/gilhari/v1/Employee


To build and run the RESTful microservice from scratch:
-------------------------------------------------

- Make appropriate configuration changes in the ORM specification file (config/gilhari_simple_example.jdx) and the file gilhari_service.config.

> compile.cmd (or compile.sh on Linux)

For a docker containerized RESTful microservice:
    > build.cmd (or build.sh on Linux)
    > run_docker_app.cmd (or run_docker_app.sh on Linux)

- After the RESTful microservice starts running, you may access it in your local browser using urls like http://localhost:<port>/gilhari/v1/:ClassName

- You may also use curlCommands.cmd (or curlCommands.sh on Linux) to invoke some pre-canned REST APIs through curl.

- You may use POSTMAN to invoke REST APIs over the Gilhari microservice.

- On Windows, you may use the following Docker command to shell into a running container:
   > docker exec -it <container-name or container-id> bash

Note: You may need to change the command (.cmd, .sh) files, meant for Windows and Linux environments, appropriately for your target operating system. 