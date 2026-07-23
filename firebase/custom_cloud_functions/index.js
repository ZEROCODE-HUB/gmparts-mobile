const admin = require("firebase-admin/app");
admin.initializeApp();

const deleteUser = require("./delete_user.js");
exports.deleteUser = deleteUser.deleteUser;
