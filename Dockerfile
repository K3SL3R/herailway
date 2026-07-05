# Hermes Agent Dockerfile for Railway
FROM python:3.11-slim

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    bash \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Install Node.js (برای بعضی tools)
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

# Install uv (fast Python package installer)
RUN pip install --no-cache-dir uv

# Install Hermes Agent
RUN pip install --no-cache-dir hermes-agent

# Copy backup files
COPY skills-backup.tar.gz /tmp/
COPY MEMORY.md /tmp/
COPY USER.md /tmp/
COPY config.yaml /tmp/
COPY entrypoint.sh /app/

# Make entrypoint executable
RUN chmod +x /app/entrypoint.sh

# Create data directory
RUN mkdir -p /app/data

# Environment variables
ENV HERMES_HOME=/app/data
ENV HERMES_GATEWAY=true
ENV PORT=8080
ENV PYTHONUNBUFFERED=1

# Expose port
EXPOSE 8080

# Volume for persistent data
VOLUME /app/data

# Entrypoint script will restore backups on first run
ENTRYPOINT ["/app/entrypoint.sh"]
