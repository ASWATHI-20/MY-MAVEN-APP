# My Maven Application

This is a simple Maven application configured for deployment to Docker and Amazon ECR.

## Project Structure

```
my-maven-app
├── src
│   ├── main
│   │   ├── java
│   │   │   └── com
│   │   │       └── example
│   │   │           └── App.java
│   │   └── resources
│   │       └── application.properties
│   └── test
│       └── java
│           └── com
│               └── example
│                   └── AppTest.java
├── Dockerfile
├── .dockerignore
├── .env
├── pom.xml
└── README.md
```

## Setup Instructions

1. **Clone the repository:**
   ```
   git clone <repository-url>
   cd my-maven-app
   ```

2. **Build the application:**
   ```
   mvn clean install
   ```

3. **Build the Docker image:**
   ```
   docker build -t my-maven-app .
   ```

4. **Run the Docker container:**
   ```
   docker run --env-file .env -p 8080:8080 my-maven-app
   ```

## Usage

After running the application, you can access it at `http://localhost:8080`.

## Environment Variables

The application uses environment variables defined in the `.env` file. Make sure to configure this file with the necessary credentials and settings before running the application.

## Testing

To run the unit tests, use the following command:
```
mvn test
```

## Deployment to Amazon ECR

1. **Authenticate Docker to your Amazon ECR registry:**
   ```
   aws ecr get-login-password --region <region> | docker login --username AWS --password-stdin <account-id>.dkr.ecr.<region>.amazonaws.com
   ```

2. **Tag the Docker image:**
   ```
   docker tag my-maven-app:latest <account-id>.dkr.ecr.<region>.amazonaws.com/my-maven-app:latest
   ```

3. **Push the Docker image to Amazon ECR:**
   ```
   docker push <account-id>.dkr.ecr.<region>.amazonaws.com/my-maven-app:latest
   ```

## License

This project is licensed under the MIT License - see the LICENSE file for details.