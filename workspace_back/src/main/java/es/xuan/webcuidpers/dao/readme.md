# Wine Cellar Application #

The Wine Cellar application is documented [here](http://coenraets.org).

This application provides an example of 
Building a complete RESTful API in Java using JAX-RS and Jersey.
Consuming these services using jQuery

Set Up:

1. Create a MySQL database name "cellar".
2. Execute cellar.sql to create and populate the "wine" table:

	mysql cuidpersbbdd -uroot < cuidpersbbdd.sql
	
	mysql cuidpersbbdd -uroot < D:/Juanje/eclipse-workspace-web/webcuidpers/src/main/java/es/xuan/webcuidpers/dao/cuidpersbbdd.sql
	
	SOURCE D:/Juanje/eclipse-workspace-web/webcuidpers/src/main/java/es/xuan/webcuidpers/dao/cuidpersbbdd.sql;	

3. Import the Dynamic Web Project in Eclipse.
4. Locate cellar.properties and make sure the JDBC connection string matches your database configuration
5. Run the project.