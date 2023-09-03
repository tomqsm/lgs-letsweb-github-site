FROM hugomods/hugo:latest as hugo-builder

ARG HUGO_BASEURL=
ENV HUGO_BASEURL=${HUGO_BASEURL}

COPY . /src
RUN git status
RUN hugo --minify --gc --enableGitInfo

RUN chmod +x pagefind-linux
RUN ./pagefind-linux --source public --verbose

FROM --platform=linux/amd64 europe-central2-docker.pkg.dev/lwb-system/lgs-server/lgs-server:3-amd64

COPY --from=hugo-builder /src/public /app/public
EXPOSE 3000

# Define the command to run the executable
CMD ["./main"]