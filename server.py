from flask import Flask, request, jsonify, make_response, abort, Response, render_template, url_for

app = Flask(__name__)


@app.route('/')
def index():
	return render_template('index.html')

app.run(debug=True, host='0.0.0.0', port=80, threaded=True)
