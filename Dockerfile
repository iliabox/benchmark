# Use an image with all necessary languages
FROM nikolaik/python-nodejs:latest

# Install PHP
RUN apt-get update && apt-get install -y php

# Copy scripts to the container
COPY benchmark.js /app/benchmark.js
COPY benchmark.php /app/benchmark.php
COPY benchmark.py /app/benchmark.py

# Create a script to run benchmarks and show interpreter versions
RUN echo '#!/bin/bash\n\
echo "Interpreter versions:"\n\
echo "Node.js:"\n\
node --version\n\
echo "PHP:"\n\
php --version | head -n 1\n\
echo "Python:"\n\
python --version\n\
echo "\nBenchmark results:"\n\
echo "\nJavaScript:"\n\
node /app/benchmark.js\n\
echo "\nPHP:"\n\
php /app/benchmark.php\n\
echo "\nPython:"\n\
python /app/benchmark.py' > /app/run_benchmarks.sh

# Grant execution permissions to the script
RUN chmod +x /app/run_benchmarks.sh

# Set working directory
WORKDIR /app

# Run benchmarks when the container starts
CMD ["./run_benchmarks.sh"]
