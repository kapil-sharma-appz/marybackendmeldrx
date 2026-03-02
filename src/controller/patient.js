var axios = require('axios');
const patient = {};
// const querystring = require("querystring");
const helper = require('../helper/helper');

patient.getPatientList = async (req, res) => {
    try {
        console.log('[API CALLED] GET /Patient – getPatientList', req.query);
        const { given, family, birthdate, gender, name } = req.query;
        const authHeader = req.headers['authorization'] || '';
        const token = authHeader.startsWith('Bearer ') ? authHeader.slice(7) : null;

        if (!token) {
            return res.status(401).send(helper.response(401, 'error', 'Authorization token is required (Bearer).'));
        }
        // if (!given) {
        //     return res.status(400).send(helper.response(400, 'error', 'Given name is required.'));
        // }
        // if (!family) {
        //     return res.status(400).send(helper.response(400, 'error', 'Family name is required.'));
        // }
        // if (!birthdate) {
        //     return res.status(400).send(helper.response(400, 'error', 'Date of birth is required.'));
        // }

        if (birthdate && !/^\d{4}-\d{2}-\d{2}$/.test(birthdate)) {
            return res.status(400).send(helper.response(400, 'error', 'Invalid date format. Use YYYY-MM-DD.'));
        }

        const queryParams = new URLSearchParams();
        if (given) queryParams.append("given", given);
        if (name) queryParams.append("name", name);
        if (family) queryParams.append("family", family);
        if (birthdate) queryParams.append("birthdate", birthdate);
        if (gender) queryParams.append("birthdate", gender);

        const url = `${process.env.MELDRX_WS_URL}/Patient?${queryParams.toString()}`;

        const config = {
            method: 'GET',
            maxBodyLength: Infinity,
            url: url,
            headers: {
                'Authorization': `Bearer ${token}`,
            },
        };

        const response = await axios(config);

        return res.status(200).send(helper.response(200, 'success', response.data));

    } catch (err) {
        console.error("Error fetching patient list:", err.message);
        if (err.status === 403) {
            return res.status(403).send(helper.response(403, 'error', 'Forbidden: You do not have permission to access this resource.'));
        }
        return res.status(500).send(helper.response(500, 'error', err.message));
    }
};


patient.getPatient = async (req, res) => {
    try {
        console.log('[API CALLED] GET /Patient/:patient_id – getPatient', { patient_id: req.params.patient_id });
        const { patient_id } = req.params;
        const authHeader = req.headers['authorization'] || '';
        const token = authHeader.startsWith('Bearer ') ? authHeader.slice(7) : null;
        console.log('backend called');
        if (!token) {
            return res.status(401).send(helper.response(401, 'error', 'Authorization token is required (Bearer).'));
        }
        if (!patient_id) {
            return res.status(400).send(helper.response(400, 'error', 'Patient Id is required.'));
        }

        const config = {
            method: 'GET',
            maxBodyLength: Infinity,
            url: `${process.env.MELDRX_WS_URL}/Patient/${patient_id}`,
            headers: {
                'Authorization': `Bearer ${token}`,
            }
        };

        const response = await axios(config);
        return res.status(200).send(helper.response(200, 'success', response.data));

    } catch (err) {
        console.error("Error fetching patient:", err);
        return res.status(500).send(helper.response(500, 'error', err.message));
    }
};

patient.getResourceDetails = async (req, res) => {
    try {
        console.log('[API CALLED] GET /:resourceType/:id? – getResourceDetails', { ...req.params, ...req.query });
        const { patient, parameters } = req.query;
        const { id, resourceType } = req.params;
        const authHeader = req.headers['authorization'] || '';
        const token = authHeader.startsWith('Bearer ') ? authHeader.slice(7) : null;

        if (!token) {
            return res.status(401).send(helper.response(401, 'error', 'Authorization token is required (Bearer).'));
        }
        if (!resourceType) {
            return res.status(400).send(helper.response(400, 'error', 'Resource Type is required.'));
        }

        if (id && patient) {
            return res.status(400).send(helper.response(400, 'error', 'Provide either resource ID or patient ID, not both.'));
        }
        if (!id && !patient) {
            return res.status(400).send(helper.response(400, 'error', 'Either resource ID or patient ID is required.'));
        }

        let url = `${process.env.MELDRX_WS_URL}/${resourceType}`;

        if (id) {
            url += `/${id}`;
        }

        const queryParams = new URLSearchParams();
        queryParams.append("_count", "500");

        if (patient && !id) {
            queryParams.append("patient", patient);
        }
        if (parameters) {
            const extraParams = new URLSearchParams(parameters);
            extraParams.forEach((value, key) => {
                queryParams.append(key, value);
            });
        }

        if (queryParams.toString()) {
            url += `?${queryParams.toString()}`;
        }

        console.log("Final URL:", url);

        const config = {
            method: 'GET',
            maxBodyLength: Infinity,
            url: url,
            headers: {
                'Authorization': `Bearer ${token}`,
            }
        };

        const response = await axios(config);
        return res.status(200).send(helper.response(200, 'success', response.data));

    } catch (err) {
        console.error("Error fetching data:", err.message);
        return res.status(500).send(helper.response(500, 'error', err.message));
    }
};

patient.addPatientResource = async (req, res) => {
    try {
        console.log('[API CALLED] POST /:resourceType – addPatientResource', { resourceType: req.params.resourceType });
        const { resourceType } = req.params;
        const { requestBody } = req.body;
        const authHeader = req.headers['authorization'] || '';
        const token = authHeader.startsWith('Bearer ') ? authHeader.slice(7) : null;

        if (!token) {
            return res.status(401).send(helper.response(401, 'error', 'Authorization token is required (Bearer).'));
        }
        if (!resourceType) {
            return res.status(400).send(helper.response(400, 'error', 'Resource Type is required.'));
        }

        if (!requestBody) {
            return res.status(400).send(helper.response(400, 'error', 'Resource Body is required.'));
        }

        let url = `${process.env.MELDRX_WS_URL}/${resourceType}`;

        const config = {
            method: 'POST',
            maxBodyLength: Infinity,
            url: url,
            headers: {
                'Authorization': `Bearer ${token}`,
            },
            data: requestBody,
        };

        const response = await axios(config);
        return res.status(200).send(helper.response(200, 'success', response.data));

    } catch (err) {
        console.log(err.response.data.errors)
        console.error("Error adding data:", err.message);
        return res.status(500).send(helper.response(500, 'error', { message: err.message, error: err.response?.data?.errors }));
    }
};


module.exports = patient