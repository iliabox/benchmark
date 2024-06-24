# Start from Alpine base image
FROM alpine:latest

# Install necessary build tools and languages
RUN apk add --no-cache \
    bash \
    nodejs \
    npm \
    php \
    python3 \
    go \
    gcc \
    musl-dev

# Copy scripts to the container
COPY benchmark.js /app/benchmark.js
COPY benchmark.php /app/benchmark.php
COPY benchmark.py /app/benchmark.py
COPY benchmark.go /app/benchmark.go

# Set working directory
WORKDIR /app

# Compile Go script
RUN go build -o benchmark_go benchmark.go

# Create a script to run benchmarks and show interpreter versions
RUN echo '#!/bin/sh' > run_benchmarks.sh && \
    echo 'set -x' >> run_benchmarks.sh && \
    echo 'echo "Interpreter and compiler versions:"' >> run_benchmarks.sh && \
    echo 'node --version' >> run_benchmarks.sh && \
    echo 'php --version' >> run_benchmarks.sh && \
    echo 'python3 --version' >> run_benchmarks.sh && \
    echo 'go version' >> run_benchmarks.sh && \
    echo 'echo "Benchmark results:"' >> run_benchmarks.sh && \
    echo 'echo "JavaScript:"' >> run_benchmarks.sh && \
    echo 'node benchmark.js' >> run_benchmarks.sh && \
    echo 'echo "PHP:"' >> run_benchmarks.sh && \
    echo 'php benchmark.php' >> run_benchmarks.sh && \
    echo 'echo "Python:"' >> run_benchmarks.sh && \
    echo 'python3 benchmark.py' >> run_benchmarks.sh && \
    echo 'echo "Go:"' >> run_benchmarks.sh && \
    echo './benchmark_go' >> run_benchmarks.sh

# Grant execution permissions to the script
RUN chmod +x run_benchmarks.sh

# Run benchmarks when the container starts
CMD ["/bin/sh", "-c", "cd /app && ./run_benchmarks.sh"]
