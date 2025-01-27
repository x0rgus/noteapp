import { useState } from "react";
import api from "../api"
import { useNavigate } from "react-router-dom";
import { ACCESS_TOKEN, REFRESH_TOKEN } from "../constants";
import "../styles/Form.css"
import LoadingIndicator from "./LoadingIndicator";
// A reusable form component that handles user login or registration.
// Props:
// - route: API endpoint for submission (e.g., "/login" or "/register").
// - method: Specifies whether the form is for "login" or "register". 
function Form({route, method}) {
    const [username, setUsername] = useState("");
    const [password, setPassword] = useState("");
    const [loading, setLoading] = useState(false);
    const navigate = useNavigate();

    const name = method === "login" ? "Login" : "Register";

    const handleSubmit = async (e) => {
        setLoading(true);
        e.preventDefault();
        // Handles form submission, prevents page refresh, and sends user credentials
        // to the specified API route. If "login", stores tokens and navigates to the homepage.
        // If "register", navigates to the login page upon success.
        try { 
            const res = await api.post(route, {username, password})  //sends POST to api with user and pass
            if (method === "login") {
                localStorage.setItem(ACCESS_TOKEN, res.data.access); //saves jwt tokens
                localStorage.setItem(REFRESH_TOKEN, res.data.refresh);
                navigate("/") // navigates to homepage
            } else {
                navigate("/login")
            }
        }
        catch (error) {
            alert(error)
        } finally {
            setLoading(false); // sets loading flag to false
        }
    }

    return <form onSubmit={handleSubmit} className="form-container">
        <h1>{name}</h1>
        <input
            className="form-input"
            type="text"
            value={username}
            onChange={(e) => setUsername(e.target.value)}
            placeholder="Username"
        />
        <input
            className="form-input"
            type="password"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            placeholder="Password"
        />
        {loading && <LoadingIndicator />}
        <button className="form-button" type="submit">{name}</button>
    </form>
}

export default Form