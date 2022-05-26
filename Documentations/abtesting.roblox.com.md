# <b>AbTesting Api v1</b>

## /v1/get-enrollments
```json
{
    "Method": "POST",
    "Description": "Gets a subject's enrollment in an experiment.",
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
            "name": "enrollments",
            "required": true,
            "schema": {
                "items": {
                    "$ref": {
                        "properties": {
                            "ExperimentName": {
                                "type": "string"
                            },
                            "SubjectTargetId": {
                                "type": "integer",
                                "format": "int64"
                            },
                            "SubjectType": {
                                "type": "string",
                                "enum": {
                                    "1": "User",
                                    "2": "BrowserTracker"
                                }
                            }
                        },
                        "type": "object"
                    }
                },
                "type": "array"
            },
            "description": "A collection of {Roblox.AbTesting.Api.Models.Request.ExperimentSubjectModel}s containing the name of the experiments and the subjects to get the enrollments for."
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "data": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "ExperimentName": {
                                            "type": "string"
                                        },
                                        "Variation": {
                                            "type": "integer",
                                            "format": "int32"
                                        },
                                        "SubjectTargetId": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "SubjectType": {
                                            "type": "string",
                                            "enum": {
                                                "1": "User",
                                                "2": "BrowserTracker"
                                            }
                                        }
                                    },
                                    "type": "object"
                                }
                            },
                            "type": "array"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "403": {
            "description": "0: Token Validation Failed"
        }
    },
    "Internal": true
}
```
<hr>


## /v1/enrollments
```json
{
    "Method": "POST",
    "Description": "Enrolls a subject in an experiment.",
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
            "name": "enrollments",
            "required": true,
            "schema": {
                "items": {
                    "$ref": {
                        "properties": {
                            "ExperimentName": {
                                "type": "string"
                            },
                            "SubjectTargetId": {
                                "type": "integer",
                                "format": "int64"
                            },
                            "SubjectType": {
                                "type": "string",
                                "enum": {
                                    "1": "User",
                                    "2": "BrowserTracker"
                                }
                            }
                        },
                        "type": "object"
                    }
                },
                "type": "array"
            },
            "description": "The {Roblox.AbTesting.Api.Models.Request.ExperimentSubjectModel}s containing the subjects and the experiments to enroll them into."
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "data": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "ExperimentName": {
                                            "type": "string"
                                        },
                                        "Variation": {
                                            "type": "integer",
                                            "format": "int32"
                                        },
                                        "SubjectTargetId": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "Status": {
                                            "type": "string"
                                        },
                                        "SubjectType": {
                                            "type": "string",
                                            "enum": {
                                                "1": "User",
                                                "2": "BrowserTracker"
                                            }
                                        }
                                    },
                                    "type": "object"
                                }
                            },
                            "type": "array"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "403": {
            "description": "0: Token Validation Failed"
        }
    },
    "Internal": true
}
```
<hr>


