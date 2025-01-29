from flask import Flask, render_template
import os

app = Flask(__name__)

# Get the background color from an environment variable (default: blue)
BACKGROUND_COLOR = os.getenv("BACKGROUND_COLOR", "blue")

@app.route("/")
def home():
    return f"""
    <html>
    <head><title>Flask App</title></head>
    <body style="background-color: {BACKGROUND_COLOR}; text-align: center;">
        <h1 style="color: white;">Hello from Flask!</h1>
        <p>Background Color: {BACKGROUND_COLOR}</p>
    </body>
    </html>
    """

if __name__ == "__main__":
    # Run on 0.0.0.0 to allow external access, using port 8080
    app.run(host="0.0.0.0", port=8080, debug=True)
