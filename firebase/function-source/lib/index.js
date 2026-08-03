"use strict";
var __createBinding = (this && this.__createBinding) || (Object.create ? (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    var desc = Object.getOwnPropertyDescriptor(m, k);
    if (!desc || ("get" in desc ? !m.__esModule : desc.writable || desc.configurable)) {
      desc = { enumerable: true, get: function() { return m[k]; } };
    }
    Object.defineProperty(o, k2, desc);
}) : (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    o[k2] = m[k];
}));
var __setModuleDefault = (this && this.__setModuleDefault) || (Object.create ? (function(o, v) {
    Object.defineProperty(o, "default", { enumerable: true, value: v });
}) : function(o, v) {
    o["default"] = v;
});
var __importStar = (this && this.__importStar) || (function () {
    var ownKeys = function(o) {
        ownKeys = Object.getOwnPropertyNames || function (o) {
            var ar = [];
            for (var k in o) if (Object.prototype.hasOwnProperty.call(o, k)) ar[ar.length] = k;
            return ar;
        };
        return ownKeys(o);
    };
    return function (mod) {
        if (mod && mod.__esModule) return mod;
        var result = {};
        if (mod != null) for (var k = ownKeys(mod), i = 0; i < k.length; i++) if (k[i] !== "default") __createBinding(result, mod, k[i]);
        __setModuleDefault(result, mod);
        return result;
    };
})();
Object.defineProperty(exports, "__esModule", { value: true });
exports.sendEmail = exports.approveReception = exports.approveReport = exports.approveQuote = exports.validateKey = exports.generateLink = void 0;
const admin = __importStar(require("firebase-admin"));
admin.initializeApp();
var generateLink_1 = require("./generateLink");
Object.defineProperty(exports, "generateLink", { enumerable: true, get: function () { return generateLink_1.generateLink; } });
var validateKey_1 = require("./validateKey");
Object.defineProperty(exports, "validateKey", { enumerable: true, get: function () { return validateKey_1.validateKey; } });
var approveQuote_1 = require("./approveQuote");
Object.defineProperty(exports, "approveQuote", { enumerable: true, get: function () { return approveQuote_1.approveQuote; } });
var approveReport_1 = require("./approveReport");
Object.defineProperty(exports, "approveReport", { enumerable: true, get: function () { return approveReport_1.approveReport; } });
var approveReception_1 = require("./approveReception");
Object.defineProperty(exports, "approveReception", { enumerable: true, get: function () { return approveReception_1.approveReception; } });
var sendEmail_1 = require("./sendEmail");
Object.defineProperty(exports, "sendEmail", { enumerable: true, get: function () { return sendEmail_1.sendEmail; } });
