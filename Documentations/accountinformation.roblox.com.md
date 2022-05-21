# All endpoints for accessing/modifying account information

## /v1/birthdate

Method: **GET**
Description: Get the user's birthdate
Consumes: **NONE**
Produces: **application/json**, **text/json**
Parameters: **NONE**
Responses:
    **200**: "OK"
    **400**: "1: User not found."
    **401**: "0: Authorization has been denied for this request."
<hr>

Method: **POST**
Description: Update the user's birthdate
Consumes: **application/json**, **text/json**, **application/x-www-form-urlencoded**
Produces: **application/json**, **text/json**
Parameters: 
    request [?] (The {BirthdateRequest}) **REQUIRED BODY**
Responses:
    **200**: "OK"
    **400**: "1: User not found.\r\n4: The birthdate provided is invalid."
    **401**: "0: Authorization has been denied for this request."
    **403**: "0: Token Validation Failed\r\n2: PIN is locked.\r\n5: Invalid birthdate change."
    **500**: "0: An unknown error occured.\r\n5: Invalid birthdate change."
<hr>

## /v1/description

Method: **GET**
Description: Get the user's description
Consumes: **NONE**
Produces: **application/json**, **text/json**
Parameters: **NONE**
Responses:
    **200**: "OK"
    **400**: "1: User not found."
    **401**: "0: Authorization has been denied for this request."
<hr>

Method: **POST**
Description: Update the user's description
Consumes: **application/json**, **text/json**, **application/x-www-form-urlencoded**
Produces: **application/json**, **text/json**
Parameters: 
    request [?] (The {DescriptionRequest}) **REQUIRED BODY**
Responses:
    **200**: "OK"
    **400**: "1: User not found."
    **401**: "0: Authorization has been denied for this request."
    **403**: "0: Token Validation Failed\r\n2: PIN is locked."
    **500**: "0: An unknown error occured.\r\n5: Invalid birthdate change."
    **503**: "3: This feature is currently disabled. Please try again later."
<hr>

## /v1/gender

Method: **GET**
Description: Get the user's gender
Consumes: **NONE**
Produces: **application/json**, **text/json**
Parameters: **NONE**
Responses:
    **200**: "OK"
    **400**: "1: User not found."
    **401**: "0: Authorization has been denied for this request."
<hr>

Method: **POST**
Description: Update the user's gender
Consumes: **application/json**, **text/json**, **application/x-www-form-urlencoded**
Produces: **application/json**, **text/json**
Parameters: 
    request [?] (The {GenderRequest}) **REQUIRED BODY**
Responses:
    **200**: "OK"
    **400**: "1: User not found.\r\n6: The gender provided is invalid."
    **401**: "0: Authorization has been denied for this request."
    **403**: "0: Token Validation Failed\r\n2: PIN is locked."
    **500**: "0: An unknown error occured."
<hr>

## /v1/metadata

Method: **GET**
Description: Get the metadata
Consumes: **NONE**
Produces: **application/json**, **text/json**
Parameters: **NONE**
Responses:
    **200**: "OK"
<hr>

## /v1/phone

Method: **GET**
Description: Get Verified Phone Number
Consumes: **NONE**
Produces: **application/json**, **text/json**
Parameters: **NONE**
Responses:
    **200**: "OK"
    **401**: "0: Authorization has been denied for this request."
    **500**: "0: An unknown error occured."
<hr>

Method: **POST**
Description: Set Phone Number
Consumes: **application/json**, **text/json**, **application/x-www-form-urlencoded**
Produces: **application/json**, **text/json**
Parameters: 
    request [?] (The {PhoneRequest}) **REQUIRED BODY**
Responses:
    **200**: "OK"
    **400**: "2: Invalid Phone Number\r\n3: Phone Number Already Associated"
    **401**: "0: Authorization has been denied for this request."
    **403**: "0: Token Validation Failed\r\n4: Account Pin Locked\r\n5: Incorrect Password"
    **429**: "6: Flooded"
    **500**: "0: An unknown error occured."
    **503**: "1: This feature is currently disabled. Please try again later."
<hr>

## /v1/promotion-channels

Method: **GET**
Description: Get the user's promotion channels
Consumes: **NONE**
Produces: **application/json**, **text/json**
Parameters: **NONE**
Responses:
    **200**: "OK"
    **400**: "1: User not found."
    **401**: "0: Authorization has been denied for this request."
<hr>

Method: **POST**
Description: Update the user's promotion channel
Consumes: **application/json**, **text/json**, **application/x-www-form-urlencoded**
Produces: **application/json**, **text/json**
Parameters: 
    request [?] (The {PromotionChannelsRequest}) **REQUIRED BODY**
Responses:
    **200**: "OK"
    **400**: "2: The request was empty.\r\n11: The Facebook profile url is invalid.\r\n12: The Twitter handle is invalid.\r\n13: The YouTube url is invalid.\r\n14: The Twitch profile url is invalid."
    **401**: "0: Authorization has been denied for this request."
    **403**: "0: Token Validation Failed\r\n3: PIN is locked.\r\n4: Only users who are over twelve years of age may edit social network channels."
<hr>

## /v1/star-code-affiliates

Method: **GET**
Description: Gets a star code affiliate supporter for the authenticated user
Consumes: **NONE**
Produces: **application/json**, **text/json**
Parameters: **NONE**
Responses:
    **200**: "OK"
    **401**: "0: Authorization has been denied for this request."
    **500**: "0: An unknown error occured."s
<hr>

Method: **POST**
Description: Adds a star code affiliate supporter for the authenticated user
Consumes: **application/json**, **text/json**, **application/x-www-form-urlencoded**
Produces: **application/json**, **text/json**
Parameters: 
    request [?] ({StarCodeAffiliateRequest}) **REQUIRED BODY**
Responses:
    **200**: "OK"
    **400**: "1: The code was invalid."
    **401**: "0: Authorization has been denied for this request."
    **403**: "0: Token Validation Failed"
    **500**: "0: An unknown error occured."
<hr>

Method: **DELETE**
Description: Removes the star code affiliate supporter for the authenticated user
Consumes: **NONE**
Produces: **application/json**, **text/json**
Parameters: **NONE**
Responses:
    **200**: "OK"
    **401**: "0: Authorization has been denied for this request."
    **403**: "0: Token Validation Failed"
    **500**: "0: An unknown error occured."
<hr>

## /v1/users/{userId}/promotion-channels

Method: **GET**
Description: Get promotion channels for a given user ID
Consumes: **NONE**
Produces: **application/json**, **text/json**
Parameters:
    userId [integer/int64] **REQUIRED**
Responses:
    **200**: "OK"
    **400**: "1: User not found."
<hr>

## /v1/users/{userId}/roblox-badges

Method: **GET**
Description: Returns a list of Roblox badges belonging to a user.
Consumes: **NONE**
Produces: **application/json**, **text/json**
Parameters:
    userId [integer/int64] **REQUIRED**
Responses:
    **200**: "OK"
<hr>

## /v1/xbox-live/consecutive-login-days

Method: **GET**
Description: Returns number of consecutive login days for xbox users
Consumes: **NONE**
Produces: **application/json**, **text/json**
Parameters: **NONE**
Responses:
    **200**: "OK"
    **401**: "0: Authorization has been denied for this request.\r\n7: The account is not connected to an Xbox Live account"
<hr>

## /v1/email/verify

Method: **POST**
Description: Verify the user's email address from token
Consumes: **application/json**, **text/json**, **application/x-www-form-urlencoded**
Produces: **application/json**, **text/json**
Parameters: 
    request [?] ({VerifyEmailRequest}) **REQUIRED BODY**
Responses:
    **200**: "OK"
    **403**: "0: Token Validation Failed"
<hr>

## /v1/phone/delete

Method: **POST**
Description: Delete Phone
Consumes: **application/json**, **text/json**, **application/x-www-form-urlencoded**
Produces: **application/json**, **text/json**
Parameters: 
    request [?] ({PhoneRequest}) **REQUIRED BODY**
Responses:
    **200**: "OK"
    **401**: "0: Authorization has been denied for this request."
    **403**: "0: Token Validation Failed\r\n4: Account Pin Locked\r\n5: Incorrect Password"
    **429**: "6: Flooded"
    **500**: "0: An unknown error occured."
    **503**: "1: This feature is currently disabled. Please try again later."
<hr>

## /v1/phone/resend

Method: **POST**
Description: Resend Phone code
Consumes: **application/json**, **text/json**, **application/x-www-form-urlencoded**
Produces: **application/json**, **text/json**
Parameters: 
    request [?] ({PhoneRequest}) **REQUIRED BODY**
Responses:
    **200**: "OK"
    **401**: "0: Authorization has been denied for this request."
    **403**: "0: Token Validation Failed\r\n4: Account Pin Locked\r\n5: Incorrect Password"
    **429**: "6: Flooded"
    **500**: "0: An unknown error occured."
    **503**: "1: This feature is currently disabled. Please try again later."
<hr>

## /v1/phone/verify

Method: **POST**
Description: Verify Phone
Consumes: **application/json**, **text/json**, **application/x-www-form-urlencoded**
Produces: **application/json**, **text/json**
Parameters: 
    request [?] ({PhoneRequest}) **REQUIRED BODY**
Responses:
    **200**: "OK"
    **400**: "2: Invalid Phone Number\r\n3: Phone Number Already Associated\r\n7: Invalid Code"
    **401**: "0: Authorization has been denied for this request."
    **403**: "0: Token Validation Failed"
    **429**: "6: Flooded"
    **500**: "0: An unknown error occured."
    **503**: "1: This feature is currently disabled. Please try again later."
<hr>