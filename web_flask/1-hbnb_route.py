#!/usr/bin/python3
'''Script to use flask.'''

from flask import Flask


app = Flask(__name__)


@app.route("/", strict_slashes=False)
def Hello_Hbnb():
    return 'Hello HBNB!'


@app.route("/hbnb", strict_slashes=False)
def from_hbnb():
    return 'HBNB'


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
