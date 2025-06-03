import { TrainFrontTunnel } from "lucide-react";

import { BlurIn } from "@/components/animation/blur-in";
import { DotWave } from "@/components/animation/dot-wave";
import { InlineCode } from "@/components/typography/inline-code";
import { RootLayout } from "@/layouts/root-layout";

const Root: React.FC = () => {
  return (
    <RootLayout>
      <DotWave />
      <div className="absolute inset-0 flex flex-col items-center justify-center">
        <div>
          <TrainFrontTunnel className="size-28 stroke-primary" />
        </div>
        <BlurIn>React Bahn</BlurIn>
        <div>
          <p>
            Edit <InlineCode>src/app/routes/root.tsx</InlineCode> and save to
            test HMR
          </p>
        </div>
        <p>Read the docs and enjoy the ride</p>
      </div>
    </RootLayout>
  );
};

export default Root;
