const router = require('express').Router();
const patientRoute = require('./patient');
const workspaceRoute = require('./workspace');


router.use('/patient', patientRoute);
router.use('/workspace', workspaceRoute);

module.exports = router