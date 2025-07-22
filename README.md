# Summer Internship Project: My Personalized Cloud Server

 This guide outlines the tasks you'll complete to build, containerize, and deploy your very own web application to a Kubernetes cluster. This project is designed to help you apply the concepts you've learned about Docker, Kubernetes, and cloud technologies in a hands-on way.

## Project Goal

The main goal of this project is to **build, containerize, and deploy a personalized Nginx web server** to a Kubernetes cluster. You will customize the web page, push your Docker image to a registry, and then deploy it using Kubernetes Deployments and Services, making it accessible from the internet.

## Tasks to Complete

Please follow these steps carefully to complete your project:

### Task 1: Fix Your Dockerfile

Ensure your `Dockerfile` is correctly configured to serve your custom web content.

* **Action:** Review and modify your `Dockerfile`.

* **Key Point:** Verify that your `index.html` and any other static files (like your animal picture) are being copied to the **correct Nginx web root directory** inside the container. For the standard Nginx image, this is typically `/usr/share/nginx/html/`.

### Task 2: Customize Your Web Page (`index.html`)

Make your web page unique and informative!

* **Action:** Edit the `index.html` file that will be served by Nginx.

* **Requirements:**

  * **Include a picture of your favorite animal:** Find an image of an animal you like and embed it on the page.

  * **Display your Team's Name:** Clearly state the name of your team on the page.

  * **Add a short description of the animal:** Write one or two sentences describing the chosen animal.

* **Creative Freedom:** Feel free to use CSS to add colors, choose interesting fonts, and design the page to be appealing.

### Task 3: Build and Push Your Docker Image

Containerize your personalized web server and make it available for deployment.

* **Action:** Build a new Docker image from your `Dockerfile` and push it to a Docker Registry (e.g., Docker Hub).

* **Steps:**

  1. **Log in to your Docker Registry:**

     ```
     docker login
     
     ```

  2. **Build your image:** Navigate to the directory containing your `Dockerfile`, `index.html`, and animal picture. Give your image a meaningful tag that includes your Docker Hub username and a version (e.g., `your-dockerhub-username/your-team-nginx:v1`).

     ```
     docker build -t your-dockerhub-username/your-team-nginx:v1 .
     
     ```

  3. **Push your image:**

     ```
     docker push your-dockerhub-username/your-team-nginx:v1
     
     ```

### Task 4: Create a Kubernetes Cluster

Organize your resources within the Kubernetes cluster.

* **Action:** Create a new  Kubernetes cluster. The cluster should be named as your team.


### Task 5: Deploy Your Application to Kubernetes

Run your containerized web server within the cluster.

* **Action:** Create a Kubernetes `Deployment` configuration file (`deployment.yaml`). This Deployment will manage your Nginx web server pods.

* **Requirements:**

* The Deployment must use the Docker image you pushed in **Task 3**.

* It should be configured to run **2 replicas** of your web server.

* **Apply:** Apply this `deployment.yaml` file to your cluster.

kubectl apply -f deployment.yaml


### Task 6: Expose Your Application to the Internet

Make your custom web page accessible to the world!

* **Action:** Create a Kubernetes `Service` configuration file (`service.yaml`) of type `LoadBalancer`. This Service will expose your Deployment to external traffic.

* **Requirements:**

* The Service must point to your Deployment from **Task 5**.

* Its `type` must be `LoadBalancer`.

* **Apply:** Apply this `service.yaml` file to your cluster.

kubectl apply -f service.yaml


* **Verification:** After the `LoadBalancer` Service is created (this might take a few minutes to provision an external IP), get its `EXTERNAL-IP` address.

kubectl get svc -n 


Once you have the `EXTERNAL-IP`, open it in your web browser to see your personalized page live!

### Task 7: Create a DNS Record

Make your application accessible via a friendly domain name.

* **Action:** Create a DNS A record that points your chosen hostname to the `EXTERNAL-IP` of your `LoadBalancer` Service (from Task 6).

* **Requirements:**

    * Choose a unique hostname for your application (e.g., `my-team-app`).

    * Use the provided DNS zone ID: `6e978c62-0b49-4087-b9cc-8bd0e7c9507a`.

* **Example Command (Conceptual - specific tool may vary based on your DNS provider):**

    ```bash
    stackit dns record-set create --zone-id 6e978c62-0b49-4087-b9cc-8bd0e7c9507a --name `<YOUR-DNS-NAME>` --record `<EXTERNAL-IP-from-Task-6>`
    ```

## Presentation Guidelines (Day 10)

On the final day, you will present your completed project.

* **Live Demonstration:** Be ready to show your working, customized web page, accessible via its public URL.

* **Explain Your Code:** Briefly walk through your `Dockerfile`, `deployment.yaml`, and `service.yaml` files, explaining the key parts.

* **Share Your Learnings:** Discuss the challenges you faced during the project and how you overcame them. Which new concepts did you find most interesting or useful?

## Hint: You can use the provided application skeleton from the Git repository as a starting point for your project.

Good luck, and have fun building!