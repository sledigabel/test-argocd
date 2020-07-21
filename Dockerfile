FROM golang as stage0
WORKDIR /go/src/github.com/sledigabel/test-argocd/
COPY app/app.go .
RUN CGO_ENABLED=0 GOOS=linux go build -o /app app.go

FROM scratch
COPY --from=stage0 /app /app
EXPOSE 8080
CMD [ '/app' ]
