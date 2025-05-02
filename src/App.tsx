import "./App.css";

import { ErrorBoundary, FallbackProps } from "react-error-boundary";
import { RouterProvider } from "react-router-dom";
import ErrorFallback from "./components/typography/error-fallback";
import { router } from "./router";

interface AppProps {
  errorFallbackComponent?: React.ComponentType<FallbackProps>;
  onResetError?: () => void;
}

function App({
  errorFallbackComponent = ErrorFallback,
  onResetError = () => window.location.reload(),
}: AppProps) {
  return (
    <ErrorBoundary
      FallbackComponent={errorFallbackComponent}
      onReset={onResetError}
    >
      <RouterProvider router={router} />
    </ErrorBoundary>
  );
}

export default App;
