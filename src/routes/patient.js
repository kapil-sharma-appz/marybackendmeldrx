const express = require('express');
const router = express.Router();
const patientController = require('../controller/patient');

router.route('/').get([patientController.getPatientList]);

router.route('/:patient_id').get([patientController.getPatient]);

router.route('/resource/:resourceType/:id?').get([patientController.getResourceDetails]);

router.route('/resource/:resourceType/:id?').post([patientController.addPatientResource]);



module.exports = router;