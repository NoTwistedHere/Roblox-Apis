# Endpoints for the A/B Testing framework

## /v1/enrollments

Method: **POST**
Description: Enrolls a subject in an experiment
Consumes: **application/json**, **text/json**, **application/x-www-form-urlencoded**
Produces: **application/json**, **text/json**
Parameters:
    enrollments [array] (The {ExperimentSubjectModel}s containing the subjects and the experiments to enroll them into) **REQUIRED BODY**
Responses:
    **200**: "OK"
    **403**: "0: Token Validation Failed"
<hr>

## /v1/get-enrollments

Method: **POST**
Description: Gets a subject's enrollment in an experiment
Consumes: **application/json**, **text/json**, **application/x-www-form-urlencoded**
Produces: **application/json**, **text/json**
Parameters:
    enrollments [array] (A collection of {ExperimentSubjectModel}s containing the name of the experiments and the subjects to get the enrollments for) **REQUIRED BODY**
Responses:
    **200**: "OK"
    **403**: "0: Token Validation Failed"
<hr>