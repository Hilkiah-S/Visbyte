import { Avatar, Button, Dropdown, Navbar } from "flowbite-react";
import { useSelector } from "react-redux";

const Header = () => {
  const { userInfo } = useSelector((state) => state.auth);
  return (
    <Navbar
      fluid
      rounded
      className="border-b border-gray-700 bg-gray-950 rounded-none"
    >
      <Navbar.Brand href="/">
        <img
          src="/berhan-logo.jpg"
          className="mr-3 h-6 sm:h-12 rounded-lg"
          alt="Flowbite React Logo"
        />
        <span className="self-center whitespace-nowrap text-xl font-semibold text-white">
          Berhan Platform
        </span>
      </Navbar.Brand>
      {userInfo ? (
        <div className="flex md:order-2">
          <Dropdown
            arrowIcon={false}
            inline
            label={<Avatar alt="User settings" img="/user.png" rounded />}
          >
            <Dropdown.Header>
              <span className="block text-sm">{userInfo.name}</span>
              <span className="block truncate text-sm font-medium">
                {userInfo.email}
              </span>
            </Dropdown.Header>
            <Dropdown.Item>Sign out</Dropdown.Item>
          </Dropdown>
        </div>
      ) : (
        <div className="flex md:order-2">
          <Button className="bg-gradient-to-r from-orange-400 to-orange-500">
            Sign In
          </Button>
        </div>
      )}
    </Navbar>
  );
};

export default Header;
