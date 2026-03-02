var axios = require('axios');
const workspace = {};
const helper = require('../helper/helper');

workspace.getWorkspace = async (req, res) => {
    try {
        const config = {
            method: 'get',
            maxBodyLength: Infinity,
            url: `${process.env.API_BASE_URL}workspaces/records`,
            headers: { 
                'Authorization': `Bearer ${req.accessToken}`,  
            }
        };

        const response = await axios(config);
        
        return res.status(200).send(helper.response(200, 'success', response.data));

    } catch (err) {
        console.error("Error fetching workspace list:", err.message);
        return res.status(500).send(helper.response(500, 'error', err.message));
    }
};

module.exports = workspace