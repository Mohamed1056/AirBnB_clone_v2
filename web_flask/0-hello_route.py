#!/usr/bin/python3
'''Script to start a flask web app.'''

from flask import Flask

# Create the Flask application instance
app = Flask(__name__)

# Route for the homepage
@app.route('/', strict_slashes=False)
def index():
    return 'Hello HBNB!'

if __name__ == '__main__':
    # Run the Flask app
    app.run(host='0.0.0.0', port=5000)
