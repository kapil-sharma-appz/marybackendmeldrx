const router = require('express').Router();
const patientRoute = require('./patient');
const workspaceRoute = require('./workspace');
const patientController = require('../controller/patient');


router.get('/healthcheck', (req, res) => {
    res.status(200).send('it works');
});

router.use('/Patient', patientRoute);
router.use('/workspace', workspaceRoute);

// Token-based patient lookup: GET or POST /api/patient?token=<access_token>
router.get('/api/patient', patientController.getPatientByToken);
router.post('/api/patient', patientController.getPatientByToken);

router.route('/:resourceType/:id?').get([patientController.getResourceDetails]);
router.route('/:resourceType/:id?').post([patientController.addPatientResource]);

module.exports = router