# NoteApp

NoteApp is a full-stack application that allows users to create, edit, view, and delete notes. The application uses React on the frontend, Django on the backend, JWT for authentication, and axios for making HTTP requests.

## Technologies

- **Frontend**: React
- **Backend**: Django
- **Authentication**: JWT (JSON Web Tokens)
- **State Management**: React Context or Redux (depending on the implementation)
- **API Communication**: Axios
- **Python Virtual Environment** for the backend

## Features

- **CRUD for Notes**: Allows users to create, read, update, and delete notes.
- **JWT Authentication**: Uses JWT tokens for session authentication.
- **User Session**: Allows users to log in/logout with JWT tokens.

## How to Run the Project

### Steps to run the project locally:

1. **Clone the repository**

   First, clone the repository to your local environment:

   ```bash
   git clone https://github.com/x0rgus/noteapp.git
   cd noteapp
   ```
2. **Set up dependencies and other configs**
  To run the project, simply execute the following command:
```bash
make
```
The make command will set up the virtual environment, install the dependencies, and create a .env file in the frontend with the API URL.

3. **running the project**

After running make, you can manually start the Django backend with the run.sh script:
```bash
./run.sh
```
The script will start the frontend on localhost:5173 and the Django server on localhost:8000.

Project Structure

    frontend/: Contains the React frontend code.
    backend/: Contains the Django backend code.
    env/: Python virtual environment for the backend.
    requirements.txt: Backend dependencies (Python).
    Makefile: File to automate environment setup.
    run.sh: Script to run the project.

How does authentication work?

The project uses JWT (JSON Web Tokens) for authentication. The user can log in, and the Django backend will generate a JWT token, which should be used to access protected routes on the backend.

    Login: The user logs in with their username and password, and the backend returns a JWT token.
    Using the Token: The token must be included in the headers of requests to access CRUD functionality for notes.

Contributing

Feel free to contribute! Open an issue or a pull request, and we will be happy to review it.
