from flask import Flask, request, jsonify, make_response, abort, Response, render_template, url_for

app = Flask(__name__)


@app.route('/')
def index():
	return render_template('index.html')


@app.route('/loaderio-74a2955a39098eee67b08667a6396dcb/')
def loaderio():
	return 'loaderio-74a2955a39098eee67b08667a6396dcb'


app.run(debug=True, host='0.0.0.0', port=80, threaded=True)
