# Endpoints for the A/B Testing framework

## /v1/enrollments

```json
{
    "Method": "POST",
    "Description": "Enrolls a subject in an experiment",
    "Consumes": [
        "application/json",
        "text/json",
        "application/x-www-form-urlencoded"
    ],
    "Produces": [
        "application/json",
        "text/json"
    ],
    "Parameters": {
        "enrollments": [] // Array, Required Body, The {ExperimentSubjectModel}s containing the subjects and the experiments to enroll them into
    },
    "Responses": {
        "200": "OK",
        "403": "0: Token Validation Failed",
    }
}
```
<hr>

## /v1/get-enrollments

```json
{
    "Method": "POST",
    "Description": "Gets a subject's enrollment in an experiment",
    "Consumes": [
        "application/json",
        "text/json",
        "application/x-www-form-urlencoded"
    ],
    "Produces": [
        "application/json",
        "text/json"
    ],
    "Parameters": {
        "enrollments": [] // Array, Required Body, A collection of {ExperimentSubjectModel}s containing the name of the experiments and the subjects to get the enrollments for
    },
    "Responses": {
        "200": "OK",
        "403": "0: Token Validation Failed",
    }
}
```
<hr>