#!/bin/bash

echo "Setting up App Engine project..."

# Create files (in case missing)
cat > main.py << 'EOF'
from flask import Flask
app = Flask(__name__)

@app.route('/')
def home():
    return '<h1>Hello from App Engine!</h1><p>Deployed on GCP PaaS - Mumbai</p>'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
EOF

cat > requirements.txt << 'EOF'
Flask==3.0.0
gunicorn==21.2.0
EOF

cat > app.yaml << 'EOF'
runtime: python312

automatic_scaling:
  min_instances: 0
  max_instances: 10
  target_cpu_utilization: 0.6
EOF

echo "Deploying to App Engine..."
gcloud app deploy --quiet

echo "Opening app..."
gcloud app browse
