const express = require('express');
const router = express.Router();
const workspaceController = require('../controller/workspace');

router.route('/').get([workspaceController.getWorkspace]);

module.exports = router;