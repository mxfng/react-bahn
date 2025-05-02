import { useAnimationFrame } from "framer-motion";
import React, { useEffect, useRef, useState } from "react";

const SPACING = 24; // px between dots
const DOT_SIZE = 4;
const WAVE_SPEED = 0.002;
const WAVE_LENGTH = 0.15;

export const DotWave: React.FC = () => {
  const containerRef = useRef<HTMLDivElement>(null);
  const dotRefs = useRef<HTMLDivElement[][]>([]);
  const [gridSize, setGridSize] = useState({ rows: 0, cols: 0 });
  const [mouse, setMouse] = useState({
    x: window.innerWidth / 2,
    y: window.innerHeight / 2,
  });

  // On mount: compute grid size based on screen
  useEffect(() => {
    const cols = Math.floor(window.innerWidth / SPACING);
    const rows = Math.floor(window.innerHeight / SPACING);
    setGridSize({ cols, rows });

    // initialize 2D array
    dotRefs.current = Array.from({ length: rows }, () =>
      Array.from({ length: cols }),
    );
  }, []);

  useAnimationFrame((t) => {
    const { rows, cols } = gridSize;

    for (let y = 0; y < rows; y++) {
      for (let x = 0; x < cols; x++) {
        const dot = dotRefs.current[y][x];
        if (!dot) continue;

        // wave scale
        const dx = x - cols / 2;
        const dy = y - rows / 2;
        const dist = Math.sqrt(dx * dx + dy * dy);
        const wave = Math.sin(t * WAVE_SPEED - dist * WAVE_LENGTH);
        const scale = 0.7 + 0.3 * wave;
        dot.style.transform = `scale(${scale})`;

        // distance to mouse glow
        const dotX = x * SPACING;
        const dotY = y * SPACING;
        const distToMouse = Math.hypot(mouse.x - dotX, mouse.y - dotY);

        // max glow radius in pixels
        const GLOW_RADIUS = 150;
        const glow = Math.max(0, 1 - distToMouse / GLOW_RADIUS);
        dot.style.opacity = `${0.2 + 0.6 * glow}`; // base + glow
      }
    }
  });

  useEffect(() => {
    const handleMove = (e: MouseEvent) => {
      setMouse({ x: e.clientX, y: e.clientY });
    };
    window.addEventListener("mousemove", handleMove);
    return () => window.removeEventListener("mousemove", handleMove);
  }, []);

  return (
    <div
      ref={containerRef}
      className="fixed inset-0 z-0 pointer-events-none grid"
      style={{
        gridTemplateColumns: `repeat(${gridSize.cols}, ${SPACING}px)`,
        gridTemplateRows: `repeat(${gridSize.rows}, ${SPACING}px)`,
        justifyContent: "center",
        alignContent: "center",
      }}
    >
      {Array.from({ length: gridSize.rows }).map((_, y) =>
        Array.from({ length: gridSize.cols }).map((_, x) => (
          <div
            key={`${y}-${x}`}
            ref={(el) => {
              if (el) dotRefs.current[y][x] = el;
            }}
            className="w-1 h-1 bg-primary/50 rounded-full"
            style={{
              width: DOT_SIZE,
              height: DOT_SIZE,
            }}
          />
        )),
      )}
    </div>
  );
};
