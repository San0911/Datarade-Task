from flask import Flask, jsonify
import psycopg2
import os

app = Flask(__name__)

# Fetch database credentials from environment variables (injected from Kubernetes secrets)
DB_HOST = os.getenv("DB_HOST")
DB_NAME = os.getenv("DB_NAME")
DB_USER = os.getenv("DB_USER")
DB_PASSWORD = os.getenv("DB_PASSWORD")

@app.route('/')
def home():
    return jsonify({"message": "Welcome to the sample application!"})

@app.route('/health', methods=['GET'])
def health_check():
    try:
        # Attempt to connect to the database
        connection = psycopg2.connect(
            host=DB_HOST,
            database=DB_NAME,
            user=DB_USER,
            password=DB_PASSWORD
        )
        cursor = connection.cursor()
        cursor.execute("SELECT 1;")
        cursor.close()
        connection.close()
        return jsonify({"status": "healthy", "db_connection": "successful"})
    except Exception as e:
        return jsonify({"status": "unhealthy", "error": str(e)}), 500

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)
