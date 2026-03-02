
const axios = require('axios');
const qs = require('qs');

let accessToken = null;
let tokenExpiry = null; 

const getAccessToken = async () => {
  const currentTime = Math.floor(Date.now() / 1000);

  if (accessToken && tokenExpiry && currentTime < tokenExpiry) {
    return accessToken;
  }

  const data = qs.stringify({
    'client_id': process.env.CLIENT_ID,
    'client_secret': process.env.CLIENT_SECRET,
    'grant_type': 'client_credentials',
    'scope': 'meldrx-api patient/*.* cds'
  });

  try {
    const response = await axios.post(process.env.TOKEN_URL, data, {
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
    });
    accessToken = response.data.access_token;
    tokenExpiry = currentTime + response.data.expires_in;

    return accessToken;
  } catch (error) {
    console.error("Error fetching access token:", error.response?.data || error.message);
    throw new Error("Failed to obtain access token");
  }
};

module.exports = { getAccessToken };
