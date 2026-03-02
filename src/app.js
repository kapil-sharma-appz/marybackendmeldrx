require('dotenv').config()
const express = require('express');
var axios = require('axios');
const querystring = require("querystring");
const crypto = require("crypto");
const helper = require('../src/helper/helper');
var cors = require("cors");

const CODE_VERIFIER = crypto.randomBytes(32).toString("base64url");

const app = express();
app.use(express.json()); 
app.use(cors()); 

app.use(function (req, res, next) {
    //Enabling CORS
    res.header("Access-Control-Allow-Origin", "*");
    res.header(
        "Access-Control-Allow-Methods",
        "GET,HEAD,OPTIONS,POST,PUT,DELETE"
    );
    res.header(
        "Access-Control-Allow-Headers",
        "Origin, X-Requested-With, Content-Type, Accept, x-client-key, x-client-token, x-client-secret, Authorization"
    );
    next();
    return;
});
app.get("/api/login", async (req, res) => {
	try {
			const authParams = querystring.stringify({
				client_id: process.env.CLIENT_ID,
				aud: process.env.MELDRX_WS_URL,
				redirect_uri: process.env.REDIRECT_URI,
				scope: process.env.SCOPES,
				response_type: "code",
				code_challenge: helper.generateCodeChallenge(CODE_VERIFIER),
				code_challenge_method: "S256",
			});
			const authUrl = `${process.env.MELDRX_BASE_URL}connect/authorize?${authParams}`;
			// const response =res.redirect(authUrl);
			
			return res.status(200).send(helper.response(200, 'success', {authUrl,CODE_VERIFIER,clientID: process.env.CLIENT_ID,meldrxUrl:process.env.MELDRX_BASE_URL}));
	
		} catch (err) {
			console.error("Error fetching auth list:", err.message);
			return res.status(500).send(helper.response(500, 'error', err.message));
		}
});

app.get("/callback", async (req, res) => {
	const { code } = req.query;
	  
		if (!code) {
		  return res.status(400).json(helper.response(400, "error", "Authorization code missing"));
		}
	  
		try {
		  const tokenResponse = await axios.post(
			process.env.MELDRX_BASE_URL+"connect/token",
			querystring.stringify({
			  client_id: process.env.CLIENT_ID,
			  grant_type: "authorization_code",
			  code: code,
			  redirect_uri: process.env.REDIRECT_URI,
			  code_verifier: CODE_VERIFIER,
			}),
			{
			  headers: {
				"Content-Type": "application/x-www-form-urlencoded",
			  },
			}
		  );
		  return res.status(200).send(helper.response(200, 'success', {access_token:tokenResponse.data.access_token,patient:tokenResponse.data.patient}));
	  
		} catch (error) {
		  console.log(error);
		  console.error("Error fetching token:", error.response?.data || error.message);
		  return res.status(500).json(helper.response(500, "error", "Authentication failed"));
		}
});

app.use('/api', require('./routes/routes'));

app.listen(8000, () => {
	console.log('Server started on http://localhost:8000');
})