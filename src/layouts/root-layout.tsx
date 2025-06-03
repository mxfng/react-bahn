interface RootLayoutProps {
  children: React.ReactNode;
}

export const RootLayout = ({ children }: RootLayoutProps) => (
  <div>
    <header>
      <div>
        <nav>{/* Add your navigation items here */}</nav>
      </div>
    </header>

    <main>{children}</main>

    <footer>
      <div>{/* Built with React Bahn */}</div>
    </footer>
  </div>
);
