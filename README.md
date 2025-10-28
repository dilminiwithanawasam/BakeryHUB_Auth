# 🔐 Bakery Authentication Service Microservice

This repository hosts the **Authentication and Authorization Microservice** for the Bakery Management System project. It is built using the **Django** framework and **Django Rest Framework (DRF)**, providing secure token-based authentication for the entire application.

This microservice is designed to be consumed by a separate **React** and **Tailwind CSS** frontend application, which is maintained in another repository.

***

## ✨ Features

* **User Registration and Login:** Secure creation and authentication of user accounts.
* **Token-Based Authentication:** Utilizes **JWT (JSON Web Tokens)** via `djangorestframework-simplejwt` for stateless and secure API access.
* **Role-Based Authorization (Future):** Foundation for defining and enforcing user roles (e.g., Admin, Baker, Cashier) for the bakery system.
* **RESTful API:** Provides clear and standard endpoints for authentication workflows.
* **Containerized Environment:** Ready for deployment using **Docker**.

***

## ⚙️ Tech Stack

This project is built primarily with **Python** and **Django**.

| Category | Technology | Purpose |
| :--- | :--- | :--- |
| **Backend Framework** | **Django** | Main web framework. |
| **API** | **Django Rest Framework (DRF)** | Building robust and scalable REST APIs. |
| **Authentication** | **DRF Simple JWT** | Handles JWT generation and validation. |
| **Database** | **PostgreSQL** (via `psycopg2-binary`) | Production-ready database connector (defaulting to SQLite for dev). |
| **Deployment** | **Docker** | Containerization. |
| **Web Server** | **Gunicorn** | Production WSGI server (used in production). |
| **CORS** | **`django-cors-headers`** | Handling Cross-Origin Resource Sharing for frontend communication. |

***

## 🚀 Getting Started

### Prerequisites

You will need the following installed on your local machine:

* **Python 3.11+**
* **pip**
* **Docker** and **Docker Compose** (recommended for simplified setup)

### Local Development Setup

1.  **Clone the repository:**
    ```bash
    git clone <repository_url>
    cd bakery-auth-service
    ```

2.  **Create a virtual environment and activate it:**
    ```bash
    python -m venv venv
    source venv/bin/activate  # On Linux/macOS
    # venv\Scripts\activate   # On Windows
    ```

3.  **Install dependencies:**
    The project requirements are listed in `requirements.txt`.
    ```bash
    pip install -r requirements.txt
    ```

4.  **Configure environment variables:**
    * Create a `.env` file in the root directory (this file is ignored by Docker and Git for security).
    * Add your database credentials and **JWT settings** (e.g., `SECRET_KEY`, database URL).

5.  **Run Migrations:**
    ```bash
    python manage.py migrate
    ```

6.  **Start the development server:**
    ```bash
    python manage.py runserver
    ```
    The service will be available at `http://127.0.0.1:8000/`.

### Docker Setup (Recommended)

To run the application inside a container:

1.  **Build the Docker image:**
    The `Dockerfile` is set up to use `python:3.11-slim`, install requirements, copy the project, and expose port `8000`.
    ```bash
    docker build -t bakery-auth-service .
    ```

2.  **Run the container:**
    *(Note: For production environments, you should use Gunicorn instead of `runserver`)*
    ```bash
    docker run -p 8000:8000 bakery-auth-service
    ```
    The service will be available at `http://localhost:8000/`.

***

## 🌐 API Endpoints (Planned)

The `config/urls.py` currently maps the Django Admin. The main API routes will be added under a dedicated path (e.g., `/api/v1/`).

| Method | Endpoint | Description |
| :--- | :--- | :--- |
| **POST** | `/api/v1/auth/register/` | Create a new user account. |
| **POST** | `/api/v1/auth/token/` | Obtain an access/refresh token pair. |
| **POST** | `/api/v1/auth/token/refresh/` | Refresh an expired access token. |
| **GET** | `/api/v1/auth/user/` | Retrieve the currently authenticated user's details. |

***

## 🔗 Frontend Connection

This microservice acts as the backend for the main application **Frontend**, which is built using **React** and **Tailwind CSS** and is hosted in a *separate repository*.

To connect the frontend:
1. Ensure **CORS** headers are correctly configured in `bakery-auth-service/config/settings.py` to allow requests from the frontend's origin URL.
2. The frontend must include the **JWT Access Token** in the `Authorization: Bearer <token>` header for all protected API calls.