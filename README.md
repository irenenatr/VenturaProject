# Backend Architecture

The Ventura backend follows a Microservices Architecture consisting of four independent services:

| Service | Port | Responsibility |
|----------|----------|----------|
| API Gateway | 3000 | Routes incoming requests to the appropriate service |
| Auth Service | 3001 | Authentication, authorization, and JWT management |
| Finance Service | 3002 | Budgeting, expense tracking, and financial management |
| Travel Service | 3003 | Travel planning and recommendation generation |

## Request Flow

All incoming requests are first received by the **API Gateway**. The gateway acts as a single entry point for the frontend application and is responsible for forwarding requests to the appropriate microservice based on the requested endpoint.

```text
Client
   │
   ▼
API Gateway (Port 3000)
   │
   ├──► Auth Service (Port 3001)
   ├──► Finance Service (Port 3002)
   └──► Travel Service (Port 3003)
```

This architecture provides better scalability, maintainability, and separation of concerns by allowing each service to operate independently while communicating through the gateway.

## Evolution of the Backend Architecture

The backend development followed a gradual architectural evolution:

```text
Monolithic Architecture
          ↓
Layered Architecture
          ↓
Microservices Architecture
```

The project initially started as a **Monolithic Architecture**, where all functionality was implemented within a single application. To improve code organization and maintainability, the application was then restructured using a **Layered Architecture**, separating responsibilities into dedicated layers such as controllers, services, models, and routes.

This separation helped identify clear business boundaries and made it easier to extract individual domains into independent microservices. Eventually, each domain was migrated into its own service with dedicated APIs and deployment ports.

## DTO (Data Transfer Object) and Validation

Each microservice implements **DTOs (Data Transfer Objects)** to validate incoming requests before they reach the business logic layer.

DTOs help ensure that:

* Required fields are provided.
* Input data types are valid.
* Invalid or malformed requests are rejected early.
* Data consistency is maintained across services.

By validating incoming data at the service boundary, the system becomes more secure, reliable, and easier to maintain.

## Authentication and Authorization

To secure protected endpoints, the backend implements **JWT (JSON Web Token) Authentication** using:

### JWT Strategy

The JWT Strategy is responsible for validating access tokens included in incoming requests. Once validated, the authenticated user information is attached to the request context and can be accessed by the application.

### JWT Guard

The JWT Guard protects specific routes by ensuring that only authenticated users with valid JWT tokens can access them. Requests without a valid token are automatically rejected.

This mechanism is primarily used for endpoints that require authentication, such as:

* Accessing user-specific resources
* Performing financial transactions
* Managing travel plans
* Administrative operations

The combination of JWT Strategy and JWT Guard helps ensure secure communication between clients and backend services while maintaining stateless authentication.
