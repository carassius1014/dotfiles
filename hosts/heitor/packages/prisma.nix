{ pkgs, prisma-factory }:

(prisma-factory {
  inherit pkgs;
  prisma-fmt-hash = "sha256-gCbyLJm8n3NJY/hVHiWFTzZy0F5ecQNMNJ5C/wNuy2c=";
  query-engine-hash = "sha256-lnBbm4d5yO2p5dNotk0J2erH+6BIPN7nSsrvHqB49lM=";
  libquery-engine-hash = "sha256-HQ3N6sKc/PzDeWiweR62Ww8n/yplS+PUbNiq3NwqRU4=";
  schema-engine-hash = "sha256-/5bYzArAbHGsHbRRmR1gNk9JABC8uEyXOAVxNYRqU8c=";
}).fromBunLock
  ../../../bun.lock
