# <b>Authentication Api v2</b>

## /v2/credentials/verification
```json
{
    "Method": "GET",
    "Description": "Checks if it is possible to send a verification message for the provided credentials.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "string",
            "name": "request.credentialType",
            "enum": {
                "1": "Email",
                "2": "Username",
                "3": "PhoneNumber",
                "4": "AuthToken"
            },
            "description": "Credentials type {Roblox.Platform.Authentication.CredentialsType}.",
        },
        "2": {
            "in": "query",
            "type": "string",
            "name": "request.credentialValue",
            "description": "Credentials value.",
        },
        "3": {
            "in": "query",
            "type": "string",
            "name": "request.password",
            "description": "Credentials password.",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "The response model containing whether a verification message can be sent to the provided credentials.",
                    "properties": {
                        "canSend": {
                            "description": "Whether a verification message can be sent to the credentials.",
                            "type": "boolean"
                        }
                    }
                }
            }
        },
        "503": {
            "description": "5: Credentials verification operation is unavailable. Please try again later."
        },
        "400": {
            "description": "0: An unexpected error occurred.\r\n1: Credential value and password are required. Please try again."
        },
        "429": {
            "description": "2: Too many attempts. Please wait a bit."
        }
    },
}
```
<hr>


## /v2/qq/verify-connect
```json
{
    "Method": "POST",
    "Description": "Endpoint for verifying a QQ account connection to an existing Roblox user",
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
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "properties": {
                        "username": {
                            "description": "The username of the user the ticket belongs to",
                            "type": "string"
                        },
                        "voucher": {
                            "description": "Tencent Info Security Blob",
                            "type": "string"
                        },
                        "ticket": {
                            "description": "The ticket",
                            "type": "string"
                        },
                        "code": {
                            "description": "The two step verification code",
                            "type": "string"
                        }
                    },
                    "type": "object"
                }
            },
            "description": ""
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n8: The Voucher is expired.\r\n9: The Voucher is invalid."
        },
        "400": {
            "description": "1: User is invalid.\r\n5: Invalid two step verification ticket.\r\n6: The code is invalid.\r\n7: The action is unsupported."
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
            "description": "3: Too many attempts. Please try again later."
        },
        "503": {
            "description": "2: The two step verification feature is not enabled at this time."
        }
    },
}
```
<hr>


## /v2/credentials/verification/send
```json
{
    "Method": "POST",
    "Description": "Sends a verification message to the provided credentials.",
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
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Model for sending credentials verification requests",
                    "properties": {
                        "password": {
                            "description": "Credentials password.",
                            "type": "string"
                        },
                        "credentialType": {
                            "enum": {
                                "1": "Email",
                                "2": "Username",
                                "3": "PhoneNumber",
                                "4": "AuthToken"
                            },
                            "description": "Credentials type {Roblox.Platform.Authentication.CredentialsType}.",
                            "type": "string"
                        },
                        "credentialValue": {
                            "description": "Credentials value.",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "Request model with a credential value, type, and password."
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n4: Could not send a verification message. Please try again later."
        },
        "400": {
            "description": "0: An unexpected error occurred.\r\n1: Credential value and password are required. Please try again.\r\n3: Verification with received credential type is not supported."
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
            "description": "2: Too many attempts. Please wait a bit."
        },
        "503": {
            "description": "5: Credentials verification operation is unavailable. Please try again later."
        }
    },
}
```
<hr>


## /v2/usernames/recover
```json
{
    "Method": "POST",
    "Description": "Sends an email of all accounts belonging to an email",
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
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Request object for recover username",
                    "properties": {
                        "target": {
                            "description": "The target used to recover username",
                            "type": "string"
                        },
                        "targetType": {
                            "enum": {
                                "1": "Email",
                                "2": "PhoneNumber"
                            },
                            "description": "The {Roblox.Authentication.Api.Models.RecoverUsernameRequest.TargetType} method to recover username",
                            "type": "string"
                        }
                    }
                }
            },
            "description": ""
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "The response model for username recovery",
                    "properties": {
                        "transmissionType": {
                            "enum": {
                                "1": "Sms",
                                "2": "Email"
                            },
                            "description": "The transmission type the username recovery message was sent (e.g. Sms or Email)",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "403": {
            "description": "0: Token Validation Failed\r\n11: Too many attempts. Please wait a bit."
        },
        "400": {
            "description": "20: Invalid Email\r\n21: Invalid Phone\r\n23: No Account Found"
        },
        "500": {
            "description": "0: An unexpected error occurred."
        }
    },
}
```
<hr>


## /v2/passwords/reset/send-prompted
```json
{
    "Method": "POST",
    "Description": "Sends a password reset email or challenge to the specified target.",
    "Consumes": "NONE",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": "NONE",
    "Responses": {
        "200": {
            "description": "The forgot password email successfully sent.",
            "schema": {
                "$ref": {
                    "properties": {
                    },
                    "type": "object"
                }
            }
        },
        "403": {
            "description": "0: Token Validation Failed"
        },
        "400": {
            "description": "22: No email address is associated with the account."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v2/username
```json
{
    "Method": "POST",
    "Description": "Change the user's username",
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
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "The username change request",
                    "properties": {
                        "username": {
                            "description": "The username",
                            "type": "string"
                        },
                        "password": {
                            "description": "The password",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "The {Roblox.Authentication.Api.Models.UsernameChangeRequest}"
        }
    },
    "Responses": {
        "500": {
            "description": "0: An unknown error occured.\r\n5: You don't have enough Robux to change your username."
        },
        "400": {
            "description": "5: You don't have enough Robux to change your username.\r\n10: This username is already in use\r\n11: Username not appropriate for Roblox\r\n12: Usernames can be 3 to 20 characters long\r\n13: Usernames can’t start or end with _ and can have at most one _\r\n14: Only a-z, A-Z, 0-9, and _ are allowed\r\n15: Username is null\r\n16: Username might contain private information\r\n17: This username is not available\r\n18: Username is same as current"
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
            "description": "4: The feature is currently not available. Please try again later."
        },
        "403": {
            "description": "0: Token Validation Failed\r\n1: PIN is locked.\r\n2: A verified email is missing\r\n3: Your password is incorrect.\r\n100: Unknown birthday"
        }
    },
}
```
<hr>


## /v2/verified-signup
```json
{
    "Method": "POST",
    "Description": "Create a new user with a signup voucher",
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
            "in": "body",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A request to sign up a user",
                    "properties": {
                        "voucher": {
                            "description": "The voucher",
                            "type": "string"
                        },
                        "birthdate": {
                            "format": "date-time",
                            "description": "The user's birthdate",
                            "type": "string"
                        },
                        "agreementIds": {
                            "items": {
                                "type": "string"
                            },
                            "type": "array",
                            "description": "AgreementIds"
                        },
                        "password": {
                            "description": "The user's password",
                            "type": "string"
                        }
                    }
                }
            },
            "name": "request"
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n7: The email address is already linked to the maximum number of users.\r\n8: The phone number is already linked to a user.\r\n13: The voucher has expired."
        },
        "400": {
            "description": "1: The request is empty.\r\n12: The voucher is invalid.\r\n14: The birthday is invalid.\r\n15: The password is invalid."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A response model for the Signup endpoint",
                    "properties": {
                        "userId": {
                            "format": "int64",
                            "description": "The user ID",
                            "type": "integer"
                        },
                        "starterPlaceId": {
                            "format": "int64",
                            "description": "The id of the game to start with",
                            "type": "integer"
                        }
                    }
                }
            }
        },
        "429": {
            "description": "18: Captcha must be passed before signing up."
        },
        "500": {
            "description": "16: Failed to create a user.\r\n17: Failed to generate a valid username."
        }
    },
}
```
<hr>


## /v2/usernames
```json
{
    "Method": "GET",
    "Description": "Gets a list of existing usernames on Roblox based on the query parameters",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "string",
            "name": "username",
            "description": "The username",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "The response model to get existing usernames on Roblox",
                    "properties": {
                        "usernames": {
                            "items": {
                                "type": "string"
                            },
                            "type": "array",
                            "description": "The list of usernames"
                        }
                    }
                }
            }
        }
    },
}
```
<hr>


## /v2/saml/metadata
```json
{
    "Method": "GET",
    "Description": "Gets the SAML2 metadata XML.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": "NONE",
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A response model for SAML2 metadata",
                    "properties": {
                    }
                }
            }
        }
    },
}
```
<hr>


## /v2/revert/account
```json
{
    "Method": "POST",
    "Description": "Submit Revert Account Request",
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
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Request Model to submit a revert account request",
                    "properties": {
                        "Ticket": {
                            "description": "ticket guid",
                            "type": "string"
                        },
                        "NewPasswordRepeated": {
                            "description": "Repeated new password",
                            "type": "string"
                        },
                        "UserId": {
                            "format": "int64",
                            "description": "User ID",
                            "type": "integer"
                        },
                        "NewPassword": {
                            "description": "New Password",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "The {Roblox.Authentication.Api.Models.RevertAccountSubmitRequest} containing the necessary information to revert account."
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A success response from a login request",
                    "properties": {
                        "twoStepVerificationData": {
                            "$ref": {
                                "type": "object",
                                "description": "The response model containing information about a two step verification challenge",
                                "properties": {
                                    "mediaType": {
                                        "enum": {
                                            "1": "Email",
                                            "2": "SMS",
                                            "3": "Authenticator",
                                            "4": "RecoveryCode"
                                        },
                                        "description": "The media type the two step verification code was sent on",
                                        "type": "string"
                                    },
                                    "ticket": {
                                        "description": "The two step verification ticket",
                                        "type": "string"
                                    }
                                }
                            },
                            "description": "TwoStepVerification data if applicable"
                        },
                        "user": {
                            "$ref": {
                                "properties": {
                                    "id": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "name": {
                                        "type": "string"
                                    },
                                    "displayName": {
                                        "type": "string"
                                    }
                                },
                                "type": "object"
                            },
                            "description": "The {Roblox.Web.Responses.Users.SkinnyUserResponse}"
                        }
                    }
                }
            }
        },
        "403": {
            "description": "0: Token Validation Failed"
        },
        "400": {
            "description": "2: The account revert ticket is not valid\r\n3: Password is not valid\r\n4: Passwords do not match\r\n5: Password cannot be used"
        },
        "503": {
            "description": "0: Unknown\r\n1: This feature is disabled"
        }
    },
}
```
<hr>

```json
{
    "Method": "GET",
    "Description": "Get Revert Account ticket info",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "string",
            "name": "ticket",
            "required": true,
            "description": "Ticket Guid to revert account."
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Represents the response when requesting revert account metadata",
                    "properties": {
                        "username": {
                            "description": "User Name",
                            "type": "string"
                        },
                        "ticket": {
                            "description": "Ticket Guid",
                            "type": "string"
                        },
                        "isEmailVerified": {
                            "description": "Is Email Verified",
                            "type": "boolean"
                        },
                        "isTwoStepVerificationEnabled": {
                            "description": "Is two Step Verification Enabled",
                            "type": "boolean"
                        },
                        "isEmailChanged": {
                            "description": "Is Email changed",
                            "type": "boolean"
                        },
                        "userId": {
                            "format": "int64",
                            "description": "User ID",
                            "type": "integer"
                        }
                    }
                }
            }
        },
        "400": {
            "description": "2: The account revert ticket is not valid"
        },
        "503": {
            "description": "1: This feature is disabled"
        }
    },
}
```
<hr>


## /v2/recovery/metadata
```json
{
    "Method": "GET",
    "Description": "Get metadata for forgot endpoints",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": "NONE",
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Forgot Metadata Response",
                    "properties": {
                        "isBedev2CaptchaEnabledForPasswordReset": {
                            "description": "Is bedev2 captcha enabled for password reset",
                            "type": "boolean"
                        },
                        "isPhoneFeatureEnabledForUsername": {
                            "description": "Is phone feature enabled for forgot username",
                            "type": "boolean"
                        },
                        "isOnPhone": {
                            "description": "Is client on phone",
                            "type": "boolean"
                        },
                        "isPhoneFeatureEnabledForPassword": {
                            "description": "Is phone feature enabled for forgot password",
                            "type": "boolean"
                        },
                        "codeLength": {
                            "format": "int32",
                            "description": "Length of phone code",
                            "type": "integer"
                        }
                    }
                }
            }
        },
        "503": {
            "description": "7: The Roblox WeChat API is currently unavailable."
        }
    },
}
```
<hr>


## /v2/passwords/current-status
```json
{
    "Method": "GET",
    "Description": "Returns password status for current user.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": "NONE",
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Response model with password status",
                    "properties": {
                        "valid": {
                            "description": "Does authenticated user has a valid password",
                            "type": "boolean"
                        }
                    }
                }
            }
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v2/passwords/reset/send
```json
{
    "Method": "POST",
    "Description": "Sends a password reset email or challenge to the specified target.",
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
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "The request model for sending a password reset request",
                    "properties": {
                        "target": {
                            "description": "The target to send the forgot password message",
                            "type": "string"
                        },
                        "targetType": {
                            "enum": {
                                "1": "Email",
                                "2": "PhoneNumber"
                            },
                            "description": "The {Roblox.Authentication.Api.Models.SendResetPasswordRequest.TargetType} for the forgot password",
                            "type": "string"
                        },
                        "captchaProvider": {
                            "type": "string"
                        },
                        "captchaToken": {
                            "type": "string"
                        }
                    }
                }
            },
            "description": "The request model containing the target type and a target."
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n18: Captcha is required."
        },
        "400": {
            "description": "3: Request was empty.\r\n9: The target type is invalid.\r\n10: The target is invalid.\r\n12: The user is invalid."
        },
        "200": {
            "description": "The forgot password email successfully sent.",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Wraps the response for a forgot password request",
                    "properties": {
                        "transmissionType": {
                            "readOnly": true,
                            "enum": {
                                "1": "Sms",
                                "2": "Email"
                            },
                            "description": "The {Roblox.Authentication.Api.Models.SendResetPasswordResponse.TransmissionType}",
                            "type": "string"
                        },
                        "nonce": {
                            "type": "string",
                            "description": "The nonce generated",
                            "readOnly": true
                        }
                    }
                }
            }
        },
        "503": {
            "description": "1: Feature temporarily disabled. Please try again later."
        },
        "429": {
            "description": "2: Too many attempts. Please try again later."
        },
        "500": {
            "description": "0: Unknown error occured.\r\n19: Message could not be sent."
        }
    },
}
```
<hr>


## /v2/passwords/validate
```json
{
    "Method": "POST",
    "Description": "Endpoint for checking if a password is valid.",
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
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "properties": {
                        "username": {
                            "description": "The username.",
                            "type": "string"
                        },
                        "password": {
                            "description": "The password.",
                            "type": "string"
                        }
                    },
                    "type": "object"
                }
            },
            "description": "The {Roblox.Authentication.Api.Models.PasswordValidationModel}."
        }
    },
    "Responses": {
        "200": {
            "description": "Success",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A result representing the information about if password is valid or not.",
                    "properties": {
                        "message": {
                            "description": "The response message of the password validation.",
                            "type": "string"
                        },
                        "code": {
                            "enum": {
                                "1": "ValidPassword",
                                "2": "WeakPasswordError",
                                "3": "ShortPasswordError",
                                "4": "PasswordSameAsUsernameError",
                                "5": "ForbiddenPasswordError",
                                "6": "DumbStringsError"
                            },
                            "description": "The {Roblox.Authentication.Api.Models.PasswordValidationStatus} of the password validation",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "403": {
            "description": "0: Token Validation Failed"
        },
        "400": {
            "description": "1: Valid Username and Password are required. Please try again."
        }
    },
}
```
<hr>

```json
{
    "Method": "GET",
    "Description": "Endpoint for checking if a password is valid.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "string",
            "name": "request.username",
            "description": "The username.",
        },
        "2": {
            "in": "query",
            "type": "string",
            "name": "request.password",
            "description": "The password.",
        }
    },
    "Responses": {
        "200": {
            "description": "Success",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A result representing the information about if password is valid or not.",
                    "properties": {
                        "message": {
                            "description": "The response message of the password validation.",
                            "type": "string"
                        },
                        "code": {
                            "enum": {
                                "1": "ValidPassword",
                                "2": "WeakPasswordError",
                                "3": "ShortPasswordError",
                                "4": "PasswordSameAsUsernameError",
                                "5": "ForbiddenPasswordError",
                                "6": "DumbStringsError"
                            },
                            "description": "The {Roblox.Authentication.Api.Models.PasswordValidationStatus} of the password validation",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "400": {
            "description": "1: Valid Username and Password are required. Please try again."
        }
    },
}
```
<hr>


## /v2/passwords/reset/verify
```json
{
    "Method": "POST",
    "Description": "Verifies a password reset challenge solution.",
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
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A verification model",
                    "properties": {
                        "targetType": {
                            "enum": {
                                "1": "Email",
                                "2": "PhoneNumber"
                            },
                            "description": "The {Roblox.Authentication.Api.Models.PasswordResetVerificationRequest.TargetType} for the verification request",
                            "type": "string"
                        },
                        "code": {
                            "description": "The code to verify",
                            "type": "string"
                        },
                        "nonce": {
                            "description": "The nonce to verify",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "The request model containing the nonce and the solution. {Roblox.Authentication.Api.Models.PasswordResetVerificationRequest}"
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n13: The code is invalid."
        },
        "400": {
            "description": "3: Request was empty.\r\n9: The target type is invalid.\r\n14: The nonce is invalid."
        },
        "200": {
            "description": "Verification succeeded.",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A response to a verification action",
                    "properties": {
                        "userTickets": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "A tuple of {Roblox.Web.Responses.Users.LegacyUserResponse} and its ticket",
                                    "properties": {
                                        "ticket": {
                                            "type": "string",
                                            "description": "The reset ticket for the user",
                                            "readOnly": true
                                        },
                                        "user": {
                                            "readOnly": true,
                                            "$ref": {
                                                "properties": {
                                                    "username": {
                                                        "type": "string"
                                                    },
                                                    "userId": {
                                                        "type": "integer",
                                                        "format": "int64"
                                                    },
                                                    "displayName": {
                                                        "type": "string"
                                                    }
                                                },
                                                "type": "object"
                                            },
                                            "description": "The user"
                                        }
                                    }
                                }
                            },
                            "type": "array",
                            "description": "The list of {Roblox.Authentication.Api.Models.ForgotPasswordUserResponse}s",
                            "readOnly": true
                        }
                    }
                }
            }
        },
        "503": {
            "description": "1: Feature temporarily disabled. Please try again later."
        },
        "500": {
            "description": "0: Unknown error occured."
        }
    },
}
```
<hr>


## /v2/qq/callback
```json
{
    "Method": "POST",
    "Description": "Token Exchange endpoint to exchange 'code' parameter for QQ voucher (containing QQ user info) and user id if one exists",
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
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Token Exchange Request for the Token Exchange Endpoint",
                    "properties": {
                        "state": {
                            "description": "The state parameter returned from OAuth login",
                            "type": "string"
                        },
                        "appType": {
                            "description": "The tencent developer appType parameter for developer logins",
                            "type": "string"
                        },
                        "code": {
                            "description": "The code parameter returned from OAuth login",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "{Roblox.Authentication.Api.Models.TencentTokenExchangeRequest}"
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n15: The state is expired.\r\n16: The state is invalid.\r\n27: The user is not found."
        },
        "400": {
            "description": "2: The request is empty.\r\n5: The authorization code is invalid."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Response Model for the Token Exchange Endpoint",
                    "properties": {
                        "voucher": {
                            "description": "Voucher containing Info (union id, open id, access token, refresh token, etc)",
                            "type": "string"
                        },
                        "gender": {
                            "format": "int32",
                            "description": "The gender",
                            "type": "integer"
                        },
                        "userId": {
                            "format": "int64",
                            "description": "The Roblox User ID of the connected account, if one exists",
                            "type": "integer"
                        },
                        "displayName": {
                            "description": "User's display name",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "429": {
            "description": "3: Too many requests. Please try again later."
        },
        "503": {
            "description": "7: The Roblox API is currently unavailable.\r\n25: The QQ API is unavailable."
        }
    },
}
```
<hr>


## /v2/signup
```json
{
    "Method": "POST",
    "Description": "Endpoint for signing up a new user",
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
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Request model for the Signup endpoint",
                    "properties": {
                        "referralData": {
                            "$ref": {
                                "type": "object",
                                "description": "Model for Referral Data",
                                "properties": {
                                    "acquisitionTime": {
                                        "format": "date-time",
                                        "description": "Acquisition Time",
                                        "type": "string"
                                    },
                                    "source": {
                                        "description": "Source",
                                        "type": "string"
                                    },
                                    "acquisitionReferrer": {
                                        "description": "Acquisition Referrer",
                                        "type": "string"
                                    },
                                    "offerId": {
                                        "description": "Offer Id",
                                        "type": "string"
                                    },
                                    "keyword": {
                                        "description": "Keyword",
                                        "type": "string"
                                    },
                                    "matchType": {
                                        "description": "MatchType",
                                        "type": "string"
                                    },
                                    "campaign": {
                                        "description": "Campaign",
                                        "type": "string"
                                    },
                                    "adGroup": {
                                        "description": "AdGroup",
                                        "type": "string"
                                    },
                                    "sendInfo": {
                                        "description": "SendInfo",
                                        "type": "boolean"
                                    },
                                    "requestSessionId": {
                                        "description": "Request Session Id",
                                        "type": "string"
                                    },
                                    "medium": {
                                        "description": "Medium",
                                        "type": "string"
                                    }
                                }
                            },
                            "description": "Referral Data"
                        },
                        "agreementIds": {
                            "items": {
                                "type": "string"
                            },
                            "type": "array",
                            "description": "AgreementIds"
                        },
                        "widthScale": {
                            "format": "double",
                            "description": "The Width Scale",
                            "type": "number"
                        },
                        "identityVerificationResultToken": {
                            "description": "IdentityVerificationResultToken",
                            "type": "string"
                        },
                        "username": {
                            "description": "Username",
                            "type": "string"
                        },
                        "isTosAgreementBoxChecked": {
                            "description": "Whether the ToS agreement box was checked",
                            "type": "boolean"
                        },
                        "bodyColorId": {
                            "format": "int32",
                            "description": "The Body Color Id",
                            "type": "integer"
                        },
                        "captchaProvider": {
                            "type": "string"
                        },
                        "assetIds": {
                            "items": {
                                "type": "integer",
                                "format": "int64"
                            },
                            "type": "array",
                            "description": "The Asset IDs"
                        },
                        "gender": {
                            "enum": {
                                "1": "Unknown",
                                "2": "Male",
                                "3": "Female"
                            },
                            "description": "Gender",
                            "type": "string"
                        },
                        "email": {
                            "description": "Email",
                            "type": "string"
                        },
                        "password": {
                            "description": "Password",
                            "type": "string"
                        },
                        "captchaToken": {
                            "type": "string"
                        },
                        "birthday": {
                            "format": "date-time",
                            "description": "Birthday",
                            "type": "string"
                        },
                        "proportionScale": {
                            "format": "double",
                            "description": "The Proportion Scale",
                            "type": "number"
                        },
                        "headScale": {
                            "format": "double",
                            "description": "The Head Scale",
                            "type": "number"
                        },
                        "heightScale": {
                            "format": "double",
                            "description": "The Height Scale",
                            "type": "number"
                        },
                        "bodyTypeScale": {
                            "format": "double",
                            "description": "The Body Type Scale",
                            "type": "number"
                        },
                        "locale": {
                            "description": "Locale",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "{Roblox.Authentication.Api.Models.SignupRequest}"
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n2: Captcha Failed.\r\n4: Invalid Birthday.\r\n5: Invalid Username.\r\n6: Username already taken.\r\n7: Invalid Password.\r\n8: Password and Username are same.\r\n9: Password is too simple.\r\n10: Email is invalid.\r\n11: Asset is invalid.\r\n12: Too many attempts. Please wait a bit."
        },
        "400": {
            "description": "Bad request"
        },
        "200": {
            "description": "Successful signup",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A response model for the Signup endpoint",
                    "properties": {
                        "userId": {
                            "format": "int64",
                            "description": "The user ID",
                            "type": "integer"
                        },
                        "starterPlaceId": {
                            "format": "int64",
                            "description": "The id of the game to start with",
                            "type": "integer"
                        }
                    }
                }
            }
        },
        "503": {
            "description": "Service unavailable"
        },
        "429": {
            "description": "3: Too many attempts. Please wait a bit."
        },
        "500": {
            "description": "Internal server error"
        }
    },
}
```
<hr>


## /v2/qq/metadata
```json
{
    "Method": "GET",
    "Description": "Get metadata.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "string",
            "name": "apiKey",
            "description": "",
        },
        "2": {
            "in": "query",
            "type": "boolean",
            "name": "getIdentifier",
        },
        "3": {
            "in": "query",
            "type": "string",
            "name": "appType",
            "description": "",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Data Response for Tencent Metadata",
                    "properties": {
                        "realNameVerificationUrl": {
                            "description": "The real name verification URL",
                            "type": "string"
                        },
                        "isLinkingEnabled": {
                            "description": "The tencent to roblox linking switch",
                            "type": "boolean"
                        },
                        "loginPage": {
                            "description": "The login page URL",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "503": {
            "description": "7: The Roblox API is currently unavailable."
        }
    },
}
```
<hr>


## /v2/verified-signup/voucher
```json
{
    "Method": "POST",
    "Description": "Create a new verified signup voucher",
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
            "in": "body",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Request to create a verified signup voucher",
                    "properties": {
                        "code": {
                            "description": "The code",
                            "type": "string"
                        },
                        "challenge": {
                            "description": "The challenge",
                            "type": "string"
                        }
                    }
                }
            },
            "name": "request"
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Response for successfully creating a voucher",
                    "properties": {
                        "voucher": {
                            "description": "The voucher",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "403": {
            "description": "0: Token Validation Failed\r\n10: The challenge has expired."
        },
        "400": {
            "description": "1: The request is empty.\r\n9: The challenge is invalid.\r\n11: The code is invalid."
        },
        "429": {
            "description": "2: Too many attempts. Please wait a bit."
        }
    },
}
```
<hr>


## /v2/metadata
```json
{
    "Method": "GET",
    "Description": "Get the metadata",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": "NONE",
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "The metadata response",
                    "properties": {
                        "ftuxAvatarAssetMap": {
                            "type": "string"
                        },
                        "isUpdateUsernameEnabled": {
                            "type": "boolean"
                        },
                        "IsEmailUpsellAtLogoutEnabled": {
                            "type": "boolean"
                        },
                        "IsAccountRecoveryPromptEnabled": {
                            "type": "boolean"
                        }
                    }
                }
            }
        }
    },
}
```
<hr>


## /v2/wechat/callback
```json
{
    "Method": "POST",
    "Description": "Token Exchange endpoint to exchange 'code' parameter for WeChat voucher (containing WeChat user info) and user id if one exists",
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
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "WeChat Token Exchange Request for the Token Exchange Endpoint",
                    "properties": {
                        "state": {
                            "description": "The state parameter returned from WeChat OAuth login",
                            "type": "string"
                        },
                        "code": {
                            "description": "The code parameter returned from WeChat OAuth login",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "{Roblox.Authentication.Api.Models.WeChatTokenExchangeRequest}"
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Response Model for the Token Exchange Endpoint",
                    "properties": {
                        "weChatVoucher": {
                            "description": "Voucher containing WeChat Info (union id, open id, access token, refresh token, etc)",
                            "type": "string"
                        },
                        "gender": {
                            "format": "int32",
                            "description": "The gender obtained from WeChat",
                            "type": "integer"
                        },
                        "userId": {
                            "format": "int64",
                            "description": "The Roblox User ID of the connected account, if one exists",
                            "type": "integer"
                        }
                    }
                }
            }
        },
        "403": {
            "description": "0: Token Validation Failed\r\n15: The WeChat state is expired.\r\n16: The WeChat state is invalid.\r\n21: The WeChat state is empty.\r\n22: The WeChat state has a format exception.\r\n23: The WeChat state has an invalid browser tracker id.\r\n24: The WeChat state has an invalid IP address."
        },
        "400": {
            "description": "2: The request is empty.\r\n5: The authorization code is invalid."
        },
        "503": {
            "description": "1: WeChat is unavailable.\r\n7: The Roblox WeChat API is currently unavailable."
        }
    },
}
```
<hr>


## /v2/passwords/reset
```json
{
    "Method": "POST",
    "Description": "Resets a password for a user that belongs to the password reset ticket.",
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
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A model containing information to reset a password with a ticket.",
                    "properties": {
                        "password": {
                            "description": "The new password",
                            "type": "string"
                        },
                        "ticket": {
                            "description": "The ticket",
                            "type": "string"
                        },
                        "targetType": {
                            "enum": {
                                "1": "Email",
                                "2": "PhoneNumber"
                            },
                            "description": "The target type",
                            "type": "string"
                        },
                        "userId": {
                            "format": "int64",
                            "description": "The user id",
                            "type": "integer"
                        },
                        "passwordRepeated": {
                            "description": "The new password repeated",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "The request model including the target type, ticket, user id, and new password, {Roblox.Authentication.Api.Models.PasswordResetModel}"
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n16: The ticket is expired.\r\n17: The nonce is expired."
        },
        "400": {
            "description": "3: Request was empty.\r\n11: The password reset ticket is invalid.\r\n12: The user is invalid.\r\n20: The password is invalid.\r\n21: Passwords do not match."
        },
        "200": {
            "description": "The password was successfully reset.",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A success response from a login request",
                    "properties": {
                        "twoStepVerificationData": {
                            "$ref": {
                                "type": "object",
                                "description": "The response model containing information about a two step verification challenge",
                                "properties": {
                                    "mediaType": {
                                        "enum": {
                                            "1": "Email",
                                            "2": "SMS",
                                            "3": "Authenticator",
                                            "4": "RecoveryCode"
                                        },
                                        "description": "The media type the two step verification code was sent on",
                                        "type": "string"
                                    },
                                    "ticket": {
                                        "description": "The two step verification ticket",
                                        "type": "string"
                                    }
                                }
                            },
                            "description": "TwoStepVerification data if applicable"
                        },
                        "user": {
                            "$ref": {
                                "properties": {
                                    "id": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "name": {
                                        "type": "string"
                                    },
                                    "displayName": {
                                        "type": "string"
                                    }
                                },
                                "type": "object"
                            },
                            "description": "The {Roblox.Web.Responses.Users.SkinnyUserResponse}"
                        }
                    }
                }
            }
        },
        "503": {
            "description": "1: Feature temporarily disabled. Please try again later."
        },
        "500": {
            "description": "0: Unknown error occured."
        }
    },
}
```
<hr>

```json
{
    "Method": "GET",
    "Description": "Gets metadata needed for the password reset view.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "string",
            "name": "request.targetType",
            "enum": {
                "1": "Email",
                "2": "PhoneNumber"
            },
            "description": "The {Roblox.Authentication.Api.Models.GetPasswordResetMetadataRequest.TargetType}",
        },
        "2": {
            "in": "query",
            "type": "string",
            "name": "request.ticket",
            "description": "The ticket that was generated when the reset password request was sent",
        }
    },
    "Responses": {
        "403": {
            "description": "11: The password reset ticket is invalid.\r\n16: The ticket is expired."
        },
        "400": {
            "description": "3: Request was empty.\r\n9: The target type is invalid.\r\n11: The password reset ticket is invalid.\r\n14: The nonce is invalid."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "The metadata needed for the password reset view",
                    "properties": {
                        "users": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "username": {
                                            "type": "string"
                                        },
                                        "userId": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "displayName": {
                                            "type": "string"
                                        }
                                    },
                                    "type": "object"
                                }
                            },
                            "type": "array",
                            "description": "The list of password reset user data"
                        }
                    }
                }
            }
        },
        "503": {
            "description": "1: Feature temporarily disabled. Please try again later."
        },
        "500": {
            "description": "0: Unknown error occured."
        }
    },
}
```
<hr>


## /v2/wechat/metadata
```json
{
    "Method": "GET",
    "Description": "Get metadata.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "string",
            "name": "apiKey",
            "description": "",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Data Response for WeChat Metadata",
                    "properties": {
                        "loginPage": {
                            "description": "The WeChat login page URL",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "503": {
            "description": "7: The Roblox WeChat API is currently unavailable."
        }
    },
}
```
<hr>


## /v2/usernames/validate
```json
{
    "Method": "POST",
    "Description": "Checks if a username is valid.",
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
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "properties": {
                        "username": {
                            "description": "The username",
                            "type": "string"
                        },
                        "context": {
                            "enum": {
                                "1": "Unknown",
                                "2": "Signup",
                                "3": "UsernameChange"
                            },
                            "description": "{Roblox.Authentication.Api.Models.UsernameValidationContext}",
                            "type": "string"
                        },
                        "birthday": {
                            "format": "date-time",
                            "description": "The birthday",
                            "type": "string"
                        }
                    },
                    "type": "object"
                }
            },
            "description": "The {Roblox.Authentication.Api.Models.UsernameValidationRequest}."
        }
    },
    "Responses": {
        "200": {
            "description": "Success",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A result representing the information about if username is valid or not.",
                    "properties": {
                        "message": {
                            "description": "The response message of the username validation.",
                            "type": "string"
                        },
                        "code": {
                            "enum": {
                                "1": "ValidUsername",
                                "2": "AlreadyInUseError",
                                "3": "ModerationError",
                                "4": "InvalidLengthError",
                                "5": "StartsOrEndsWithUnderscoreError",
                                "6": "TooManyUnderscoresError",
                                "7": "ContainsSpacesError",
                                "8": "InvalidCharactersError",
                                "9": "ContainsPiiError",
                                "10": "ContainsReservedUsernameError"
                            },
                            "description": "The {Roblox.Authentication.Api.Models.UsernameValidationStatus} of the username validation.",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "403": {
            "description": "0: Token Validation Failed"
        },
        "400": {
            "description": "1: A valid username is required.\r\n2: A valid birthday or authenticated user is required."
        }
    },
}
```
<hr>

```json
{
    "Method": "GET",
    "Description": "Checks if a username is valid.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "string",
            "name": "request.username",
            "description": "The username",
        },
        "2": {
            "in": "query",
            "type": "string",
            "name": "request.birthday",
            "description": "The birthday",
        },
        "3": {
            "in": "query",
            "type": "string",
            "name": "request.context",
            "enum": {
                "1": "Unknown",
                "2": "Signup",
                "3": "UsernameChange"
            },
            "description": "{Roblox.Authentication.Api.Models.UsernameValidationContext}",
        }
    },
    "Responses": {
        "200": {
            "description": "Success",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A result representing the information about if username is valid or not.",
                    "properties": {
                        "message": {
                            "description": "The response message of the username validation.",
                            "type": "string"
                        },
                        "code": {
                            "enum": {
                                "1": "ValidUsername",
                                "2": "AlreadyInUseError",
                                "3": "ModerationError",
                                "4": "InvalidLengthError",
                                "5": "StartsOrEndsWithUnderscoreError",
                                "6": "TooManyUnderscoresError",
                                "7": "ContainsSpacesError",
                                "8": "InvalidCharactersError",
                                "9": "ContainsPiiError",
                                "10": "ContainsReservedUsernameError"
                            },
                            "description": "The {Roblox.Authentication.Api.Models.UsernameValidationStatus} of the username validation.",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "400": {
            "description": "1: A valid username is required.\r\n2: A valid birthday or authenticated user is required."
        }
    },
}
```
<hr>


## /v2/verified-signup/challenge
```json
{
    "Method": "POST",
    "Description": "Create a new verified signup challenge",
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
            "in": "body",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A request to create a verified signup challenge",
                    "properties": {
                        "deliveryMethod": {
                            "enum": {
                                "1": "Sms",
                                "2": "Email"
                            },
                            "description": "The delivery method",
                            "type": "string"
                        },
                        "deliveryTarget": {
                            "description": "The delivery target",
                            "type": "string"
                        }
                    }
                }
            },
            "name": "request"
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Response for successfully creating a challenge",
                    "properties": {
                        "challenge": {
                            "description": "The challenge",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "403": {
            "description": "0: Token Validation Failed\r\n7: The email address is already linked to the maximum number of users.\r\n8: The phone number is already linked to a user."
        },
        "400": {
            "description": "1: The request is empty.\r\n3: The delivery method is not supported.\r\n4: The delivery target is invalid.\r\n5: The email address is invalid.\r\n6: The phone number is invalid."
        },
        "429": {
            "description": "2: Too many attempts. Please wait a bit.\r\n18: Captcha must be passed before signing up."
        }
    },
}
```
<hr>


## /v2/twostepverification/metadata
```json
{
    "Method": "GET",
    "Description": "Get metadata for two step verification",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": "NONE",
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "2SV metadata",
                    "properties": {
                        "codeLength": {
                            "format": "int32",
                            "description": "The length of the 2sv code",
                            "type": "integer"
                        },
                        "loadingImageUrl": {
                            "description": "The loading image url",
                            "type": "string"
                        },
                        "supportUrl": {
                            "description": "The support url for 2sv",
                            "type": "string"
                        }
                    }
                }
            }
        }
    },
}
```
<hr>


## /v2/login
```json
{
    "Method": "POST",
    "Description": "Authenticates a user.",
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
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Model for login requests",
                    "properties": {
                        "password": {
                            "description": "Credentials password.",
                            "type": "string"
                        },
                        "captchaToken": {
                            "type": "string"
                        },
                        "ctype": {
                            "enum": {
                                "1": "Email",
                                "2": "Username",
                                "3": "PhoneNumber",
                                "4": "AuthToken"
                            },
                            "description": "Credentials type {Roblox.Platform.Authentication.CredentialsType}.",
                            "type": "string"
                        },
                        "captchaProvider": {
                            "type": "string"
                        },
                        "cvalue": {
                            "description": "Credentials value.",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "{Roblox.Authentication.Api.Models.LoginRequest}."
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n1: Incorrect username or password. Please try again.\r\n2: You must pass the robot test before logging in.\r\n4: Account has been locked. Please request a password reset.\r\n5: Unable to login. Please use Social Network sign on.\r\n6: Account issue. Please contact Support.\r\n9: Unable to login with provided credentials. Default login is required.\r\n10: Received credentials are unverified.\r\n12: Existing login session found. Please log out first.\r\n14: The account is unable to log in. Please log in to the LuoBu app.\r\n15: Too many attempts. Please wait a bit."
        },
        "400": {
            "description": "0: An unexpected error occurred.\r\n3: Username and Password are required. Please try again.\r\n8: Login with received credential type is not supported."
        },
        "200": {
            "description": "Successfully logged in.",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A success response from a login request",
                    "properties": {
                        "twoStepVerificationData": {
                            "$ref": {
                                "type": "object",
                                "description": "The response model containing information about a two step verification challenge",
                                "properties": {
                                    "mediaType": {
                                        "enum": {
                                            "1": "Email",
                                            "2": "SMS",
                                            "3": "Authenticator",
                                            "4": "RecoveryCode"
                                        },
                                        "description": "The media type the two step verification code was sent on",
                                        "type": "string"
                                    },
                                    "ticket": {
                                        "description": "The two step verification ticket",
                                        "type": "string"
                                    }
                                }
                            },
                            "description": "TwoStepVerification data if applicable"
                        },
                        "user": {
                            "$ref": {
                                "properties": {
                                    "id": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "name": {
                                        "type": "string"
                                    },
                                    "displayName": {
                                        "type": "string"
                                    }
                                },
                                "type": "object"
                            },
                            "description": "The {Roblox.Web.Responses.Users.SkinnyUserResponse}"
                        }
                    }
                }
            }
        },
        "429": {
            "description": "7: Too many attempts. Please wait a bit."
        },
        "503": {
            "description": "11: Service unavailable. Please try again."
        }
    },
}
```
<hr>


## /v2/qq/connect
```json
{
    "Method": "POST",
    "Description": "Endpoint for connecting a QQ account to an existing Roblox user",
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
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Request model for the tencent account connect endpoint",
                    "properties": {
                        "username": {
                            "description": "Username",
                            "type": "string"
                        },
                        "password": {
                            "description": "Password",
                            "type": "string"
                        },
                        "voucher": {
                            "description": "Tencent Info Security Blob",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "{Roblox.Authentication.Api.Models.TencentConnectRequest}"
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A success response from a login request",
                    "properties": {
                        "twoStepVerificationData": {
                            "$ref": {
                                "type": "object",
                                "description": "The response model containing information about a two step verification challenge",
                                "properties": {
                                    "mediaType": {
                                        "enum": {
                                            "1": "Email",
                                            "2": "SMS",
                                            "3": "Authenticator",
                                            "4": "RecoveryCode"
                                        },
                                        "description": "The media type the two step verification code was sent on",
                                        "type": "string"
                                    },
                                    "ticket": {
                                        "description": "The two step verification ticket",
                                        "type": "string"
                                    }
                                }
                            },
                            "description": "TwoStepVerification data if applicable"
                        },
                        "user": {
                            "$ref": {
                                "properties": {
                                    "id": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "name": {
                                        "type": "string"
                                    },
                                    "displayName": {
                                        "type": "string"
                                    }
                                },
                                "type": "object"
                            },
                            "description": "The {Roblox.Web.Responses.Users.SkinnyUserResponse}"
                        }
                    }
                }
            }
        },
        "403": {
            "description": "0: Token Validation Failed\r\n1: Incorrect username or password. Please try again.\r\n101: The Voucher is expired.\r\n102: The Voucher is invalid.\r\n103: The Account is already connected to a Roblox Account."
        },
        "429": {
            "description": "7: Too many attempts. Please wait a bit."
        },
        "503": {
            "description": "100: Service unavailable. Please try again."
        }
    },
}
```
<hr>


## /v2/auth/metadata
```json
{
    "Method": "GET",
    "Description": "Gets Auth meta data",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": "NONE",
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "The response model containing metadata for auth.",
                    "properties": {
                        "cookieLawNoticeTimeout": {
                            "format": "int32",
                            "description": "Timeout for cookie law notice banner.",
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


## /v2/logout
```json
{
    "Method": "POST",
    "Description": "Destroys the current authentication session.",
    "Consumes": "NONE",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": "NONE",
    "Responses": {
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
        "403": {
            "description": "0: Token Validation Failed"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v2/qq/token-authentication
```json
{
    "Method": "POST",
    "Description": "Token Authentication Endpoint for Mobile",
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
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "properties": {
                        "openId": {
                            "description": "The open id returned by MSDK",
                            "type": "string"
                        },
                        "accessToken": {
                            "description": "The access token returned by MSDK",
                            "type": "string"
                        },
                        "accessTokenExpiry": {
                            "format": "int64",
                            "description": "The access token expiry in unix time returned by MSDK",
                            "type": "integer"
                        }
                    },
                    "type": "object"
                }
            },
            "description": "{Roblox.Authentication.Api.Models.TencentTokenAuthenticationRequest}"
        },
        "2": {
            "in": "query",
            "type": "string",
            "name": "apiKey",
            "description": "",
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n15: The state is expired.\r\n16: The state is invalid.\r\n19: The token is invalid."
        },
        "400": {
            "description": "2: The request is empty.\r\n5: The authorization code is invalid."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Response Model for the Token Exchange Endpoint",
                    "properties": {
                        "voucher": {
                            "description": "Voucher containing Info (union id, open id, access token, refresh token, etc)",
                            "type": "string"
                        },
                        "gender": {
                            "format": "int32",
                            "description": "The gender",
                            "type": "integer"
                        },
                        "userId": {
                            "format": "int64",
                            "description": "The Roblox User ID of the connected account, if one exists",
                            "type": "integer"
                        },
                        "displayName": {
                            "description": "User's display name",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "429": {
            "description": "3: Too many requests. Please try again later."
        },
        "503": {
            "description": "7: The Roblox API is currently unavailable.\r\n25: The QQ API is unavailable."
        }
    },
}
```
<hr>


## /v2/saml/login
```json
{
    "Method": "POST",
    "Description": "Authenticates a user for a service through SAML2.",
    "Consumes": "NONE",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": "NONE",
    "Responses": {
        "200": {
            "description": "SAML2 response XML",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A response model for a Saml2 response",
                    "properties": {
                    }
                }
            }
        },
        "302": {
            "description": "An error occurred durring authentication. Redirects to www"
        },
        "307": {
            "description": "Temporary redirect to www if the user is unauthenticated."
        }
    },
}
```
<hr>


## /v2/wechat/signup
```json
{
    "Method": "POST",
    "Description": "Endpoint for signing up a new wechat user",
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
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Request model for the WeChat Signup endpoint",
                    "properties": {
                        "username": {
                            "description": "Username",
                            "type": "string"
                        },
                        "birthday": {
                            "format": "date-time",
                            "description": "Birthday",
                            "type": "string"
                        },
                        "weChatVoucher": {
                            "description": "WeChat Info Security Blob",
                            "type": "string"
                        },
                        "gender": {
                            "enum": {
                                "1": "Unknown",
                                "2": "Male",
                                "3": "Female"
                            },
                            "description": "Gender",
                            "type": "string"
                        },
                        "password": {
                            "description": "Password",
                            "type": "string"
                        }
                    }
                }
            },
            "description": ""
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A response model for the WeChatV2 Signup endpoint",
                    "properties": {
                        "checkHeartbeatAfterWeChatSignup": {
                            "description": "Whether to call the heartbeat api after wechat signup for CLB",
                            "type": "boolean"
                        },
                        "userId": {
                            "format": "int64",
                            "description": "The user ID",
                            "type": "integer"
                        },
                        "starterPlaceId": {
                            "format": "int64",
                            "description": "The id of the game to start with",
                            "type": "integer"
                        }
                    }
                }
            }
        },
        "403": {
            "description": "0: Token Validation Failed"
        }
    },
}
```
<hr>


## /v2/wechat/token-authentication
```json
{
    "Method": "POST",
    "Description": "Token Authentication Endpoint for Mobile",
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
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "WeChat Token Exchange Request for the Token Exchange Endpoint",
                    "properties": {
                        "accessTokenExpiry": {
                            "format": "int32",
                            "description": "The access token expiry returned by MSDK",
                            "type": "integer"
                        },
                        "refreshToken": {
                            "description": "The refresh token returned by MSDK",
                            "type": "string"
                        },
                        "openId": {
                            "description": "The open id returned by MSDK",
                            "type": "string"
                        },
                        "accessToken": {
                            "description": "The access token returned by MSDK",
                            "type": "string"
                        },
                        "refreshTokenExpiry": {
                            "format": "int32",
                            "description": "The refresh token expiry returned by MSDK",
                            "type": "integer"
                        }
                    }
                }
            },
            "description": ""
        },
        "2": {
            "in": "query",
            "type": "string",
            "name": "apiKey",
            "description": "",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Response Model for the Token Exchange Endpoint",
                    "properties": {
                        "weChatVoucher": {
                            "description": "Voucher containing WeChat Info (union id, open id, access token, refresh token, etc)",
                            "type": "string"
                        },
                        "gender": {
                            "format": "int32",
                            "description": "The gender obtained from WeChat",
                            "type": "integer"
                        },
                        "userId": {
                            "format": "int64",
                            "description": "The Roblox User ID of the connected account, if one exists",
                            "type": "integer"
                        }
                    }
                }
            }
        },
        "403": {
            "description": "0: Token Validation Failed\r\n15: The WeChat state is expired.\r\n16: The WeChat state is invalid."
        },
        "400": {
            "description": "2: The request is empty.\r\n5: The authorization code is invalid."
        },
        "503": {
            "description": "1: WeChat is unavailable.\r\n7: The Roblox WeChat API is currently unavailable."
        }
    },
}
```
<hr>


## /v2/twostepverification/verify
```json
{
    "Method": "POST",
    "Description": "Verifies a two step verification code.",
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
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A request model that contains information needed to verify with two step verification",
                    "properties": {
                        "username": {
                            "description": "The username of the user the ticket belongs to",
                            "type": "string"
                        },
                        "ticket": {
                            "description": "The ticket",
                            "type": "string"
                        },
                        "code": {
                            "description": "The two step verification code",
                            "type": "string"
                        },
                        "actionType": {
                            "enum": {
                                "1": "Unknown",
                                "2": "Login",
                                "3": "RobuxSpend"
                            },
                            "description": "The {Roblox.TwoStepVerification.Client.TwoStepVerificationActionType} to verify.",
                            "type": "string"
                        },
                        "rememberDevice": {
                            "description": "Whether or not to remember the device for two step verification.",
                            "type": "boolean"
                        }
                    }
                }
            },
            "description": "The request model containing information needed to verify with two step verification."
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed"
        },
        "400": {
            "description": "1: User is invalid.\r\n5: Invalid two step verification ticket.\r\n6: The code is invalid.\r\n7: The action is unsupported."
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
            "description": "3: Too many attempts. Please try again later."
        },
        "503": {
            "description": "2: The two step verification feature is not enabled at this time."
        }
    },
}
```
<hr>


## /v2/qq/signupwithoutpassword
```json
{
    "Method": "POST",
    "Description": "Endpoint for signing up a new QQ user with Display Name and no Password",
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
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Request model for the tencent signup without Password endpoint",
                    "properties": {
                        "voucher": {
                            "description": "Tencent Info Security Blob",
                            "type": "string"
                        },
                        "birthday": {
                            "format": "date-time",
                            "description": "Birthday",
                            "type": "string"
                        },
                        "agreementIds": {
                            "items": {
                                "type": "string"
                            },
                            "type": "array",
                            "description": "AgreementIds"
                        },
                        "tencentDeveloperAppType": {
                            "description": "AppType",
                            "type": "string"
                        },
                        "gender": {
                            "enum": {
                                "1": "Unknown",
                                "2": "Male",
                                "3": "Female"
                            },
                            "description": "Gender",
                            "type": "string"
                        },
                        "displayName": {
                            "description": "DisplayName",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "{Roblox.Authentication.Api.Models.TencentSignupWithoutPasswordRequest}"
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n8: The Voucher is expired.\r\n9: The Voucher is invalid.\r\n14: The Account is already connected to a Roblox Account."
        },
        "400": {
            "description": "2: The request is empty.\r\n11: The birthday is invalid.\r\n12: The password is invalid.\r\n13: The username is invalid.\r\n26: Display Name is invalid.\r\n28: The Tencent developer app type is invalid."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A response model for the Signup endpoint",
                    "properties": {
                        "userId": {
                            "format": "int64",
                            "description": "The user ID",
                            "type": "integer"
                        },
                        "starterPlaceId": {
                            "format": "int64",
                            "description": "The id of the game to start with",
                            "type": "integer"
                        }
                    }
                }
            }
        },
        "503": {
            "description": "7: The Roblox API is currently unavailable.\r\n10: Failed to create user.\r\n25: The QQ API is unavailable."
        },
        "429": {
            "description": "3: Too many requests. Please try again later."
        },
        "500": {
            "description": "0: An unknown error occurred."
        }
    },
}
```
<hr>


## /v2/twostepverification/resend
```json
{
    "Method": "POST",
    "Description": "Resends a two step verification code.",
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
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A request model that holds two step verification ticket information",
                    "properties": {
                        "username": {
                            "description": "The username of the user the ticket belongs to",
                            "type": "string"
                        },
                        "actionType": {
                            "enum": {
                                "1": "Unknown",
                                "2": "Login",
                                "3": "RobuxSpend"
                            },
                            "description": "The {Roblox.TwoStepVerification.Client.TwoStepVerificationActionType} to request.",
                            "type": "string"
                        },
                        "ticket": {
                            "description": "The ticket",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "The request."
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed"
        },
        "400": {
            "description": "1: User is invalid.\r\n5: Invalid two step verification ticket.\r\n7: The action is unsupported."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "The response model containing information about a two step verification challenge",
                    "properties": {
                        "mediaType": {
                            "enum": {
                                "1": "Email",
                                "2": "SMS",
                                "3": "Authenticator",
                                "4": "RecoveryCode"
                            },
                            "description": "The media type the two step verification code was sent on",
                            "type": "string"
                        },
                        "ticket": {
                            "description": "The two step verification ticket",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "503": {
            "description": "2: The two step verification feature is not enabled at this time."
        },
        "429": {
            "description": "3: Too many attempts. Please try again later."
        },
        "500": {
            "description": "4: Account issue. Please contact Support."
        }
    },
}
```
<hr>


## /v2/user/passwords/change
```json
{
    "Method": "POST",
    "Description": "Changes the password for the authenticated user.",
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
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "properties": {
                        "newPassword": {
                            "type": "string"
                        },
                        "currentPassword": {
                            "type": "string"
                        }
                    },
                    "type": "object"
                }
            },
            "description": "The request model including the current password, and the new password."
        }
    },
    "Responses": {
        "403": {
            "description": "{Roblox.Web.Authentication.Passwords.PasswordResponseCodes.PinLocked}\r\n0: Token Validation Failed"
        },
        "400": {
            "description": "{Roblox.Web.Authentication.Passwords.PasswordResponseCodes.InvalidCurrentPassword}\r\n            OR\r\n            {Roblox.Web.Authentication.Passwords.PasswordResponseCodes.InvalidPassword}"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "Password successfully changed.",
            "schema": {
                "$ref": {
                    "properties": {
                    },
                    "type": "object"
                }
            }
        },
        "429": {
            "description": "{Roblox.Web.Authentication.Passwords.PasswordResponseCodes.Flooded}"
        }
    },
}
```
<hr>


