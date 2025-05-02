import React from "react";

import { Button } from "../ui/button";
import { ButtonLink } from "../ui/button-link";

interface MessageProps {
  title?: string;
  description?: string;
  linkUrl?: string;
  linkText?: string;
  resetErrorBoundary?: () => void;
}

const Message: React.FC<MessageProps> = ({
  title,
  description,
  linkUrl,
  linkText,
  resetErrorBoundary,
}) => (
  <div className="w-full max-w-3xl flex flex-col items-center justify-center text-center py-8">
    <div className="space-y-6">
      {title && (
        <h1 className="text-3xl md:text-4xl font-bold tracking-tighter">
          {title}
        </h1>
      )}

      {description && (
        <p className="text-md md:text-lg px-4 opacity-80">{description}</p>
      )}

      {linkUrl && linkText && (
        <div className="pt-4 opacity-70 text-sm">
          <ButtonLink to={linkUrl}>{linkText}</ButtonLink>
        </div>
      )}

      {resetErrorBoundary && (
        <div className="pt-4 opacity-70 text-sm">
          <Button variant="ghost" onClick={resetErrorBoundary}>
            Try again
          </Button>
        </div>
      )}
    </div>
  </div>
);

export default Message;
