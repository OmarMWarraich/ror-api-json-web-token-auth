import Signup from "./Signup";
import Login from "./Login";
import Logout from "./Logout";

import { useState } from "react";
const User = ({ currUser, setCurrUser }) => {
  const [show, setShow] = useState(true);
  if (currUser)
    return (
      <div>
        Hello <b>{currUser[0].toUpperCase() + currUser.slice(1)}</b>
        <Logout setCurrUser={setCurrUser} />
      </div>
    );
  return (
    <div>
      {show ? (
        <Login setCurrUser={setCurrUser} setShow={setShow} />
      ) : (
        <Signup setCurrUser={setCurrUser} setShow={setShow} />
      )}
    </div>
  );
};
export default User;
