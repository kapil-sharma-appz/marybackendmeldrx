const router = require('express').Router();
const patientRoute = require('./patient');
const workspaceRoute = require('./workspace');
const patientController = require('../controller/patient');


router.use('/Patient', patientRoute);
router.use('/workspace', workspaceRoute);

router.route('/:resourceType/:id?').get([patientController.getResourceDetails]);
router.route('/:resourceType/:id?').post([patientController.addPatientResource]);

module.exports = router