# <b>TwoStepVerification Api v1</b>

## /v1/users/{userId}/recovery-codes/regenerate
```json
{
    "Method": "POST",
    "Description": "Clears any existing recovery codes and generates a new batch of recovery codes.",
    "Consumes": {
        "1": "application/json",
        "2": "text/json",
        "3": "application/x-www-form-urlencoded"
    },
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "userId",
            "format": "int64",
            "required": true,
            "description": "The user ID to generate recovery codes for."
        },
        "2": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Request information needed to regenerate recovery codes.",
                    "properties": {
                        "password": {
                            "description": "The user's password.",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "The {Roblox.TwoStepVerification.Api.RegenerateRecoveryCodesRequest}."
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n6: The account pin is locked."
        },
        "400": {
            "description": "2: The user ID is invalid.\r\n4: The password is invalid."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "The response for regenerating recovery codes.",
                    "properties": {
                        "recoveryCodes": {
                            "items": {
                                "type": "string"
                            },
                            "type": "array",
                            "description": "The collection of generated recovery codes."
                        }
                    }
                }
            }
        },
        "429": {
            "description": "5: Too many requests."
        },
        "503": {
            "description": "7: Two step verification is currently under maintenance."
        }
    },
}
```
<hr>


## /v1/users/{userId}/challenges/recovery-codes/verify
```json
{
    "Method": "POST",
    "Description": "Verifies a two step verification challenge via a recovery code.",
    "Consumes": {
        "1": "application/json",
        "2": "text/json",
        "3": "application/x-www-form-urlencoded"
    },
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "userId",
            "format": "int64",
            "required": true,
            "description": "The user ID."
        },
        "2": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Request parameters for verifying a two step verification code.",
                    "properties": {
                        "actionType": {
                            "enum": {
                                "1": "Unknown",
                                "2": "Login"
                            },
                            "description": "The {Roblox.TwoStepVerification.Client.TwoStepVerificationActionType} associated with the challenge.",
                            "type": "string"
                        },
                        "code": {
                            "description": "The two step verification code.",
                            "type": "string"
                        },
                        "challengeId": {
                            "description": "The two step verification challenge ID.",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "The {Roblox.TwoStepVerification.Api.VerifyCodeRequest}."
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed"
        },
        "400": {
            "description": "1: Invalid challenge ID.\r\n2: The user ID is invalid.\r\n10: The two step verification challenge code is invalid."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Result for a successful verification.",
                    "properties": {
                        "verificationToken": {
                            "description": "The verification token.",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "429": {
            "description": "5: Too many requests."
        },
        "503": {
            "description": "7: Two step verification is currently under maintenance."
        }
    },
}
```
<hr>


## /v1/users/{userId}/challenges/authenticator/verify
```json
{
    "Method": "POST",
    "Description": "Verifies a two step verification challenge code via authenticator app.",
    "Consumes": {
        "1": "application/json",
        "2": "text/json",
        "3": "application/x-www-form-urlencoded"
    },
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "userId",
            "format": "int64",
            "required": true,
            "description": "The user ID."
        },
        "2": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Request parameters for verifying a two step verification code.",
                    "properties": {
                        "actionType": {
                            "enum": {
                                "1": "Unknown",
                                "2": "Login"
                            },
                            "description": "The {Roblox.TwoStepVerification.Client.TwoStepVerificationActionType} associated with the challenge.",
                            "type": "string"
                        },
                        "code": {
                            "description": "The two step verification code.",
                            "type": "string"
                        },
                        "challengeId": {
                            "description": "The two step verification challenge ID.",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "The {Roblox.TwoStepVerification.Api.VerifyCodeRequest}."
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n9: The two step verification configuration is invalid for this action."
        },
        "400": {
            "description": "1: Invalid challenge ID.\r\n2: The user ID is invalid.\r\n10: The two step verification challenge code is invalid."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Result for a successful verification.",
                    "properties": {
                        "verificationToken": {
                            "description": "The verification token.",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "429": {
            "description": "5: Too many requests."
        },
        "503": {
            "description": "7: Two step verification is currently under maintenance."
        }
    },
}
```
<hr>


## /v1/users/{userId}/recovery-codes
```json
{
    "Method": "GET",
    "Description": "Gets the current status of recovery codes for a user.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "userId",
            "format": "int64",
            "required": true,
            "description": "The user ID."
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "The response for getting the status of recovery codes for a user.",
                    "properties": {
                        "activeCount": {
                            "format": "int32",
                            "description": "The number of unused recovery codes the user has available.",
                            "type": "integer"
                        },
                        "created": {
                            "format": "date-time",
                            "description": "The date time the recovery codes were generated at.",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "503": {
            "description": "7: Two step verification is currently under maintenance."
        },
        "400": {
            "description": "2: The user ID is invalid."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/users/{userId}/configuration/email/enable
```json
{
    "Method": "POST",
    "Description": "Enables two step verification via email for the specified user.",
    "Consumes": "NONE",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "userId",
            "format": "int64",
            "required": true,
            "description": "The user ID."
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n2: The user ID is invalid.\r\n6: The account pin is locked."
        },
        "400": {
            "description": "3: The email is invalid."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                    },
                    "type": "object"
                }
            }
        },
        "503": {
            "description": "7: Two step verification is currently under maintenance."
        }
    },
}
```
<hr>


## /v1/users/{userId}/configuration
```json
{
    "Method": "GET",
    "Description": "Gets two step verification configuration for the specified user.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "userId",
            "format": "int64",
            "required": true,
            "description": "The Id of the user to get the configuration for."
        },
        "2": {
            "in": "query",
            "type": "string",
            "name": "challengeId",
            "description": "The active challenge for the user (as an alternative when the user is unauthenticated).",
        },
        "3": {
            "in": "query",
            "type": "string",
            "name": "actionType",
            "enum": {
                "1": "Unknown",
                "2": "Login"
            },
            "description": "The action type the {challengeId} is associated with.",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "The users two step verification configuration.",
                    "properties": {
                        "primaryMediaType": {
                            "enum": {
                                "1": "Email",
                                "2": "SMS",
                                "3": "Authenticator",
                                "4": "RecoveryCode"
                            },
                            "description": "The preferred two step verification method for the user.",
                            "type": "string"
                        },
                        "methods": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "A user configuration method option.",
                                    "properties": {
                                        "mediaType": {
                                            "enum": {
                                                "1": "Email",
                                                "2": "SMS",
                                                "3": "Authenticator",
                                                "4": "RecoveryCode"
                                            },
                                            "description": "The {Roblox.TwoStepVerification.Client.TwoStepVerificationMediaType} for the method.",
                                            "type": "string"
                                        },
                                        "updated": {
                                            "format": "date-time",
                                            "description": "The last time this method was updated for the user.",
                                            "type": "string"
                                        },
                                        "enabled": {
                                            "description": "Whether or not the method is enabled.",
                                            "type": "boolean"
                                        }
                                    }
                                }
                            },
                            "type": "array",
                            "description": "The two step verification methods associated with the user."
                        }
                    }
                }
            }
        },
        "403": {
            "description": "2: The user ID is invalid."
        },
        "400": {
            "description": "1: Invalid challenge ID."
        }
    },
}
```
<hr>


## /v1/users/{userId}/challenges/email/verify
```json
{
    "Method": "POST",
    "Description": "Verifies a two step verification challenge with a code sent via email.",
    "Consumes": {
        "1": "application/json",
        "2": "text/json",
        "3": "application/x-www-form-urlencoded"
    },
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "userId",
            "format": "int64",
            "required": true,
            "description": "The user ID."
        },
        "2": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Request parameters for verifying a two step verification code.",
                    "properties": {
                        "actionType": {
                            "enum": {
                                "1": "Unknown",
                                "2": "Login"
                            },
                            "description": "The {Roblox.TwoStepVerification.Client.TwoStepVerificationActionType} associated with the challenge.",
                            "type": "string"
                        },
                        "code": {
                            "description": "The two step verification code.",
                            "type": "string"
                        },
                        "challengeId": {
                            "description": "The two step verification challenge ID.",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "The {Roblox.TwoStepVerification.Api.VerifyCodeRequest}."
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n2: The user ID is invalid."
        },
        "400": {
            "description": "1: Invalid challenge ID.\r\n9: The two step verification configuration is invalid for this action.\r\n10: The two step verification challenge code is invalid."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Result for a successful verification.",
                    "properties": {
                        "verificationToken": {
                            "description": "The verification token.",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "429": {
            "description": "5: Too many requests."
        },
        "503": {
            "description": "7: Two step verification is currently under maintenance."
        }
    },
}
```
<hr>


## /v1/metadata
```json
{
    "Method": "GET",
    "Description": "Gets two step verification system metadata.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "integer",
            "name": "userId",
            "format": "int64",
            "description": "The user ID.",
        },
        "2": {
            "in": "query",
            "type": "string",
            "name": "challengeId",
            "description": "The active two step verification challenge ID if there is one.",
        },
        "3": {
            "in": "query",
            "type": "string",
            "name": "actionType",
            "enum": {
                "1": "Unknown",
                "2": "Login"
            },
            "description": "The {Roblox.TwoStepVerification.Client.TwoStepVerificationActionType} associated with the challenge.",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Two step verification system metadata.",
                    "properties": {
                        "authenticatorQrCodeSize": {
                            "description": "Authenticator QR code image dimensions.",
                            "type": "string"
                        },
                        "emailCodeLength": {
                            "format": "int32",
                            "description": "Number of characters in an email-based two step verification code.",
                            "type": "integer"
                        },
                        "authenticatorEnabled": {
                            "description": "Whether or not authenticator-based two step verification is enabled.",
                            "type": "boolean"
                        },
                        "twoStepVerificationEnabled": {
                            "description": "Whether or not two step verification is globally enabled.",
                            "type": "boolean"
                        },
                        "authenticatorCodeLength": {
                            "readOnly": true,
                            "format": "int32",
                            "description": "Number of characters in an authenticator-based two step verification code.",
                            "type": "integer"
                        }
                    }
                }
            }
        }
    },
}
```
<hr>


## /v1/users/{userId}/recovery-codes/clear
```json
{
    "Method": "POST",
    "Description": "Clears any existing recovery codes for the user.",
    "Consumes": {
        "1": "application/json",
        "2": "text/json",
        "3": "application/x-www-form-urlencoded"
    },
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "userId",
            "format": "int64",
            "required": true,
            "description": "The user ID."
        },
        "2": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Request information needed to clear existing recovery codes.",
                    "properties": {
                        "password": {
                            "description": "The user's password.",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "The {Roblox.TwoStepVerification.Api.ClearRecoveryCodesRequest}."
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n6: The account pin is locked."
        },
        "400": {
            "description": "2: The user ID is invalid.\r\n4: The password is invalid."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                    },
                    "type": "object"
                }
            }
        },
        "429": {
            "description": "5: Too many requests."
        },
        "503": {
            "description": "7: Two step verification is currently under maintenance."
        }
    },
}
```
<hr>


## /v1/users/{userId}/challenges/email/send-code
```json
{
    "Method": "POST",
    "Description": "Sends a two step verification challenge code via email.",
    "Consumes": {
        "1": "application/json",
        "2": "text/json",
        "3": "application/x-www-form-urlencoded"
    },
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "userId",
            "format": "int64",
            "required": true,
            "description": "The user ID."
        },
        "2": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Request parameters for sending a two step verification code.",
                    "properties": {
                        "actionType": {
                            "enum": {
                                "1": "Unknown",
                                "2": "Login"
                            },
                            "description": "The {Roblox.TwoStepVerification.Client.TwoStepVerificationActionType} associated with the challenge.",
                            "type": "string"
                        },
                        "challengeId": {
                            "description": "The two step verification challenge ID.",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "The {Roblox.TwoStepVerification.Api.SendCodeRequest}."
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n2: The user ID is invalid."
        },
        "400": {
            "description": "1: Invalid challenge ID.\r\n9: The two step verification configuration is invalid for this action."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                    },
                    "type": "object"
                }
            }
        },
        "429": {
            "description": "5: Too many requests."
        },
        "503": {
            "description": "7: Two step verification is currently under maintenance."
        }
    },
}
```
<hr>


## /v1/users/{userId}/configuration/authenticator/disable
```json
{
    "Method": "POST",
    "Description": "Disables two step verification via authenticator for the specified user.",
    "Consumes": {
        "1": "application/json",
        "2": "text/json",
        "3": "application/x-www-form-urlencoded"
    },
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "userId",
            "format": "int64",
            "required": true,
            "description": "The user ID."
        },
        "2": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Request information needed to disable two step verification.",
                    "properties": {
                        "password": {
                            "description": "The user's password.",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "The {Roblox.TwoStepVerification.Api.DisableTwoStepVerificationRequest}."
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n6: The account pin is locked.\r\n8: The user is not allowed to perform the requested action."
        },
        "400": {
            "description": "2: The user ID is invalid.\r\n4: The password is invalid."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                    },
                    "type": "object"
                }
            }
        },
        "429": {
            "description": "5: Too many requests."
        },
        "503": {
            "description": "7: Two step verification is currently under maintenance."
        }
    },
}
```
<hr>


## /v1/users/{userId}/configuration/authenticator/enable
```json
{
    "Method": "POST",
    "Description": "Initiates enabling authenticator-based two step verification for the specified user.",
    "Consumes": "NONE",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "userId",
            "format": "int64",
            "required": true,
            "description": "The user ID."
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n6: The account pin is locked.\r\n11: The two step verification configuration is already enabled."
        },
        "400": {
            "description": "2: The user ID is invalid."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Response parameters for initiating enabling authenticator-based two step verification.",
                    "properties": {
                        "manualEntryKey": {
                            "description": "The manual entry key to input into the authenticator app.",
                            "type": "string"
                        },
                        "qrCodeImageUrl": {
                            "description": "The Url to the QR code image to scan into the authenticator app.",
                            "type": "string"
                        },
                        "setupToken": {
                            "description": "The setup token for turning on authenticator.",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "503": {
            "description": "7: Two step verification is currently under maintenance."
        }
    },
}
```
<hr>


## /v1/users/{userId}/configuration/email/disable
```json
{
    "Method": "POST",
    "Description": "Disables two step verification via email for the specified user.",
    "Consumes": {
        "1": "application/json",
        "2": "text/json",
        "3": "application/x-www-form-urlencoded"
    },
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "userId",
            "format": "int64",
            "required": true,
            "description": "The user ID."
        },
        "2": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Request information needed to disable two step verification.",
                    "properties": {
                        "password": {
                            "description": "The user's password.",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "The {Roblox.TwoStepVerification.Api.DisableTwoStepVerificationRequest}."
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n2: The user ID is invalid.\r\n6: The account pin is locked.\r\n8: The user is not allowed to perform the requested action."
        },
        "400": {
            "description": "4: The password is invalid."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                    },
                    "type": "object"
                }
            }
        },
        "429": {
            "description": "5: Too many requests."
        },
        "503": {
            "description": "7: Two step verification is currently under maintenance."
        }
    },
}
```
<hr>


## /v1/users/{userId}/configuration/authenticator/enable-verify
```json
{
    "Method": "POST",
    "Description": "Finishes enabling authenticator-based two step verification for the specified user.",
    "Consumes": {
        "1": "application/json",
        "2": "text/json",
        "3": "application/x-www-form-urlencoded"
    },
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "userId",
            "format": "int64",
            "required": true,
            "description": "The user ID."
        },
        "2": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Request parameters for authenticator enabling-verify.",
                    "properties": {
                        "code": {
                            "description": "The code from the authenticator app.",
                            "type": "string"
                        },
                        "setupToken": {
                            "description": "The setup token from the enable authenticator request.",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "The {Roblox.TwoStepVerification.Api.EnableVerifyAuthenticatorRequest}."
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n11: The two step verification configuration is already enabled."
        },
        "400": {
            "description": "2: The user ID is invalid.\r\n10: The two step verification challenge code is invalid.\r\n12: Invalid setup token."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                    },
                    "type": "object"
                }
            }
        },
        "503": {
            "description": "7: Two step verification is currently under maintenance."
        }
    },
}
```
<hr>


