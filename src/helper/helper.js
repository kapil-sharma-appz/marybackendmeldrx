const crypto = require("crypto");

var response = (status,message,data) => {
    return {
        status: status,
        message : message,
        data : data
     }
}

var generateCodeChallenge =  (verifier) => {
  return crypto
    .createHash("sha256")
    .update(verifier)
    .digest("base64")
    .replace(/=/g, "")
    .replace(/\+/g, "-")
    .replace(/\//g, "_");
}

module.exports = {response,generateCodeChallenge}