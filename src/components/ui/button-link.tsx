import { motion } from "framer-motion";
import { ArrowRight } from "lucide-react";
import { Link } from "react-router-dom";

interface ButtonLinkProps {
  to: string;
  children: React.ReactNode;
  className?: string;
}

export const ButtonLink: React.FC<ButtonLinkProps> = ({
  to,
  children,
  className = "",
}) => (
  <div className={`group inline-flex items-center gap-1 ${className}`}>
    <Link to={to} className="inline-flex items-center gap-1.5 font-medium">
      <span className="relative">
        {children}
        <span className="absolute -bottom-0.5 left-0 h-[1px] w-0 bg-primary transition-all duration-300 group-hover:w-full"></span>
      </span>
      <motion.span
        animate={{ x: 0 }}
        whileHover={{ x: 3 }}
        transition={{ type: "spring", stiffness: 400, damping: 10 }}
        className="inline-flex"
      >
        <ArrowRight className="w-4 h-4" />
      </motion.span>
    </Link>
  </div>
);
