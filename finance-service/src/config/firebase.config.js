"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.db = void 0;
var admin = require("firebase-admin");
var serviceAccountKey_json_1 = require("./serviceAccountKey.json");
admin.initializeApp({
    credential: admin.credential.cert(serviceAccountKey_json_1.default),
});
exports.db = admin.firestore();
