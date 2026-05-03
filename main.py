from flask import Flask
app = Flask(__name__)

@app.route('/')
def home():
    return '<h1>Hello from App Engine!</h1><p>Deployed on GCP PaaS - Mumbai</p>'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
