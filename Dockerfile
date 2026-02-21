FROM oven/bun:latest AS build
WORKDIR /app

COPY package.json bun.lock ./
RUN bun install --frozen-lockfile

COPY . .

FROM oven/bun:slim
WORKDIR /app

COPY --from=build /app /app

EXPOSE 3000
CMD ["bun", "run", "start"]
