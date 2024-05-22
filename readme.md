# Microservices architecture with Docker and K8
## Definition
The separation of functions within your deployment into different infrastucture. In this case I containerised node app and mongodb. Anything that has it's own endpoint.<br>
![alt text](images/microservice_breakdown.png)
## Why microservices
- Removes dependecies between different parts within the applications (if login screen doesn't work doesn't effect main page)
- Small (as many needed) 
- Scalable (good for changing demands, monolith is for a known demand which doesn't change)
- Works best for large scale deployments
## Why not microservices
- Not easy to manage
- Costs more
- Needs different teams
## Virtualisation vs Containerisation
Virtualization lets you run multiple operating systems on the same physical server, whereas containerization enables you to deploy multiple applications or microservices on the same operating system without any hardware abstraction.
## Docker - building
## Why docker
- Globally available images
- Not as secure
## How docker works
- Uses APIs
- Docker client (our terminal)provides instruction (docker build pull run) to APIs
- Docker host is docker desktop
- Docker hub registry is the remote storage for repositories<br>
![alt text](images/how_docker_works.png)
## Image vs container
Containers are running images, images are stopped containers. Just like instances and images
## Read Replica
![alt text](images/read_replica.png)
- Makes data persistent
- Prevents people changing data you have put out to the public
## K8 - managing and scaling K8
Docker doesn't have the capability to scale highly available with no point of faikure.
- Self healing
- Scale in and out on demand
- Eliminating single point of failure