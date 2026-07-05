#!/bin/bash
set -e

echo "🚀 Starting Hermes Agent on Railway..."

# Initialize data directory if empty
if [ ! -f "/app/data/.initialized" ]; then
    echo "📦 First run detected - restoring backups..."
    
    # Extract skills
    if [ -f "/tmp/skills-backup.tar.gz" ]; then
        echo "📚 Extracting skills..."
        tar -xzf /tmp/skills-backup.tar.gz -C /app/data/
        echo "✅ Skills restored"
    fi
    
    # Create memories directory
    mkdir -p /app/data/memories
    
    # Copy memories
    if [ -f "/tmp/MEMORY.md" ]; then
        cp /tmp/MEMORY.md /app/data/memories/
        echo "✅ MEMORY.md restored"
    fi
    
    if [ -f "/tmp/USER.md" ]; then
        cp /tmp/USER.md /app/data/memories/
        echo "✅ USER.md restored"
    fi
    
    # Copy config
    if [ -f "/tmp/config.yaml" ]; then
        cp /tmp/config.yaml /app/data/
        echo "✅ config.yaml restored"
    fi
    
    # Mark as initialized
    touch /app/data/.initialized
    echo "✅ Initialization complete!"
else
    echo "✅ Data directory already initialized"
fi

echo "🌐 Starting Hermes Gateway..."
echo "Port: ${PORT:-8080}"
echo "Home: ${HERMES_HOME}"

# Start Hermes in gateway mode
exec hermes gateway run
