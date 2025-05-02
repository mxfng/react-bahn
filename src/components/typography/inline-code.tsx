export interface InlineCodeProps {
  children: React.ReactNode;
}

export const InlineCode: React.FC<InlineCodeProps> = ({ children }) => {
  return (
    <code className="relative rounded bg-muted text-muted-foreground px-[0.3rem] py-[0.2rem] font-mono text-sm font-semibold mx-1 transition-colors">
      {children}
    </code>
  );
};
