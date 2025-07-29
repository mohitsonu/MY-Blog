# My-Blog: A Full-Stack Blog Platform

This project is a complete blog application built with Angular for the frontend and a separate REST API for the backend. It features a comprehensive Content Management System (CMS) for administrators and a clean, public-facing interface for readers.

## Tech Stack

*   **Frontend:** Angular, TypeScript
*   **Styling:** Bootstrap
*   **Backend:** A separate REST API (not included in this repository) that handles data for categories, blog posts, images, and authentication.

## Features

### Admin Panel

The secure admin panel provides full control over the blog's content:

*   **Category Management:** Full CRUD (Create, Read, Update, Delete) functionality for blog categories.
*   **Blog Post Management:** A rich text editor for creating and managing blog posts. Posts can be formatted using Markdown.
*   **Image Management:** An integrated image uploader and selector to easily manage and insert images into blog posts.

### Public-Facing Blog

*   **Home Page:** Displays a list of all published blog posts.
*   **Blog Detail Page:** Renders the full content of a selected blog post, correctly parsing and displaying Markdown content.

### Authentication

*   **Secure Login:** A dedicated login page for administrators.
*   **JWT Authentication:** The application uses JSON Web Tokens (JWT) to secure the admin API endpoints. An `AuthInterceptor` automatically attaches the token to relevant HTTP requests.

## Getting Started

To get a local copy up and running, follow these simple steps.

### Prerequisites

*   Node.js and npm (or yarn) installed on your machine.
*   The backend REST API for this project must be running separately.

### Installation & Setup

1.  **Clone the repository:**
    ```sh
    git clone <your-repository-url>
    cd My-Blog/UI
    ```

2.  **Install NPM packages:**
    ```sh
    npm install
    ```

3.  **Configure the API Endpoint:**
    The frontend needs to know the URL of your backend API. You can configure this in the environment files.

    *   For development, edit `src/environments/environment.ts`.
    *   For production, edit `src/environments/environment.prod.ts`.

    Example `src/environments/environment.prod.ts`:
    ```typescript
    export const environment = {
      production: true,
      apiBaseUrl: 'https://your-backend-api-url.com'
    };
    ```

4.  **Run the development server:**
    ```sh
    ng serve
    ```
    Navigate to `http://localhost:4200/`. The application will automatically reload if you change any of the source files.

## Build

Run `ng build` to build the project. The build artifacts will be stored in the `dist/` directory. Use the `--prod` flag for a production build.

```sh
ng build --prod
```

## Further Help

To get more help on the Angular CLI use `ng help` or go check out the Angular CLI Overview and Command Reference page.

