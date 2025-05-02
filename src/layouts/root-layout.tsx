interface RootLayoutProps {
  children: React.ReactNode;
}

export const RootLayout = ({ children }: RootLayoutProps) => (
  <main className="flex flex-col items-center justify-center gap-2 lg:gap-4">
    {children}
  </main>
);
