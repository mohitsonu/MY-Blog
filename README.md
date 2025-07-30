# 📝 My-Blog: A Full-Stack Blog & CMS Platform

<div align="center">

[![.NET](https://img.shields.io/badge/.NET-512BD4?style=for-the-badge&logo=dotnet)](https://dotnet.microsoft.com/en-us/download/dotnet/7.0)
[![Angular](https://img.shields.io/badge/Angular-DD0031?style=for-the-badge&logo=angular&logoColor=white)](https://angular.io/)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-4169E1?style=for-the-badge&logo=postgresql&logoColor=white)](https://www.postgresql.org/)
[![License](https://img.shields.io/badge/license-MIT-blue.svg?style=for-the-badge)](/LICENSE)

</div>

This project is a complete blog application built with an ASP.NET Core backend and an Angular frontend. It features a comprehensive Content Management System (CMS) for administrators and a clean, public-facing interface for readers.

✨ **Live Demo**
You can try the live application here: [https://blog-b8d99.web.app/](https://blog-b8d99.web.app/)

## 📚 Table of Contents
- [Features](#-features)
- [Technology Stack](#-technology-stack)
- [Getting Started](#-getting-started)
- [Deployment](#-deployment)
- [Project Structure](#-project-structure)
- [License](#-license)

## 🌟 Features

### Admin Panel (CMS)
The secure admin panel provides full control over the blog's content:

*   **🗂️ Category Management:** Full CRUD (Create, Read, Update, Delete) functionality for blog categories.
*   **✍️ Blog Post Management:** A rich text editor for creating and managing blog posts using Markdown.
*   **🖼️ Image Management:** An integrated image uploader and selector to easily manage and insert images into blog posts.

### 📰 Public-Facing Blog

*   **🏠 Home Page:** Displays a list of all published blog posts.
*   **📖 Blog Detail Page:** Renders the full content of a selected blog post, correctly parsing and displaying Markdown content.

### 🔐 Authentication

*   **Secure Login:** A dedicated login page for administrators.
*   **JWT Authentication:** The application uses JSON Web Tokens (JWT) to secure the admin API endpoints. An `AuthInterceptor` automatically attaches the token to relevant HTTP requests.

## 🛠️ Technology Stack

### Backend
*   **Framework:** ASP.NET Core 7
*   **Language:** C#
*   **Database:** PostgreSQL
*   **Authentication:** JSON Web Tokens (JWT) with ASP.NET Core Identity

### Frontend
*   **Framework:** Angular 16
*   **Language:** TypeScript
*   **Styling:** Bootstrap for a responsive, modern UI.
*   **HTTP Client:** Angular's `HttpClient` for communicating with the backend API.

## 🚀 Getting Started

Follow these instructions to get a copy of the project up and running on your local machine.

### Prerequisites
Make sure you have the following software installed:
*   .NET 7 SDK
*   Node.js (which includes npm)
*   Angular CLI: `npm install -g @angular/cli`
*   A code editor like Visual Studio Code

### ⚙️ Backend (API) Setup
1.  Navigate to the API directory:
    ```sh
    cd API
    ```
2.  **Configure Settings:**
    *   In the `API` directory, find the `appsettings.Development.json` file.
    *   Ensure the `ConnectionStrings.CodePulseConnectionString` is set up for your local database.
    *   Ensure you have a secret `Jwt:Key` for JWT generation. **Do not commit this key to a public repository.**
3.  Restore .NET dependencies:
    ```sh
    dotnet restore
    ```
4.  Run database migrations:
    ```sh
    dotnet ef database update
    ```
5.  Run the API:
    ```sh
    dotnet watch run
    ```
    The API will start and listen on `https://localhost:7113` (or a similar port).

### 🖥️ Frontend (UI) Setup
1.  In a **new terminal**, navigate to the UI directory:
    ```sh
    cd UI
    ```
2.  Install npm packages:
    ```sh
    npm install
    ```
3.  **Configure the API Endpoint:**
    *   Open `src/environments/environment.ts`.
    *   Set the `apiBaseUrl` to your running backend API URL (e.g., `https://localhost:7113`).
4.  Run the Angular development server:
    ```sh
    ng serve
    ```
    Navigate to `http://localhost:4200/`.

## 🚀 Deployment
This application is deployed with a decoupled architecture:

*   The **API** is deployed as a Web Service on **Render**.
*   The **Client** is deployed as a Static Site on **Firebase Hosting**.

Environment variables for the production database connection string and JWT token key are configured securely in the Render dashboard.

## 📁 Project Structure
The repository contains two main projects:

*   `API/`: The ASP.NET Core Web API solution.
*   `UI/`: The Angular client application.

## 📄 License
This project is licensed under the MIT License. You can create a `LICENSE` file in the root of the project for more details.
