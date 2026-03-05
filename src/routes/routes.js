const router = require('express').Router();
const patientRoute = require('./patient');
const workspaceRoute = require('./workspace');
const patientController = require('../controller/patient');


router.get('/healthcheck', (req, res) => {
    console.log('healthcheckhit')
    res.status(200).send('it works');
});

router.get('/patient', patientController.getPatientByToken);
router.use('/Patient', patientRoute);
router.use('/workspace', workspaceRoute);

// Token-based patient lookup: GET or POST /api/patient?token=<access_token>

router.route('/:resourceType/:id?').get([patientController.getResourceDetails]);
router.route('/:resourceType/:id?').post([patientController.addPatientResource]);

module.exports = router