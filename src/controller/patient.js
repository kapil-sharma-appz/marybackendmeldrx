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
        console.log(response.data)
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
        console.log(response.data)
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
        const { requestBody: wrappedBody } = req.body;
        const requestBody = wrappedBody || req.body;
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
        console.log(config)
        const response = await axios(config);
        console.log(11111111111,response)
        return res.status(200).send(helper.response(200, 'success', response.data));

    } catch (err) {
        console.log(err)

        console.log("FHIR ERROR:", JSON.stringify(err.response?.data, null, 2));

        console.error("Error adding data:", err.message);
        return res.status(500).send(helper.response(500, 'error', { message: err.message, error: err.response?.data?.errors }));
    }
};


patient.getPatientByToken = async (req, res) => {
    try {
        console.log('[API CALLED] GET /api/patient – getPatientByToken', req.query);
        const { token } = req.query;

        if (!token) {
            return res.status(400).send(helper.response(400, 'error', 'Query param `token` is required.'));
        }

        // Use the token to fetch the Patient list from the FHIR workspace
        const url = `${process.env.MELDRX_WS_URL}/Patient`;

        const config = {
            method: 'GET',
            maxBodyLength: Infinity,
            url: url,
            headers: {
                'Authorization': `Bearer ${token}`,
            },
        };

        const response = await axios(config);
        const bundle = response.data;

        // Return the full bundle or just the first patient entry
        const patients = bundle?.entry?.map(e => e.resource) || [];
        console.log(patients)
        return res.status(200).send(helper.response(200, 'success', { patients, total: bundle?.total ?? patients.length }));

    } catch (err) {
        console.error('Error in getPatientByToken:', err.message);
        if (err.response?.status === 401 || err.response?.status === 403) {
            return res.status(err.response.status).send(helper.response(err.response.status, 'error', 'Invalid or expired token.'));
        }
        return res.status(500).send(helper.response(500, 'error', err.message));
    }
};


module.exports = patient