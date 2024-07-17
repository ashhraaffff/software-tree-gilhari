# Gilhari: Simplifying Exchanging of JSON Data with an RDBMS on Microsoft Azure

Welcome to the Gilhari project repository! This project demonstrates the use of the Gilhari microservice framework to manage JSON data in a relational database, leveraging Microsoft Azure for deployment and scalability.

## Project Overview

This project involves configuring and testing a Gilhari microservice, implemented on Azure using a Docker container, to efficiently manage JSON data in a relational database. The microservice handles data exchange operations through PUT and DELETE REST APIs, ensuring data consistency. The microservice connects to an Azure SQL Database, managing data updates and deletions based on API requests. Deployment on Azure Container Registry (ACR) and Azure Kubernetes Service (AKS) ensures scalability.

## Table of Contents

- [Project Description](#project-description)
- [Methodology](#methodology)
- [Getting Started](#getting-started)
- [Azure Deployment](#azure-deployment)
- [Usage](#usage)

## Project Description

### Abstract

This project configures and tests a Gilhari microservice on Azure using Docker to manage JSON data in a relational database. The microservice connects to an Azure SQL Database, handling data updates and deletions through PUT and DELETE REST APIs. Deployment on Azure Container Registry and AKS ensures scalability. Comprehensive documentation is provided for easy replication and application of the Gilhari framework in practical scenarios.

### Key Features

- **JSON Data Management:** Efficient handling of JSON data in a relational database.
- **REST APIs:** PUT and DELETE APIs for data insertion, updates, and deletions.
- **Azure Integration:** Deployment using Azure Container Registry and Azure Kubernetes Service.
- **Scalability:** Robust and scalable deployment architecture.
- **Comprehensive Documentation:** Step-by-step setup and usage instructions.

## Methodology

### Steps to Configure and Use the Gilhari Microservice

1. **Creating Application-Specific Artifacts**
   - Define and compile empty Java container classes corresponding to the conceptual types of your application-specific JSON objects.

2. **Configuring and Building an Application-Specific Gilhari Microservice**
   - Create a Dockerfile with commands to configure the base Gilhari image with application-specific artifacts like domain model classes, ORM specification, JDBC drivers, and communication ports.

3. **Building and Running the Microservice in a Docker Container**
   - Compile domain model classes.
   - Build the Docker image and run the microservice locally or on the cloud using Azure.

4. **Testing the Microservice**
   - Use local MySQL servers for persistence and verify the working of the microservice by checking data consistency in the database.


## Getting Started

### Prerequisites

- Gilhari SDK (can be downloaded from Software Tree's website, www.softwaretree.com)
- Docker
- Azure CLI
- Postman (for testing APIs)

### Setup Instructions

1. Clone the repository:
   ```bash
   git clone https://github.com/ashhraaffff/software-tree-gilhari.git
   cd software-tree-gilhari
   ```
2. Build the Docker image:
   ```bash
   docker build -t gilhari-microservice .
   ```
3. Run the microservice locally:
  ```bash
  docker run -p 80:8081 gilhari-microservice
  ```
### Azure Deployment
1. Set up the Azure environment
    
   Login to Azure and create a Resource group.
2. Azure Containter Registry

   Tag and push the image to ACR
   ```bash
   az acr login --name <registry-name>
   docker tag gilhari-microservice <registry-name>.azurecr.io/gilhari-microservice
   docker push <registry-name>.azurecr.io/gilhari-microservice
   ```
## Usage
### API Endpoints
1. PUT Data - Insert or update JSON data in the database.
   Example request:
   ```bash
   curl -X PUT -d @data.json http://localhost:80/data
   ```
2. DELETE data - Delete JSON data from the database.
   Example Request:
   ```bash
   curl -X DELETE -d @data.json http://localhost:80/data
   ```
*Note*: Change the port number if you wish to use the microservice on Azure accordingly.

### Testing with Postman
1. Open Postman and create a new request.
2. Set the request method to PUT or DELETE.
3. Enter the API endpoint URL.
4. In the body, select raw and JSON, and enter the JSON data.
5. Send the request and verify the response.

>[!NOTE]
>Gilhari is a product of Software Tree, LLC. For more information, please refer to Software Tree's [website](https://www.softwaretree.com)
