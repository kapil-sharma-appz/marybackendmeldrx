const express = require('express');
const router = express.Router();
const patientController = require('../controller/patient');

router.route('/').get([patientController.getPatientList]);

router.route('/:patient_id').get([patientController.getPatient]);




module.exports = router;