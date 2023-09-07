const mysql = require('mysql');
const express = require('express');
const session = require('express-session');
const path = require('path');
var connection = require('./connect_db');
const cookieParser = require('cookie-parser');

const app = express();
app.use(express.static(__dirname + '/public'));
app.use(express.static(__dirname ));
app.use(cookieParser());

app.use(session({
	secret: 'secret',
	resave: true,
	saveUninitialized: true
}));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(express.static(path.join(__dirname, 'static')));

app.get('/style.css', function(req, res) {
	res.sendFile(path.join(__dirname, 'style.css'), { headers: { 'Content-Type': 'text/css' } });
  });

// http://localhost:3000/
app.get('/', function(request, response) {
	// Render login template
	response.sendFile(path.join(__dirname + '/login.html'));
});

// http://localhost:3000/auth
app.post('/auth', function(request, response) {
	// Capture the input fields
	let username = request.body.username;
	let password = request.body.password;
	// Ensure the input fields exists and are not empty
	if (username && password) {
		// Execute SQL query that'll select the account from the database based on the specified username and password
		connection.query('SELECT * FROM login WHERE username = ? AND password = ?', [username, password], function(error, results, fields) {
			// If there is an issue with the query, output the error
			if (error) throw error;

			// If the account exists
			if (results.length > 0) {
				// Authenticate the user
				request.session.loggedin = true;
				request.session.username = username;
				// Redirect to home page
				// response.sendFile('home.html', { root: __dirname });

				if (results[0].type == 1) {
					response.redirect('/admin');
				} else {
					response.redirect('/home');
				}				
			} else {
				response.write('<script>alert("Incorrect Username and/or Password !!!");</script>');
			}			
			response.end();
		});
	} else {
		response.write('<script>alert("Please enter Username and Password!!!");</script>');
		response.end();
	}
});




// http://localhost:3000/home
app.get('/home', function(request, response) {
	// If the user is loggedin
	if (request.session.loggedin) {
		// Output username
        // response.redirect('home.html');
		// response.sendFile(path.join(__dirname, '/home.html'));
		// response.send('Welcome back, ' + request.session.username + '!');
		response.sendFile('home.html', { root: __dirname }, function(err) {
			if (err) {
				console.log(err);
				response.status(err.status).end();
			} else {
				response.end();
			}
		});
	} else {
		// Not logged in
		response.write('<script>alert("Please login to view this page!!!");</script>');
		response.end();
	}
	// response.end();
});

// http://localhost:3000/admin
app.get('/admin', function(request, response) {
	// If the admin is loggedin
	if (request.session.loggedin) {
		response.sendFile('admin_branches.html', { root: __dirname }, function(err) {
			if (err) {
				console.log(err);
				response.status(err.status).end();
			} else {
				response.end();
			}
		});
	} else {
		// Not logged in
		response.write('<script>alert("Please login to view this page!!!");</script>');
		response.end();
	}
	// response.end();
});

// Logout route    // http://localhost:3000/logout
app.get('/logout', function(request, response) {
	// Clear the session data
	request.session.destroy(function(err) {
	  if (err) {
		console.log(err);
	  } else {
		// Redirect to the login page
		response.redirect('/');
	  }
	});
  });

// http://localhost:3000/aim
app.get('/aim', function(request, response) {
	// Execute SQL query that'll select the exp from the database based on the specified exp_no
	connection.query('SELECT * FROM data_structures where exp_no=' + request.query.exp_no, function(error, results, fields) {
		// If there is an issue with the query, output the error
		if (error) throw error;

		// If the results exists
		if (results.length > 0) {
			// console.log(results);
			response.send(results);
			// response.redirect('/home');
		} else {
			console.log('Error in fetching Results for exp !!!');
			response.send('Error in fetching Results');
		}			
		response.end();
	});
});

// http://localhost:3000/course_details
app.get('/course_details', function(request, response) {
	// Execute SQL query that'll select the course details from the database based on the specified couse_code
	connection.query('SELECT * FROM courses where course_code="' + request.query.course_code + '"', function(error, results, fields) {
		// If there is an issue with the query, output the error
		if (error) throw error;

		// If the results exists
		if (results.length > 0) {
			// console.log(results);
			response.send(results);
		} else {
			console.log('Error in fetching Results for course details !!!');
			response.send('Error in fetching Results');
		}			
		response.end();
	});
});

// http://localhost:3000/list_of_exps
app.get('/list_of_exps', function(request, response) {
	// Execute SQL query that'll select all the exps of Data Structure from the database
	connection.query('SELECT exp_no, title FROM data_structures', function(error, results, fields) {
		// If there is an issue with the query, output the error
		if (error) throw error;
		// If the results exists
		if (results.length > 0) {
			// console.log(results);
			response.send(results);
		} else {
			console.log('Error in fetching Results for list of exps details !!!');
			response.send('Error in fetching Results');
		}			
		response.end();
	});
});

// http://localhost:3000/editExp
app.get('/editExp', function(request, response) {
	// Execute SQL query that'll select the exp from the database based on the specified expNo in cookies for editing
	connection.query('SELECT * FROM data_structures where exp_no=' + request.query.expNo, function(error, results, fields) {
		// If there is an issue with the query, output the error
		if (error) throw error;

		// If the results exists
		if (results.length > 0) {
			// console.log(results);
			response.send(results);
		} else {
			console.log('Error in fetching Results for editing exp !!!');
			response.send('Error in fetching Results');
		}			
		response.end();
	});
});

// http://localhost:3000/updateExp
app.post('/updateExp', function(request, response) {
	// Capture the input fields
	let title = request.body.title;
    let expNo = request.body.exp_no;
    let aim = request.body.aim;
    let theory = request.body.theory;

	// Ensure the input fields exists and are not empty
	if (title && expNo && aim && theory) {		
		// Execute SQL query that'll update the exp from the database based on the specified form fields extracted
		connection.query('UPDATE data_structures SET exp_no=' + expNo + ', title="' + title + '", aim="' + aim + '", theory="' + theory + '" WHERE exp_no=' + expNo,function(error, results, fields) {
			// If there is an issue with the query, output the error
			if (error) throw error;
			
			console.log("Rows affected : ",results.affectedRows);
			// If the account exists
			if (results.affectedRows > 0) {
				// Redirect to home page
				// response.sendFile('home.html', { root: __dirname });
				response.redirect('/expslist');			
			} else {
				response.write('<script>alert("Error in Updating !!!");</script>');
			}			
			response.end();
		});
	} else {
		response.write('<script>alert("No field should be Empty !!!");</script>');
		response.end();
	}
});

// http://localhost:3000/expslist
app.get('/expslist', function(request, response) {
	// response.write('<script>alert("Experiment Updated Successfully !!!");</script>');
	console.log("Experiment Updated Successfully !!!");
	response.sendFile('admin_branches.html', { root: __dirname }, function(err) {
		if (err) {
			console.log(err);
			response.status(err.status).end();
		} else {
			// response.write('<script>alert("Experiment Updated Successfully !!!");</script>');
			response.end();
		}
	});
	// response.end();
});

app.listen(3000);