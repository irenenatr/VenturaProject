Initial Backend Setup 

The backend development began with a monolithic architecture, where all application components were implemented within a single codebase and deployed as one application. To improve maintainability and prepare for future scalability, the monolith was then refactored into a layered architecture, separating responsibilities into dedicated folders such as controllers, services, models, and routes.

This layered structure helped define clear boundaries between different business domains and APIs. As a result, the application could later be decomposed into independent microservices, where each service manages its own business logic, database interactions, and API endpoints. Each microservice is deployed and runs independently on its own port, enabling better scalability, maintainability, and service isolation.
