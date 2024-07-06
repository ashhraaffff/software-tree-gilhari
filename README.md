# software-tree-gilhari
Gilhari Simplifying Exchanging of JSON data with an RDBMS on Microsoft Azure

# Description
This repository demonstrates the use of the Gilhari microservice framework in simplifying the exchange of JSON data with an RDBMS on Azure. The functionality of exchanging JSON data is shown using two subprojects: BookstoreSchema and EmployeeSchema, described below.

Developed by Software Tree, the Gilhari microservice framework is designed to simplify the integration of application-specific object and relational models. Available as a Docker image, Gilhari is highly configurable to meet the specific needs of various applications. It offers a REST interface that provides APIs for standard CRUD operations—Create, Retrieve, Update, and Delete—on JSON objects. This REST interface supports multiple HTTP methods, including POST, GET, PUT, and DELETE, making it easy to manage data without writing additional code for API handling or database access.

**BookstoreSchema:** This part of the project uses an object model consisting of various entities related to a bookstore, such as books, authors, and genres. It demonstrates the use of the Gilhari microservice to exchange JSON data for this object model with a cloud-based MySQL database on Azure. Additionally, it supports advanced management for inventory updates and order processing.

**EmployeeSchema:** This part of the project uses an object model consisting of entities related to employees, such as employee details, departments, and roles. It showcases the use of the Gilhari microservice to exchange JSON data for this object model with a cloud-based MySQL or Postgres database on Azure.

For those interested in learning more about the capabilities and applications of the Gilhari microservice framework, additional information is available on Software Tree’s website at [https://www.softwaretree.com](https://www.softwaretree.com). This resource provides comprehensive details on how Gilhari can be leveraged to enhance data handling efficiency and streamline application development.
