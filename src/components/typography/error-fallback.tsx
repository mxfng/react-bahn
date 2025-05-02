import Message from "./message";

interface ErrorFallbackProps {
  title?: string;
  message?: string;
  resetErrorBoundary?: () => void;
}

function ErrorFallback({
  title = "Something went wrong",
  message,
  resetErrorBoundary,
}: ErrorFallbackProps) {
  return (
    <div className="w-dvw h-dvh flex items-center justify-center">
      <div className="flex flex-col items-center justify-center h-full">
        <Message
          title={title}
          description={message}
          resetErrorBoundary={resetErrorBoundary}
        />
      </div>
    </div>
  );
}

export default ErrorFallback;
