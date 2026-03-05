const express = require('express');
const router = express.Router();
const patientController = require('../controller/patient');

router.route('/:patient_id').get([patientController.getPatient]);
router.route('/').get([patientController.getPatientList]);





module.exports = router;