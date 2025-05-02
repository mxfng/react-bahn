import { TrainFrontTunnel } from "lucide-react";

import { BlurIn } from "@/components/animation/blur-in";
import { DotWave } from "@/components/animation/dot-wave";
import { InlineCode } from "@/components/typography/inline-code";
import { RootLayout } from "@/layouts/root-layout";

const Root: React.FC = () => {
  return (
    <RootLayout>
      <DotWave />
      <div>
        <TrainFrontTunnel className="size-28 stroke-primary" />
      </div>
      <BlurIn>React Bahn</BlurIn>
      <div className="card">
        <p>
          Edit <InlineCode>src/app/routes/root.tsx</InlineCode> and save to test
          HMR
        </p>
      </div>
      <p className="read-the-docs">Read the docs and enjoy the ride</p>
    </RootLayout>
  );
};

export default Root;
