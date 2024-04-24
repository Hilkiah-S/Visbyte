"use client";

import { Footer } from "flowbite-react";

export default function Footers() {
  return (
    <Footer container className="bg-gray-950">
      <Footer.Copyright href="#" by="Berhan" year={2024} />
      <Footer.LinkGroup>
        <Footer.Link href="#">About</Footer.Link>
        <Footer.Link href="#">Privacy Policy</Footer.Link>
        <Footer.Link href="#">Licensing</Footer.Link>
        <Footer.Link href="#">Contact</Footer.Link>
      </Footer.LinkGroup>
    </Footer>
  );
}
