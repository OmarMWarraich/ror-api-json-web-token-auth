import { useState, useEffect } from "react";
import "./App.css";
import User from "./components/User";

const App = () => {
  useEffect(() => {
    const user = JSON.parse(localStorage.getItem("user"));
    if (user) {
      setCurrUser(user.email.split("@")[0]);
    }
  }, []);
  const [currUser, setCurrUser] = useState(null);
  return (
    <div className="App">
      <User currUser={currUser} setCurrUser={setCurrUser} />
    </div>
  );
};
export default App;
