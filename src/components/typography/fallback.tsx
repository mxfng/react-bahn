import { Loader2 } from "lucide-react";

import { cn } from "@/lib/utils";

interface FallbackProps {
  className?: string;
}

const Fallback = ({ className }: FallbackProps) => {
  return (
    <div
      className={cn(
        "fixed inset-0 flex justify-center items-center",
        className,
      )}
    >
      <Loader2 className="text-primary animate-spin" size={32} />
    </div>
  );
};

export default Fallback;
