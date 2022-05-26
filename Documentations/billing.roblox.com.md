# <b>Billing Api v1</b>

## /v1/payments/credit/checkout
```json
{
    "Method": "POST",
    "Description": "Get the metadata for Credit Payments view",
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
            "name": "creditPaymentCheckoutRequest",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Request sent to Billing Api from external service or javascript to purchase product via credit payment",
                    "properties": {
                        "productId": {
                            "format": "int32",
                            "description": "Product Id",
                            "type": "integer"
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
                    "description": "Response model for Credit payments page checkout",
                    "properties": {
                        "isSuccess": {
                            "description": "Whether the checkout was a success",
                            "type": "boolean"
                        },
                        "redirectionUrl": {
                            "description": "Redirection url",
                            "type": "string"
                        }
                    }
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


## /v1/developer-exchange-metadata
```json
{
    "Method": "GET",
    "Description": "Get devex welcome page metadata",
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
                    "description": "Get WelcomeDevex Page MetaData Response",
                    "properties": {
                        "robloxDevExHelpFullUrl": {
                            "description": "Get more developer exchange information url",
                            "type": "string"
                        },
                        "hasCurrencyOperationError": {
                            "description": "Has currency operation error",
                            "type": "boolean"
                        },
                        "minRobuxToCashOut": {
                            "description": "min robux To cashOut",
                            "type": "string"
                        },
                        "meetsMembershipRequirements": {
                            "description": "Meets membership requirements",
                            "type": "boolean"
                        },
                        "currencyOperationErrorMessage": {
                            "description": "Currency operation error message",
                            "type": "string"
                        },
                        "canProceedToCashout": {
                            "description": "Can proceed to cashout",
                            "type": "boolean"
                        },
                        "emailIsVerified": {
                            "description": "Email is verified",
                            "type": "boolean"
                        },
                        "redirectUrl": {
                            "description": "Redirect url",
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


## /v1/credit/redeem-robux
```json
{
    "Method": "POST",
    "Description": "Redeems All Roblox Credit for Robux if Roblox credit balance is below the lowest desktop package",
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
                "type": "boolean"
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


## /v1/already-purchased-failure/info
```json
{
    "Method": "GET",
    "Description": "Get the informtion needed to populate purchase failure page",
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
                    "description": "Failure page help link",
                    "properties": {
                        "robloxSupportUrl": {
                            "description": "Roblox support url",
                            "type": "string"
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


## /v1/payments/paypal/paymentResult
```json
{
    "Method": "POST",
    "Description": "increment a counter based on user agent",
    "Consumes": "NONE",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "integer",
            "name": "orderCode",
            "format": "int64",
            "required": true,
            "description": ""
        },
        "2": {
            "in": "query",
            "type": "string",
            "name": "token",
            "description": "",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Paypal payment response model",
                    "properties": {
                        "errorMsg": {
                            "description": "error message",
                            "type": "string"
                        },
                        "redirectLink": {
                            "description": "redirect link",
                            "type": "string"
                        },
                        "success": {
                            "description": "Success payment",
                            "type": "boolean"
                        },
                        "errorCode": {
                            "format": "int32",
                            "description": "Success payment",
                            "type": "integer"
                        },
                        "isRetry": {
                            "description": "Retry flag",
                            "type": "boolean"
                        }
                    }
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


## /v1/developer-exchange-request
```json
{
    "Method": "POST",
    "Description": "Submit Devex request",
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
                    "description": "SubmitDevexRequest",
                    "properties": {
                        "firstName": {
                            "description": "Gets or sets FirstName",
                            "type": "string"
                        },
                        "emailAddress": {
                            "description": "Gets or sets EmailAddress",
                            "type": "string"
                        },
                        "password": {
                            "description": "Gets or sets Password",
                            "type": "string"
                        },
                        "lastName": {
                            "description": "Gets or sets LastName",
                            "type": "string"
                        },
                        "robuxAmount": {
                            "format": "int64",
                            "description": "Gets or sets RobuxAmount",
                            "type": "integer"
                        }
                    }
                }
            },
            "description": "request"
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "SubmitDevexResponse",
                    "properties": {
                    }
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


## /v1/luobu-developer-exchange/balance
```json
{
    "Method": "GET",
    "Description": "Get Luobu Developer Exchange Balance",
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
                    "description": "GetLuobuDevexBalanceResponse",
                    "properties": {
                        "amount": {
                            "format": "double",
                            "description": "Amount",
                            "type": "number"
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


## /v1/payments/vantiv/metadata
```json
{
    "Method": "GET",
    "Description": "Get the metadata for Vantiv Payment view",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "integer",
            "name": "vantivPaymentMetadataRequest.productId",
            "format": "int32",
            "description": "Product ID",
        },
        "2": {
            "in": "query",
            "type": "string",
            "name": "vantivPaymentMetadataRequest.paymentMethod",
            "enum": {
                "1": "AppleAppStore",
                "2": "Boku",
                "3": "Check",
                "4": "Credit",
                "5": "PayPalCreditCard",
                "6": "GooglePlayStore",
                "7": "InComm",
                "8": "Mail",
                "9": "Paypal",
                "10": "Rixty",
                "11": "RixtyPin",
                "12": "LiveGamer",
                "13": "RobloxGiveaway",
                "14": "AmazonStore",
                "15": "XboxStore",
                "16": "Wallie",
                "17": "WindowsStore",
                "18": "VantivToken",
                "19": "XsollaOXXO",
                "20": "XsollaBoleto",
                "21": "XsollaSOFORT",
                "22": "XsollaPaysafe",
                "23": "XsollaCreditDebitCards",
                "24": "XsollaAmazonPay",
                "25": "XsollaPayPal",
                "26": "XsollaOther",
                "27": "MidasWeChatDesktop",
                "28": "MidasWeChatAndroid",
                "29": "MidasWeChatApple",
                "30": "XsollaKoreaCreditDebitCards",
                "31": "Undefined"
            },
            "description": "Payment method",
        },
        "3": {
            "in": "query",
            "type": "integer",
            "name": "vantivPaymentMetadataRequest.selectedUpsellProductId",
            "format": "int32",
            "description": "Upsell Product ID",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Metadata response model for Vantiv Payment page",
                    "properties": {
                        "viewModel": {
                            "$ref": {
                                "type": "object",
                                "description": "View Model for Vantiv Payment page",
                                "properties": {
                                    "vantivThreatMetrixSessionId": {
                                        "description": "VantivThreatMetrixSessionId",
                                        "type": "string"
                                    },
                                    "selectedUpsellProductId": {
                                        "format": "int32",
                                        "description": "Selected upsell product Id",
                                        "type": "integer"
                                    },
                                    "dataViewModel": {
                                        "$ref": {
                                            "type": "object",
                                            "description": "A model containing payment data",
                                            "properties": {
                                                "currencyTypeId": {
                                                    "format": "int32",
                                                    "description": "CurrencyTypeId",
                                                    "type": "integer"
                                                },
                                                "currency": {
                                                    "$ref": {
                                                        "properties": {
                                                            "Id": {
                                                                "format": "int32",
                                                                "readOnly": true,
                                                                "type": "integer"
                                                            },
                                                            "CurrencyName": {
                                                                "readOnly": true,
                                                                "type": "string"
                                                            },
                                                            "CurrencyType": {
                                                                "enum": {
                                                                    "1": "USD",
                                                                    "2": "CAD",
                                                                    "3": "GBP",
                                                                    "4": "EUR",
                                                                    "5": "DZD",
                                                                    "6": "AUD",
                                                                    "7": "BDT",
                                                                    "8": "BOB",
                                                                    "9": "BRL",
                                                                    "10": "BGN",
                                                                    "11": "CLP",
                                                                    "12": "CNY",
                                                                    "13": "COP",
                                                                    "14": "CRC",
                                                                    "15": "HRK",
                                                                    "16": "CZK",
                                                                    "17": "DKK",
                                                                    "18": "EGP",
                                                                    "19": "GHS",
                                                                    "20": "HKD",
                                                                    "21": "HUF",
                                                                    "22": "INR",
                                                                    "23": "IDR",
                                                                    "24": "ILS",
                                                                    "25": "JPY",
                                                                    "26": "KZT",
                                                                    "27": "KES",
                                                                    "28": "LBP",
                                                                    "29": "MOP",
                                                                    "30": "MYR",
                                                                    "31": "MXN",
                                                                    "32": "MAD",
                                                                    "33": "NZD",
                                                                    "34": "NGN",
                                                                    "35": "NOK",
                                                                    "36": "PKR",
                                                                    "37": "PEN",
                                                                    "38": "PHP",
                                                                    "39": "PLN",
                                                                    "40": "QAR",
                                                                    "41": "RON",
                                                                    "42": "RUB",
                                                                    "43": "SAR",
                                                                    "44": "SGD",
                                                                    "45": "ZAR",
                                                                    "46": "KRW",
                                                                    "47": "LKR",
                                                                    "48": "SEK",
                                                                    "49": "CHF",
                                                                    "50": "TWD",
                                                                    "51": "TZS",
                                                                    "52": "THB",
                                                                    "53": "TRY",
                                                                    "54": "UAH",
                                                                    "55": "AED",
                                                                    "56": "VND"
                                                                },
                                                                "readOnly": true,
                                                                "type": "string"
                                                            },
                                                            "CurrencySymbol": {
                                                                "readOnly": true,
                                                                "type": "string"
                                                            }
                                                        },
                                                        "type": "object"
                                                    },
                                                    "description": "Currency"
                                                },
                                                "isDesktopLocalPricingEnabled": {
                                                    "description": "Is desktop local pricing enabled",
                                                    "type": "boolean"
                                                },
                                                "countryCurrencyTypeId": {
                                                    "format": "int32",
                                                    "description": "Country Currency Type Id",
                                                    "type": "integer"
                                                },
                                                "selectedProductPrice": {
                                                    "format": "double",
                                                    "description": "SelectedProductPrice",
                                                    "type": "number"
                                                }
                                            }
                                        },
                                        "description": "Data view model"
                                    },
                                    "paymentProviderType": {
                                        "enum": {
                                            "1": "AppleAppStore",
                                            "2": "Boku",
                                            "3": "Check",
                                            "4": "Credit",
                                            "5": "PayPalCreditCard",
                                            "6": "GooglePlayStore",
                                            "7": "InComm",
                                            "8": "Mail",
                                            "9": "Paypal",
                                            "10": "Rixty",
                                            "11": "RixtyPin",
                                            "12": "LiveGamer",
                                            "13": "RobloxGiveaway",
                                            "14": "AmazonStore",
                                            "15": "XboxStore",
                                            "16": "Wallie",
                                            "17": "WindowsStore",
                                            "18": "VantivToken",
                                            "19": "XsollaOXXO",
                                            "20": "XsollaBoleto",
                                            "21": "XsollaSOFORT",
                                            "22": "XsollaPaysafe",
                                            "23": "XsollaCreditDebitCards",
                                            "24": "XsollaAmazonPay",
                                            "25": "XsollaPayPal",
                                            "26": "XsollaOther",
                                            "27": "MidasWeChatDesktop",
                                            "28": "MidasWeChatAndroid",
                                            "29": "MidasWeChatApple",
                                            "30": "XsollaKoreaCreditDebitCards",
                                            "31": "Undefined"
                                        },
                                        "description": "Payment provider type",
                                        "type": "string"
                                    },
                                    "kountSessionId": {
                                        "description": "KountSessionId",
                                        "type": "string"
                                    },
                                    "userBillingInfo": {
                                        "$ref": {
                                            "type": "object",
                                            "description": "View Model for user section",
                                            "properties": {
                                                "country": {
                                                    "description": "Country",
                                                    "type": "string"
                                                },
                                                "phone": {
                                                    "description": "Phone",
                                                    "type": "string"
                                                },
                                                "lastName": {
                                                    "description": "Countries",
                                                    "type": "string"
                                                },
                                                "address1": {
                                                    "description": "Address 1:",
                                                    "type": "string"
                                                },
                                                "firstName": {
                                                    "description": "First Name",
                                                    "type": "string"
                                                },
                                                "countries": {
                                                    "items": {
                                                        "$ref": {
                                                            "type": "object",
                                                            "description": "A model containing information about Country",
                                                            "properties": {
                                                                "isSelected": {
                                                                    "description": "IsSelected",
                                                                    "type": "boolean"
                                                                },
                                                                "name": {
                                                                    "description": "Name",
                                                                    "type": "string"
                                                                },
                                                                "code": {
                                                                    "description": "Code",
                                                                    "type": "string"
                                                                }
                                                            }
                                                        }
                                                    },
                                                    "type": "array",
                                                    "description": "Countries"
                                                },
                                                "address2": {
                                                    "description": "Address 2:",
                                                    "type": "string"
                                                },
                                                "email": {
                                                    "description": "Email",
                                                    "type": "string"
                                                },
                                                "zip": {
                                                    "description": "Zip",
                                                    "type": "string"
                                                },
                                                "state": {
                                                    "description": "State, only validate when Country is US, it will happen in the UpgradesControllers",
                                                    "type": "string"
                                                },
                                                "city": {
                                                    "description": "City",
                                                    "type": "string"
                                                }
                                            }
                                        },
                                        "description": "User Section Info"
                                    },
                                    "kountNoIFrameEnabled": {
                                        "description": "KountNoIFrameEnabled",
                                        "type": "boolean"
                                    },
                                    "selectedProduct": {
                                        "$ref": {
                                            "properties": {
                                                "IsDisabled": {
                                                    "type": "boolean"
                                                },
                                                "Expiration": {
                                                    "type": "string",
                                                    "format": "date-time"
                                                },
                                                "Price": {
                                                    "type": "number",
                                                    "format": "double"
                                                },
                                                "PriceText": {
                                                    "type": "string"
                                                },
                                                "ImageFile": {
                                                    "type": "string"
                                                },
                                                "RenewOrExpireText": {
                                                    "type": "string"
                                                },
                                                "IsRenewable": {
                                                    "type": "boolean"
                                                },
                                                "PremiumFeatureId": {
                                                    "type": "integer",
                                                    "format": "int32"
                                                },
                                                "Name": {
                                                    "type": "string"
                                                },
                                                "ProductId": {
                                                    "type": "integer",
                                                    "format": "int32"
                                                },
                                                "IsCurrentPremiumFeature": {
                                                    "type": "boolean"
                                                },
                                                "GiftcardShoppingCartProductId": {
                                                    "type": "integer",
                                                    "format": "int64"
                                                },
                                                "DurationTitle": {
                                                    "type": "string"
                                                },
                                                "Rank": {
                                                    "type": "string",
                                                    "enum": {
                                                        "1": "None",
                                                        "2": "BC",
                                                        "3": "TBC",
                                                        "4": "OBC"
                                                    }
                                                }
                                            },
                                            "type": "object"
                                        },
                                        "description": "Selected product"
                                    },
                                    "isVantivThreatMetrixEnabled": {
                                        "description": "IsVantivThreatMetrixEnabled",
                                        "type": "boolean"
                                    },
                                    "isKountEnabled": {
                                        "description": "IsKountEnabled",
                                        "type": "boolean"
                                    },
                                    "robuxBcBonus": {
                                        "format": "int32",
                                        "description": "Robux Bc bonus",
                                        "type": "integer"
                                    },
                                    "vantivIframeViewModel": {
                                        "$ref": {
                                            "type": "object",
                                            "description": "Metadata response model for Vantiv Iframe",
                                            "properties": {
                                                "paypageRegistrationId": {
                                                    "description": "PaypageRegistrationId",
                                                    "type": "string"
                                                },
                                                "eprotectId": {
                                                    "type": "string",
                                                    "description": "Gets the unique eProtect identifier assigned from Vantiv.",
                                                    "readOnly": true
                                                },
                                                "maskedCreditCardInfoModel": {
                                                    "$ref": {
                                                        "type": "object",
                                                        "description": "Metadata response model for Vantiv MaskedCreditCardInfoModel",
                                                        "properties": {
                                                            "expirationMonth": {
                                                                "format": "int32",
                                                                "description": "Expiration month\r\n[Range(1, 12)]",
                                                                "type": "integer"
                                                            },
                                                            "lastFour": {
                                                                "description": "Last four\r\n[RegularExpression(@\"\d{4}\")]",
                                                                "type": "string"
                                                            },
                                                            "expirationYear": {
                                                                "format": "int32",
                                                                "description": "Expiration year",
                                                                "type": "integer"
                                                            },
                                                            "firstSix": {
                                                                "description": "First six\r\n[RegularExpression(@\"\d{6}\")]",
                                                                "type": "string"
                                                            }
                                                        }
                                                    },
                                                    "description": "maskedCreditCardInfoModel"
                                                },
                                                "reportGroup": {
                                                    "type": "string",
                                                    "description": "Gets the report group that under which this transaction will be displayed in Vantiv iQ Reporting and Analytics.",
                                                    "readOnly": true
                                                },
                                                "timeoutInMilliseconds": {
                                                    "readOnly": true,
                                                    "format": "int32",
                                                    "description": "Gets the number of milliseconds before a transaction times out and the timeout callback is invoked.",
                                                    "type": "integer"
                                                },
                                                "orderId": {
                                                    "type": "string",
                                                    "description": "Gets the merchant-assigned value representing the order. Max length is 25 characters.",
                                                    "readOnly": true
                                                },
                                                "cssFilename": {
                                                    "type": "string",
                                                    "description": "Gets the style sheet filename excluding the \".css\".",
                                                    "readOnly": true
                                                },
                                                "eprotectClientJsSource": {
                                                    "type": "string",
                                                    "description": "Gets the eprotect client javascript source.",
                                                    "readOnly": true
                                                }
                                            }
                                        },
                                        "description": "VantivIframeViewModel"
                                    },
                                    "isIframeLoadingForVantivEnabled": {
                                        "description": "IsIframeLoadingForVantivEnabled",
                                        "type": "boolean"
                                    },
                                    "creditCard": {
                                        "$ref": {
                                            "properties": {
                                                "Number": {
                                                    "type": "string"
                                                },
                                                "CardType": {
                                                    "type": "string",
                                                    "enum": {
                                                        "1": "Visa",
                                                        "2": "MasterCard",
                                                        "3": "Discover",
                                                        "4": "AmericanExpress"
                                                    }
                                                },
                                                "ExpirationMonth": {
                                                    "type": "string"
                                                },
                                                "ExpirationYear": {
                                                    "type": "string"
                                                },
                                                "SecurityCode": {
                                                    "type": "string"
                                                }
                                            },
                                            "type": "object"
                                        },
                                        "description": "CreditCard"
                                    },
                                    "vantivThreatMetrixScriptUrl": {
                                        "description": "VantivThreatMetrixScriptUrl",
                                        "type": "string"
                                    },
                                    "selectedProductBcVersion": {
                                        "$ref": {
                                            "properties": {
                                                "IsDisabled": {
                                                    "type": "boolean"
                                                },
                                                "Expiration": {
                                                    "type": "string",
                                                    "format": "date-time"
                                                },
                                                "Price": {
                                                    "type": "number",
                                                    "format": "double"
                                                },
                                                "PriceText": {
                                                    "type": "string"
                                                },
                                                "ImageFile": {
                                                    "type": "string"
                                                },
                                                "RenewOrExpireText": {
                                                    "type": "string"
                                                },
                                                "IsRenewable": {
                                                    "type": "boolean"
                                                },
                                                "PremiumFeatureId": {
                                                    "type": "integer",
                                                    "format": "int32"
                                                },
                                                "Name": {
                                                    "type": "string"
                                                },
                                                "ProductId": {
                                                    "type": "integer",
                                                    "format": "int32"
                                                },
                                                "IsCurrentPremiumFeature": {
                                                    "type": "boolean"
                                                },
                                                "GiftcardShoppingCartProductId": {
                                                    "type": "integer",
                                                    "format": "int64"
                                                },
                                                "DurationTitle": {
                                                    "type": "string"
                                                },
                                                "Rank": {
                                                    "type": "string",
                                                    "enum": {
                                                        "1": "None",
                                                        "2": "BC",
                                                        "3": "TBC",
                                                        "4": "OBC"
                                                    }
                                                }
                                            },
                                            "type": "object"
                                        },
                                        "description": "Selected Bc version product"
                                    },
                                    "kountScriptSDKUrl": {
                                        "description": "KountScriptSDKUrl",
                                        "type": "string"
                                    },
                                    "iframeLoadingTimeOutForVantiv": {
                                        "format": "int32",
                                        "description": "IframeLoadingTimeOutForVantiv",
                                        "type": "integer"
                                    },
                                    "kountUrl": {
                                        "description": "KountUrl",
                                        "type": "string"
                                    },
                                    "doublePurchaseConfirmed": {
                                        "description": "DoublePurchaseConfirmed",
                                        "type": "boolean"
                                    },
                                    "vantivThreatMetrixIframeUrl": {
                                        "description": "VantivThreatMetrixIframeUrl",
                                        "type": "string"
                                    },
                                    "vantivPaymentAbTestVariationValue": {
                                        "format": "int32",
                                        "description": "VantivPaymentAbTestVariationValue",
                                        "type": "integer"
                                    },
                                    "displayDoublePurchase": {
                                        "description": "DisplayDoublePurchase",
                                        "type": "boolean"
                                    }
                                }
                            },
                            "description": "View model"
                        },
                        "redirectLink": {
                            "description": "Redirection link",
                            "type": "string"
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


## /v1/metrics/incrementcounterbyagent
```json
{
    "Method": "POST",
    "Description": "Increment a counter based on user agent",
    "Consumes": {
        "1": "application/json",
        "2": "text/json",
        "3": "application/x-www-form-urlencoded"
    },
    "Produces": "NONE",
    "Parameters": {
        "1": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Request sent to Billing Api to increment a counter based on user agent",
                    "properties": {
                        "CounterPrefix": {
                            "description": "Counter Prefix",
                            "type": "string"
                        }
                    }
                }
            },
            "description": ""
        }
    },
    "Responses": {
        "204": {
            "description": "No Content"
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


## /v1/google/purchase
```json
{
    "Method": "POST",
    "Description": "Perform a purchase and grant desired product.",
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
                    "description": "A model containing information about making a purchase through Google Play",
                    "properties": {
                        "token": {
                            "description": "Token",
                            "type": "string"
                        },
                        "productId": {
                            "description": "ProductId",
                            "type": "string"
                        },
                        "packageName": {
                            "description": "Package Name",
                            "type": "string"
                        },
                        "orderId": {
                            "description": "The Order Id",
                            "type": "string"
                        },
                        "isRetry": {
                            "description": "Is the purchase a Retry",
                            "type": "boolean"
                        }
                    }
                }
            },
            "name": "purchaseModel"
        }
    },
    "Responses": {
        "200": {
            "description": "",
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
            "description": "Service was unable to validate receiptId."
        },
        "401": {
            "description": "Unauthorized to make request.\r\n0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/promocodes/redeem
```json
{
    "Method": "POST",
    "Description": "Redeem promotion code",
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
            "name": "promoCodeRequest",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Request sent to Billing Api from external service or javascript to redeem a promotion code",
                    "properties": {
                        "code": {
                            "description": "The promotion code",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "Promotion code redemption request model that contains the information about the code."
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Promotion code redemption response model",
                    "properties": {
                        "errorMsg": {
                            "description": "Message if there is any error",
                            "type": "string"
                        },
                        "success": {
                            "description": "True if successful",
                            "type": "boolean"
                        },
                        "successMsg": {
                            "description": "Message if successful",
                            "type": "string"
                        }
                    }
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


## /v1/apple/validate
```json
{
    "Method": "POST",
    "Description": "Validate a ProductId before making a purchase.",
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
            "name": "validateModel",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A model containing information about validation",
                    "properties": {
                        "currency": {
                            "description": "Currency Code e.g. \"USD\", \"PHP\", \"CAD\"",
                            "type": "string"
                        },
                        "productId": {
                            "description": "Internal Product Id",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "Product Id for example: com.roblox.client.bc1month, com.roblox.client.tbc1month, ..."
        }
    },
    "Responses": {
        "403": {
            "description": "Unauthorized to make request. XSRF token is needed.\r\n0: Token Validation Failed"
        },
        "400": {
            "description": "Service has thrown an uknown exception."
        },
        "401": {
            "description": "Unauthorized to make request. Auth cookie is needed\r\n0: Authorization has been denied for this request."
        },
        "200": {
            "description": "",
            "schema": {
                "$ref": {
                    "properties": {
                    },
                    "type": "object"
                }
            }
        },
        "503": {
            "description": "Service has been turned off. Header response will include Retry-After in seconds."
        },
        "429": {
            "description": "Service has been rate limited to user."
        },
        "404": {
            "description": "{validateModel} is invalid."
        }
    },
}
```
<hr>


## /v1/developer-exchange-rate
```json
{
    "Method": "GET",
    "Description": "Get conversion rate from Robux to USD",
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
                    "description": "GetDevexRateResponse",
                    "properties": {
                        "rate": {
                            "format": "double",
                            "description": "The Exchange Rate",
                            "type": "number"
                        },
                        "currency-code": {
                            "description": "Currency to Exchange to",
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


## /v1/luobu-developer-exchange/request
```json
{
    "Method": "POST",
    "Description": "Send Luobu Developer Exchange Request",
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
                    "description": "SubmitDevexRequest",
                    "properties": {
                        "firstName": {
                            "description": "Gets or sets FirstName",
                            "type": "string"
                        },
                        "amount": {
                            "type": "number",
                            "format": "double"
                        },
                        "lastName": {
                            "description": "Gets or sets LastName",
                            "type": "string"
                        },
                        "email": {
                            "description": "Gets or sets EmailAddress",
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
                    "description": "SubmitLuobuDevexResponse",
                    "properties": {
                    }
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


## /v1/gamecard/redeem
```json
{
    "Method": "POST",
    "Description": "Redeem gamecards for assets and credits",
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
            "name": "redemptionRequest",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Request sent to Billing Api from external service or javascript to redeem a gamecard",
                    "properties": {
                        "pinCode": {
                            "description": "The Game Card's Pin Code",
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
            "description": "request that contains pincode to redeem"
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Response sent back from the Billing Api",
                    "properties": {
                        "itemTypeDisplayName": {
                            "description": "Item Display Name",
                            "type": "string"
                        },
                        "itemName": {
                            "description": "Granted item name",
                            "type": "string"
                        },
                        "bonusMsg": {
                            "description": "Bonus Message. Renders to front end",
                            "type": "string"
                        },
                        "error": {
                            "description": "Error Header",
                            "type": "string"
                        },
                        "successSubText": {
                            "description": "Success SubText",
                            "type": "string"
                        },
                        "errorMsg": {
                            "description": "Error Message",
                            "type": "string"
                        },
                        "balance": {
                            "description": "Amount remaining on the balance after redeeming the gamecard",
                            "type": "string"
                        },
                        "successMsg": {
                            "description": "Message if successful",
                            "type": "string"
                        },
                        "redeemedCredit": {
                            "format": "double",
                            "description": "Redeemed credit",
                            "type": "number"
                        },
                        "grantedRobux": {
                            "description": "Granted Robux after redeem",
                            "type": "string"
                        },
                        "itemType": {
                            "description": "Granted item Type",
                            "type": "string"
                        },
                        "creatorName": {
                            "description": "Granted item Creator Name",
                            "type": "string"
                        },
                        "itemId": {
                            "format": "int64",
                            "description": "Granted item ID",
                            "type": "integer"
                        }
                    }
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


## /v1/user/payments
```json
{
    "Method": "GET",
    "Description": "Retrive the payment history for Authenticated user",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "string",
            "default": "Asc",
            "enum": {
                "1": "Asc",
                "2": "Desc"
            },
            "description": "Sorted by paymentDate",
            "name": "sortOrder",
        },
        "2": {
            "in": "query",
            "type": "integer",
            "default": 10,
            "format": "int32",
            "enum": {
                "1": 10,
                "2": 25,
                "3": 50,
                "4": 100
            },
            "description": "The amount of results per request.",
            "name": "limit",
        },
        "3": {
            "in": "query",
            "type": "string",
            "name": "cursor",
            "description": "The paging cursor for the previous or next page.",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "nextPageCursor": {
                            "type": "string"
                        },
                        "previousPageCursor": {
                            "type": "string"
                        },
                        "data": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "products": {
                                            "items": {
                                                "$ref": {
                                                    "properties": {
                                                        "name": {
                                                            "description": "The name for the product been purchased",
                                                            "type": "string"
                                                        }
                                                    },
                                                    "type": "object"
                                                }
                                            },
                                            "type": "array",
                                            "description": "The list of products that associated with this payment"
                                        },
                                        "cardNumber": {
                                            "description": "The masked credit card number that used in this payment",
                                            "type": "string"
                                        },
                                        "money": {
                                            "$ref": {
                                                "properties": {
                                                    "Currency": {
                                                        "$ref": {
                                                            "properties": {
                                                                "Id": {
                                                                    "format": "int32",
                                                                    "readOnly": true,
                                                                    "type": "integer"
                                                                },
                                                                "CurrencyName": {
                                                                    "readOnly": true,
                                                                    "type": "string"
                                                                },
                                                                "CurrencyType": {
                                                                    "enum": {
                                                                        "1": "USD",
                                                                        "2": "CAD",
                                                                        "3": "GBP",
                                                                        "4": "EUR",
                                                                        "5": "DZD",
                                                                        "6": "AUD",
                                                                        "7": "BDT",
                                                                        "8": "BOB",
                                                                        "9": "BRL",
                                                                        "10": "BGN",
                                                                        "11": "CLP",
                                                                        "12": "CNY",
                                                                        "13": "COP",
                                                                        "14": "CRC",
                                                                        "15": "HRK",
                                                                        "16": "CZK",
                                                                        "17": "DKK",
                                                                        "18": "EGP",
                                                                        "19": "GHS",
                                                                        "20": "HKD",
                                                                        "21": "HUF",
                                                                        "22": "INR",
                                                                        "23": "IDR",
                                                                        "24": "ILS",
                                                                        "25": "JPY",
                                                                        "26": "KZT",
                                                                        "27": "KES",
                                                                        "28": "LBP",
                                                                        "29": "MOP",
                                                                        "30": "MYR",
                                                                        "31": "MXN",
                                                                        "32": "MAD",
                                                                        "33": "NZD",
                                                                        "34": "NGN",
                                                                        "35": "NOK",
                                                                        "36": "PKR",
                                                                        "37": "PEN",
                                                                        "38": "PHP",
                                                                        "39": "PLN",
                                                                        "40": "QAR",
                                                                        "41": "RON",
                                                                        "42": "RUB",
                                                                        "43": "SAR",
                                                                        "44": "SGD",
                                                                        "45": "ZAR",
                                                                        "46": "KRW",
                                                                        "47": "LKR",
                                                                        "48": "SEK",
                                                                        "49": "CHF",
                                                                        "50": "TWD",
                                                                        "51": "TZS",
                                                                        "52": "THB",
                                                                        "53": "TRY",
                                                                        "54": "UAH",
                                                                        "55": "AED",
                                                                        "56": "VND"
                                                                    },
                                                                    "readOnly": true,
                                                                    "type": "string"
                                                                },
                                                                "CurrencySymbol": {
                                                                    "readOnly": true,
                                                                    "type": "string"
                                                                }
                                                            },
                                                            "type": "object"
                                                        }
                                                    },
                                                    "USDAmount": {
                                                        "type": "number",
                                                        "format": "double"
                                                    },
                                                    "Amount": {
                                                        "type": "number",
                                                        "format": "double"
                                                    }
                                                },
                                                "type": "object"
                                            },
                                            "description": "The amount for this payment transaction, this include the price and currency information"
                                        },
                                        "paymentDate": {
                                            "format": "date-time",
                                            "description": "The date for this payment transaction be processed",
                                            "type": "string"
                                        },
                                        "creditCardType": {
                                            "enum": {
                                                "1": "Visa",
                                                "2": "MasterCard",
                                                "3": "Discover",
                                                "4": "AmericanExpress"
                                            },
                                            "description": "The type of credit card that used in this payment",
                                            "type": "string"
                                        },
                                        "paymentProviderType": {
                                            "enum": {
                                                "1": "AppleAppStore",
                                                "2": "Boku",
                                                "3": "Check",
                                                "4": "Credit",
                                                "5": "PayPalCreditCard",
                                                "6": "GooglePlayStore",
                                                "7": "InComm",
                                                "8": "Mail",
                                                "9": "Paypal",
                                                "10": "Rixty",
                                                "11": "RixtyPin",
                                                "12": "LiveGamer",
                                                "13": "RobloxGiveaway",
                                                "14": "AmazonStore",
                                                "15": "XboxStore",
                                                "16": "Wallie",
                                                "17": "WindowsStore",
                                                "18": "VantivToken",
                                                "19": "XsollaOXXO",
                                                "20": "XsollaBoleto",
                                                "21": "XsollaSOFORT",
                                                "22": "XsollaPaysafe",
                                                "23": "XsollaCreditDebitCards",
                                                "24": "XsollaAmazonPay",
                                                "25": "XsollaPayPal",
                                                "26": "XsollaOther",
                                                "27": "MidasWeChatDesktop",
                                                "28": "MidasWeChatAndroid",
                                                "29": "MidasWeChatApple",
                                                "30": "XsollaKoreaCreditDebitCards",
                                                "31": "Undefined"
                                            },
                                            "description": "Payment provider type in payment",
                                            "type": "string"
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
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/toys/redeem/metadata
```json
{
    "Method": "GET",
    "Description": "Get metadata for redeem toy code page",
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
                    "description": "Redeem toy page metadata",
                    "properties": {
                        "howToRedeemToysCodeVideoId": {
                            "description": "YouTube video ID for how to redeem toy video",
                            "type": "string"
                        },
                        "codeLength": {
                            "format": "int32",
                            "description": "Required length for toy code",
                            "type": "integer"
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


## /v1/payments/checkout/success
```json
{
    "Method": "POST",
    "Description": "increment a counter based on user agent",
    "Consumes": "NONE",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "integer",
            "name": "saleId",
            "format": "int32",
        },
        "2": {
            "in": "query",
            "type": "string",
            "name": "gc",
        },
        "3": {
            "in": "query",
            "type": "integer",
            "name": "checkoutSessionId",
            "format": "int64",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Checkout Success Model",
                    "properties": {
                        "isCakePixelEmbeddedOnPaymentSuccessPages": {
                            "description": "Is Cake Pixel Embedded On Payment Success Pages",
                            "type": "boolean"
                        },
                        "isGiftCard": {
                            "description": "IsGiftCard",
                            "type": "boolean"
                        },
                        "listPriceTotal": {
                            "format": "double",
                            "description": "ListPriceTotal",
                            "type": "number"
                        },
                        "giftCardDownLoadUrl": {
                            "type": "string"
                        },
                        "currencyType": {
                            "description": "Currency Type",
                            "type": "string"
                        },
                        "redirectUrl": {
                            "description": "Redirect url",
                            "type": "string"
                        },
                        "robloxSupportUrl": {
                            "description": "Roblox Support Url",
                            "type": "string"
                        },
                        "boughtProducts": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "IsDisabled": {
                                            "type": "boolean"
                                        },
                                        "Expiration": {
                                            "type": "string",
                                            "format": "date-time"
                                        },
                                        "Price": {
                                            "type": "number",
                                            "format": "double"
                                        },
                                        "PriceText": {
                                            "type": "string"
                                        },
                                        "ImageFile": {
                                            "type": "string"
                                        },
                                        "RenewOrExpireText": {
                                            "type": "string"
                                        },
                                        "IsRenewable": {
                                            "type": "boolean"
                                        },
                                        "PremiumFeatureId": {
                                            "type": "integer",
                                            "format": "int32"
                                        },
                                        "Name": {
                                            "type": "string"
                                        },
                                        "ProductId": {
                                            "type": "integer",
                                            "format": "int32"
                                        },
                                        "IsCurrentPremiumFeature": {
                                            "type": "boolean"
                                        },
                                        "GiftcardShoppingCartProductId": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "DurationTitle": {
                                            "type": "string"
                                        },
                                        "Rank": {
                                            "type": "string",
                                            "enum": {
                                                "1": "None",
                                                "2": "BC",
                                                "3": "TBC",
                                                "4": "OBC"
                                            }
                                        }
                                    },
                                    "type": "object"
                                }
                            },
                            "type": "array",
                            "description": "Bought products"
                        },
                        "cakeTrackingSource": {
                            "description": "Cake Tracking Source",
                            "type": "string"
                        },
                        "isRedeemedGiftCard": {
                            "description": "IsRedeemedGiftCard",
                            "type": "boolean"
                        },
                        "saleId": {
                            "format": "int32",
                            "description": "Sale Id",
                            "type": "integer"
                        },
                        "giftCardRedemptionCode": {
                            "description": "GiftCard Redemption Code",
                            "type": "string"
                        }
                    }
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


## /v1/luobu-developer-exchange/eligibility
```json
{
    "Method": "GET",
    "Description": "Get Luobu Developer Exchange Eligibility",
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
                    "description": "GetLuobuDevexEligibilityResponse",
                    "properties": {
                        "eligibility": {
                            "enum": {
                                "1": "Eligible",
                                "2": "InsufficientBalance",
                                "3": "RecentRequest",
                                "4": "InsufficientAge",
                                "5": "Unknown"
                            },
                            "description": "Eligibility",
                            "type": "string"
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


## /v1/gamecard/metadata
```json
{
    "Method": "GET",
    "Description": "Get metadata for game card redemption page",
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
                    "description": "Game card metadata response model",
                    "properties": {
                        "GameCardCodeLength": {
                            "format": "int32",
                            "description": "Game card code length",
                            "type": "integer"
                        },
                        "GiftCardCodeLength": {
                            "format": "int32",
                            "description": "Gift card code length",
                            "type": "integer"
                        },
                        "IsEventStreamEnabled": {
                            "description": "Enable event streaming",
                            "type": "boolean"
                        },
                        "PinPlaceholder": {
                            "description": "Placeholder for pin code",
                            "type": "string"
                        },
                        "IsConvertCreditFlowEnabled": {
                            "description": "True if convert credit flow is enabled",
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


## /v1/payments/xsolla/iframe-token
```json
{
    "Method": "POST",
    "Description": "Get the Xsolla iframe token",
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
            "name": "xsollaIframeRequest",
            "required": true,
            "schema": {
                "$ref": {
                    "properties": {
                        "mainProductId": {
                            "format": "int32",
                            "description": "The product id of the main item that user purchased",
                            "type": "integer"
                        },
                        "paymentProviderType": {
                            "description": "The payment provider type for this purchase request",
                            "type": "string"
                        },
                        "verifiedEmailOrPhone": {
                            "description": "The flag shows if the user already has phone or email verified",
                            "type": "boolean"
                        },
                        "upsellProductId": {
                            "format": "int32",
                            "description": "The product id of the upsell item that user purchased",
                            "type": "integer"
                        }
                    },
                    "type": "object"
                }
            },
            "description": "Xsolla iframe request model that contains the information about the webhook."
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Xsolla payment Iframe Token response model",
                    "properties": {
                        "message": {
                            "type": "string"
                        },
                        "token": {
                            "type": "string"
                        },
                        "success": {
                            "type": "boolean"
                        }
                    }
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


## /v1/apple/purchase
```json
{
    "Method": "POST",
    "Description": "Perform a purchase and grant desired product.",
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
            "name": "appleStorePurchaseModel",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A model containing information about making a purchase through Apple store",
                    "properties": {
                        "receipt": {
                            "description": "Receipt",
                            "type": "string"
                        },
                        "isRetry": {
                            "description": "Is the purchase a Retry",
                            "type": "boolean"
                        },
                        "productId": {
                            "description": "ProductId",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "Apple Purchase Model"
        }
    },
    "Responses": {
        "200": {
            "description": "",
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
            "description": "Service has thrown an uknown exception."
        },
        "401": {
            "description": "Unauthorized to make request.\r\n0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/paymentmethods/{paymentMethod}
```json
{
    "Method": "GET",
    "Description": "Redirects user to the selected payment method page",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "string",
            "name": "paymentMethod",
            "required": true,
            "description": ""
        },
        "2": {
            "in": "query",
            "type": "integer",
            "name": "ap",
            "format": "int32",
            "required": true,
            "description": ""
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "GetPaymentMethodPageResponse",
                    "properties": {
                        "location": {
                            "description": "Location",
                            "type": "string"
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


## /v1/gamecard/userdata
```json
{
    "Method": "GET",
    "Description": "Get user data for game card redemption page",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": "NONE",
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "type": "string"
            }
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/luobu-developer-exchange/latest-request-status
```json
{
    "Method": "GET",
    "Description": "Get Luobu Developer Exchange Latest-request-status",
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
                    "description": "GetLuobuLatestRequestStatusResponse",
                    "properties": {
                        "date": {
                            "format": "date-time",
                            "description": "Status Date",
                            "type": "string"
                        },
                        "status": {
                            "enum": {
                                "1": "None",
                                "2": "Pending",
                                "3": "Completed",
                                "4": "Rejected",
                                "5": "Unknown"
                            },
                            "description": "Status",
                            "type": "string"
                        },
                        "amount": {
                            "format": "double",
                            "description": "Amount",
                            "type": "number"
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


## /v1/payments/credit/metadata
```json
{
    "Method": "GET",
    "Description": "Get the metadata for Credit Payments view",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "integer",
            "name": "ap",
            "format": "int32",
            "required": true,
            "description": ""
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Metadata response model for Credit Payment page",
                    "properties": {
                        "redirectionUrl": {
                            "description": "Redirection url",
                            "type": "string"
                        },
                        "viewModel": {
                            "$ref": {
                                "type": "object",
                                "description": "View Model for Credit Payments page",
                                "properties": {
                                    "selectedProduct": {
                                        "$ref": {
                                            "properties": {
                                                "IsDisabled": {
                                                    "type": "boolean"
                                                },
                                                "Expiration": {
                                                    "type": "string",
                                                    "format": "date-time"
                                                },
                                                "Price": {
                                                    "type": "number",
                                                    "format": "double"
                                                },
                                                "PriceText": {
                                                    "type": "string"
                                                },
                                                "ImageFile": {
                                                    "type": "string"
                                                },
                                                "RenewOrExpireText": {
                                                    "type": "string"
                                                },
                                                "IsRenewable": {
                                                    "type": "boolean"
                                                },
                                                "PremiumFeatureId": {
                                                    "type": "integer",
                                                    "format": "int32"
                                                },
                                                "Name": {
                                                    "type": "string"
                                                },
                                                "ProductId": {
                                                    "type": "integer",
                                                    "format": "int32"
                                                },
                                                "IsCurrentPremiumFeature": {
                                                    "type": "boolean"
                                                },
                                                "GiftcardShoppingCartProductId": {
                                                    "type": "integer",
                                                    "format": "int64"
                                                },
                                                "DurationTitle": {
                                                    "type": "string"
                                                },
                                                "Rank": {
                                                    "type": "string",
                                                    "enum": {
                                                        "1": "None",
                                                        "2": "BC",
                                                        "3": "TBC",
                                                        "4": "OBC"
                                                    }
                                                }
                                            },
                                            "type": "object"
                                        },
                                        "description": "Selected product"
                                    },
                                    "balance": {
                                        "format": "double",
                                        "description": "Balance",
                                        "type": "number"
                                    },
                                    "availableCredit": {
                                        "format": "double",
                                        "description": "Available credit",
                                        "type": "number"
                                    },
                                    "totalDue": {
                                        "format": "double",
                                        "description": "Total due",
                                        "type": "number"
                                    }
                                }
                            },
                            "description": "View model"
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


## /v1/paymentmethods
```json
{
    "Method": "GET",
    "Description": "Returns payment methods available to the user",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "integer",
            "name": "ap",
            "format": "int32",
            "required": true,
            "description": ""
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "PaymentMethodsResponse",
                    "properties": {
                        "isStarcodeV2Enabled": {
                            "description": "Whether StarcodeV2 is enabled",
                            "type": "boolean"
                        },
                        "currentCredit": {
                            "format": "double",
                            "description": "User's current credit balance",
                            "type": "number"
                        },
                        "redirectUrl": {
                            "description": "Url where user should continue payment flow",
                            "type": "string"
                        },
                        "isU13FraudMessageV2Enabled": {
                            "description": "Whether under 13 fraud message V2 is enabled for user",
                            "type": "boolean"
                        },
                        "isParentalAuthorization13To17Enabled": {
                            "description": "Whether parental authorization for first purchase of 13-17 users is enabled",
                            "type": "boolean"
                        },
                        "selectedProduct": {
                            "$ref": {
                                "properties": {
                                    "IsDisabled": {
                                        "type": "boolean"
                                    },
                                    "Expiration": {
                                        "type": "string",
                                        "format": "date-time"
                                    },
                                    "Price": {
                                        "type": "number",
                                        "format": "double"
                                    },
                                    "PriceText": {
                                        "type": "string"
                                    },
                                    "ImageFile": {
                                        "type": "string"
                                    },
                                    "RenewOrExpireText": {
                                        "type": "string"
                                    },
                                    "IsRenewable": {
                                        "type": "boolean"
                                    },
                                    "PremiumFeatureId": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "Name": {
                                        "type": "string"
                                    },
                                    "ProductId": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "IsCurrentPremiumFeature": {
                                        "type": "boolean"
                                    },
                                    "GiftcardShoppingCartProductId": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "DurationTitle": {
                                        "type": "string"
                                    },
                                    "Rank": {
                                        "type": "string",
                                        "enum": {
                                            "1": "None",
                                            "2": "BC",
                                            "3": "TBC",
                                            "4": "OBC"
                                        }
                                    }
                                },
                                "type": "object"
                            },
                            "description": "Selected product"
                        },
                        "paymentMethodsVisibility": {
                            "$ref": {
                                "type": "object",
                                "description": "PaymentMethodsVisibility",
                                "properties": {
                                    "isXsollaBoletoVisible": {
                                        "description": "Whether XsollaBoleto payment method should be displayed",
                                        "type": "boolean"
                                    },
                                    "isXsollaOxxoVisible": {
                                        "description": "Whether XsollaOxxo payment method should be displayed",
                                        "type": "boolean"
                                    },
                                    "isRobloxCreditVisible": {
                                        "description": "Whether Roblox credit payment method should be displayed",
                                        "type": "boolean"
                                    },
                                    "isCreditCardVisible": {
                                        "description": "Whether credit card payment method should be displayed",
                                        "type": "boolean"
                                    },
                                    "isXsollaPayPalVisible": {
                                        "description": "Whether XsollaPayPal payment method should be displayed",
                                        "type": "boolean"
                                    },
                                    "isXsollaSofortVisible": {
                                        "description": "Whether XsollaSofort payment method should be displayed",
                                        "type": "boolean"
                                    },
                                    "isXsollaOtherVisible": {
                                        "description": "Whether other Xsolla payment method should be displayed",
                                        "type": "boolean"
                                    },
                                    "isAmazonPayVisible": {
                                        "description": "Whether AmazonPay payment method should be displayed",
                                        "type": "boolean"
                                    },
                                    "isPaypalVisible": {
                                        "description": "Whether Paypal payment method should be displayed",
                                        "type": "boolean"
                                    },
                                    "isXsollaCreditCardVisible": {
                                        "description": "Whether XsollaCreditCard payment method should be displayed",
                                        "type": "boolean"
                                    },
                                    "isXsollaKoreaCreditCardVisible": {
                                        "description": "Whether Xsolla Korea Credit Card payment method should be displayed via credit/debit method",
                                        "type": "boolean"
                                    }
                                }
                            },
                            "description": "Whether Roblox credit payment method should be displayed"
                        },
                        "allowCreditForRenewingPurchases": {
                            "description": "Whether credit is allowed for renewing purchases",
                            "type": "boolean"
                        },
                        "loggedIn": {
                            "description": "Whether user is logged in",
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


## /v1/amazon/purchase
```json
{
    "Method": "POST",
    "Description": "Perform a purchase and grant desired product.",
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
            "name": "amazonStorePurchaseModel",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A model containing information about making a purchase through Amazon store",
                    "properties": {
                        "isRetry": {
                            "description": "Is the purchase a Retry",
                            "type": "boolean"
                        },
                        "receiptId": {
                            "description": "ReceiptId",
                            "type": "string"
                        },
                        "amazonUserId": {
                            "description": "UserId",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "Amazon Store Purchase Model"
        }
    },
    "Responses": {
        "200": {
            "description": "",
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
            "description": "Service was unable to validate receiptId."
        },
        "401": {
            "description": "Unauthorized to make request.\r\n0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/payments/xsolla/metadata
```json
{
    "Method": "GET",
    "Description": "Get the metadata for Xsolla Payment view",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "integer",
            "name": "xsollaPaymentMetadataRequest.productId",
            "format": "int32",
            "description": "Product ID",
        },
        "2": {
            "in": "query",
            "type": "string",
            "name": "xsollaPaymentMetadataRequest.paymentMethod",
            "enum": {
                "1": "AppleAppStore",
                "2": "Boku",
                "3": "Check",
                "4": "Credit",
                "5": "PayPalCreditCard",
                "6": "GooglePlayStore",
                "7": "InComm",
                "8": "Mail",
                "9": "Paypal",
                "10": "Rixty",
                "11": "RixtyPin",
                "12": "LiveGamer",
                "13": "RobloxGiveaway",
                "14": "AmazonStore",
                "15": "XboxStore",
                "16": "Wallie",
                "17": "WindowsStore",
                "18": "VantivToken",
                "19": "XsollaOXXO",
                "20": "XsollaBoleto",
                "21": "XsollaSOFORT",
                "22": "XsollaPaysafe",
                "23": "XsollaCreditDebitCards",
                "24": "XsollaAmazonPay",
                "25": "XsollaPayPal",
                "26": "XsollaOther",
                "27": "MidasWeChatDesktop",
                "28": "MidasWeChatAndroid",
                "29": "MidasWeChatApple",
                "30": "XsollaKoreaCreditDebitCards",
                "31": "Undefined"
            },
            "description": "Payment method",
        },
        "3": {
            "in": "query",
            "type": "integer",
            "name": "xsollaPaymentMetadataRequest.selectedUpsellProductId",
            "format": "int32",
            "description": "Upsell Product ID",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Metadata response model for Xsolla Payment page",
                    "properties": {
                        "redirectionModel": {
                            "$ref": {
                                "type": "object",
                                "description": "A model containing information about redirection",
                                "properties": {
                                    "redirectionParams": {
                                        "description": "Paramerters sent to redirection url",
                                        "type": "string"
                                    },
                                    "redirectionUrl": {
                                        "description": "Redirection url",
                                        "type": "string"
                                    }
                                }
                            },
                            "description": "Redirection model"
                        },
                        "viewModel": {
                            "$ref": {
                                "type": "object",
                                "description": "View Model for Xsolla Payment page",
                                "properties": {
                                    "selectedUpsellProductId": {
                                        "format": "int32",
                                        "description": "Selected upsell product Id",
                                        "type": "integer"
                                    },
                                    "xsollaSupportUrl": {
                                        "description": "Xsolla support url",
                                        "type": "string"
                                    },
                                    "paymentProviderType": {
                                        "enum": {
                                            "1": "AppleAppStore",
                                            "2": "Boku",
                                            "3": "Check",
                                            "4": "Credit",
                                            "5": "PayPalCreditCard",
                                            "6": "GooglePlayStore",
                                            "7": "InComm",
                                            "8": "Mail",
                                            "9": "Paypal",
                                            "10": "Rixty",
                                            "11": "RixtyPin",
                                            "12": "LiveGamer",
                                            "13": "RobloxGiveaway",
                                            "14": "AmazonStore",
                                            "15": "XboxStore",
                                            "16": "Wallie",
                                            "17": "WindowsStore",
                                            "18": "VantivToken",
                                            "19": "XsollaOXXO",
                                            "20": "XsollaBoleto",
                                            "21": "XsollaSOFORT",
                                            "22": "XsollaPaysafe",
                                            "23": "XsollaCreditDebitCards",
                                            "24": "XsollaAmazonPay",
                                            "25": "XsollaPayPal",
                                            "26": "XsollaOther",
                                            "27": "MidasWeChatDesktop",
                                            "28": "MidasWeChatAndroid",
                                            "29": "MidasWeChatApple",
                                            "30": "XsollaKoreaCreditDebitCards",
                                            "31": "Undefined"
                                        },
                                        "description": "Payment provider type",
                                        "type": "string"
                                    },
                                    "xsollaValidOrigin": {
                                        "description": "Xsolla valid origin",
                                        "type": "string"
                                    },
                                    "robloxSupportUrl": {
                                        "description": "Roblox support url",
                                        "type": "string"
                                    },
                                    "selectedProductBcVersion": {
                                        "$ref": {
                                            "properties": {
                                                "IsDisabled": {
                                                    "type": "boolean"
                                                },
                                                "Expiration": {
                                                    "type": "string",
                                                    "format": "date-time"
                                                },
                                                "Price": {
                                                    "type": "number",
                                                    "format": "double"
                                                },
                                                "PriceText": {
                                                    "type": "string"
                                                },
                                                "ImageFile": {
                                                    "type": "string"
                                                },
                                                "RenewOrExpireText": {
                                                    "type": "string"
                                                },
                                                "IsRenewable": {
                                                    "type": "boolean"
                                                },
                                                "PremiumFeatureId": {
                                                    "type": "integer",
                                                    "format": "int32"
                                                },
                                                "Name": {
                                                    "type": "string"
                                                },
                                                "ProductId": {
                                                    "type": "integer",
                                                    "format": "int32"
                                                },
                                                "IsCurrentPremiumFeature": {
                                                    "type": "boolean"
                                                },
                                                "GiftcardShoppingCartProductId": {
                                                    "type": "integer",
                                                    "format": "int64"
                                                },
                                                "DurationTitle": {
                                                    "type": "string"
                                                },
                                                "Rank": {
                                                    "type": "string",
                                                    "enum": {
                                                        "1": "None",
                                                        "2": "BC",
                                                        "3": "TBC",
                                                        "4": "OBC"
                                                    }
                                                }
                                            },
                                            "type": "object"
                                        },
                                        "description": "Selected Bc version product"
                                    },
                                    "incrementCounterUrl": {
                                        "description": "Increment counter url",
                                        "type": "string"
                                    },
                                    "isXsollaPaypalIframeEnabled": {
                                        "description": "Xsolla Paypal Iframe settings",
                                        "type": "boolean"
                                    },
                                    "selectedProduct": {
                                        "$ref": {
                                            "properties": {
                                                "IsDisabled": {
                                                    "type": "boolean"
                                                },
                                                "Expiration": {
                                                    "type": "string",
                                                    "format": "date-time"
                                                },
                                                "Price": {
                                                    "type": "number",
                                                    "format": "double"
                                                },
                                                "PriceText": {
                                                    "type": "string"
                                                },
                                                "ImageFile": {
                                                    "type": "string"
                                                },
                                                "RenewOrExpireText": {
                                                    "type": "string"
                                                },
                                                "IsRenewable": {
                                                    "type": "boolean"
                                                },
                                                "PremiumFeatureId": {
                                                    "type": "integer",
                                                    "format": "int32"
                                                },
                                                "Name": {
                                                    "type": "string"
                                                },
                                                "ProductId": {
                                                    "type": "integer",
                                                    "format": "int32"
                                                },
                                                "IsCurrentPremiumFeature": {
                                                    "type": "boolean"
                                                },
                                                "GiftcardShoppingCartProductId": {
                                                    "type": "integer",
                                                    "format": "int64"
                                                },
                                                "DurationTitle": {
                                                    "type": "string"
                                                },
                                                "Rank": {
                                                    "type": "string",
                                                    "enum": {
                                                        "1": "None",
                                                        "2": "BC",
                                                        "3": "TBC",
                                                        "4": "OBC"
                                                    }
                                                }
                                            },
                                            "type": "object"
                                        },
                                        "description": "Selected product"
                                    },
                                    "xsollaPaymentUIUrl": {
                                        "description": "Xsolla payment UI url",
                                        "type": "string"
                                    },
                                    "isXsollaBoleto": {
                                        "description": "True if payment method is Xsolla Boleto",
                                        "type": "boolean"
                                    },
                                    "xsollaPaymentUIToken": {
                                        "description": "Xsolla payment UI token",
                                        "type": "string"
                                    }
                                }
                            },
                            "description": "View model"
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


## /v1/amazon/validate
```json
{
    "Method": "POST",
    "Description": "Validate a ProductId before making a purchase.",
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
            "name": "validateModel",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A model containing information about validation",
                    "properties": {
                        "currency": {
                            "description": "Currency Code e.g. \"USD\", \"PHP\", \"CAD\"",
                            "type": "string"
                        },
                        "productId": {
                            "description": "Internal Product Id",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "Product Id for example: com.roblox.client.bc1month, com.roblox.client.tbc1month, ..."
        }
    },
    "Responses": {
        "403": {
            "description": "Unauthorized to make request. XSRF token is needed.\r\n0: Token Validation Failed"
        },
        "400": {
            "description": "Service has thrown an uknown exception."
        },
        "401": {
            "description": "Unauthorized to make request. Auth cookie is needed\r\n0: Authorization has been denied for this request."
        },
        "200": {
            "description": "",
            "schema": {
                "$ref": {
                    "properties": {
                    },
                    "type": "object"
                }
            }
        },
        "503": {
            "description": "Service has been turned off. Header response will include Retry-After in seconds."
        },
        "429": {
            "description": "Service has been rate limited to user."
        },
        "404": {
            "description": "{validateModel} is invalid."
        }
    },
}
```
<hr>


## /v1/gamecard/reverse
```json
{
    "Method": "POST",
    "Description": "Reverse a game card that was already redeemed",
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
                    "description": "Request sent to Billing Api from external service or javascript to reverse a gamecard",
                    "properties": {
                        "PinCode": {
                            "description": "The Game Card's Pin Code",
                            "type": "string"
                        },
                        "UserId": {
                            "format": "int64",
                            "description": "The user who allegedly redeemed the pin code",
                            "type": "integer"
                        }
                    }
                }
            },
            "description": "pin and userid of user who redeemed pin"
        }
    },
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


## /v1/digital-codes/redeem
```json
{
    "Method": "POST",
    "Description": "Redeem gift card with redemption code. Can include additional redemption code types in future",
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
            "name": "redemptionModel",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A model containing information about redeeming a digital code",
                    "properties": {
                        "redemptionCode": {
                            "description": "Redemption Code",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "Redemption code input by user for redemption"
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "type": "object"
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


## /v1/credit
```json
{
    "Method": "GET",
    "Description": "Gets Roblox Credit Balance",
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
                    "description": "Response sent back from the Billing Api",
                    "properties": {
                        "balance": {
                            "format": "double",
                            "description": "The current user's roblox credit balance",
                            "type": "number"
                        },
                        "canRedeemCreditForRobux": {
                            "description": "Flag if user meet the redemption requirement",
                            "type": "boolean"
                        },
                        "robuxAmount": {
                            "format": "int64",
                            "description": "The amount of Robux the user can redeem for",
                            "type": "integer"
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


## /v1/notifications/xsolla
```json
{
    "Method": "POST",
    "Description": "Webhook for Xsolla",
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
            "name": "xsollaNotificationModel",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A model containing information about Xsolla Notification",
                    "properties": {
                        "payment_details": {
                            "$ref": {
                                "type": "object",
                                "description": "Payment details (object).",
                                "properties": {
                                    "payment_method_sum": {
                                        "$ref": {
                                            "type": "object",
                                            "description": "Amount debited from the payment system.",
                                            "properties": {
                                                "amount": {
                                                    "format": "double",
                                                    "description": "Amount.",
                                                    "type": "number"
                                                },
                                                "currency": {
                                                    "description": "Currency.Three-letter currency code per ISO 4217.",
                                                    "type": "string"
                                                }
                                            }
                                        },
                                        "description": "Amount debited from the payment system."
                                    },
                                    "payout_currency_rate": {
                                        "description": "Exchange rate between payment and payout currencies.",
                                        "type": "string"
                                    },
                                    "payment": {
                                        "$ref": {
                                            "type": "object",
                                            "description": "Amount paid by the user (object).",
                                            "properties": {
                                                "amount": {
                                                    "format": "double",
                                                    "description": "Amount.",
                                                    "type": "number"
                                                },
                                                "currency": {
                                                    "description": "Currency. Three-letter currency code per ISO 4217.",
                                                    "type": "string"
                                                }
                                            }
                                        },
                                        "description": "Amount paid by the user (object)."
                                    },
                                    "payment_method_fee": {
                                        "$ref": {
                                            "type": "object",
                                            "description": "Payment system fee.",
                                            "properties": {
                                                "amount": {
                                                    "format": "double",
                                                    "description": "Amount.",
                                                    "type": "number"
                                                },
                                                "currency": {
                                                    "description": "Currency. Three-letter currency code per ISO 4217.",
                                                    "type": "string"
                                                }
                                            }
                                        },
                                        "description": "Payment system fee."
                                    },
                                    "payout": {
                                        "$ref": {
                                            "type": "object",
                                            "description": "Payout details (object).",
                                            "properties": {
                                                "amount": {
                                                    "format": "double",
                                                    "description": "Amount.",
                                                    "type": "number"
                                                },
                                                "currency": {
                                                    "description": "Currency. Three-letter currency code per ISO 4217.",
                                                    "type": "string"
                                                }
                                            }
                                        },
                                        "description": "Payout details (object)."
                                    },
                                    "vat": {
                                        "$ref": {
                                            "type": "object",
                                            "description": "VAT details (object; EU only).",
                                            "properties": {
                                                "amount": {
                                                    "format": "double",
                                                    "description": "Amount.",
                                                    "type": "number"
                                                },
                                                "currency": {
                                                    "description": "Currency. Three-letter currency code per ISO 4217.",
                                                    "type": "string"
                                                }
                                            }
                                        },
                                        "description": "VAT details (object; EU only)."
                                    },
                                    "sales_tax": {
                                        "$ref": {
                                            "type": "object",
                                            "description": "Sales tax (object; USA only).",
                                            "properties": {
                                                "amount": {
                                                    "format": "double",
                                                    "description": "Amount.",
                                                    "type": "number"
                                                },
                                                "currency": {
                                                    "description": "Currency. Three-letter currency code per ISO 4217.",
                                                    "type": "string"
                                                }
                                            }
                                        },
                                        "description": "Sales tax (object; USA only)."
                                    },
                                    "xsolla_balance_sum": {
                                        "$ref": {
                                            "type": "object",
                                            "description": "A model containing information about amount debited from Xsolla balance.",
                                            "properties": {
                                                "amount": {
                                                    "format": "double",
                                                    "description": "Amount.",
                                                    "type": "number"
                                                },
                                                "currency": {
                                                    "description": "Currency. Three-letter currency code per ISO 4217.",
                                                    "type": "string"
                                                }
                                            }
                                        },
                                        "description": "A model containing information about amount debited from Xsolla balance."
                                    },
                                    "xsolla_fee": {
                                        "$ref": {
                                            "type": "object",
                                            "description": "A model containing information about Xsolla Fee",
                                            "properties": {
                                                "amount": {
                                                    "format": "double",
                                                    "description": "Amount.",
                                                    "type": "number"
                                                },
                                                "currency": {
                                                    "description": "Currency. Three-letter currency code per ISO 4217.",
                                                    "type": "string"
                                                }
                                            }
                                        },
                                        "description": "A model containing information about Xsolla Fee"
                                    }
                                }
                            },
                            "description": "Payment details (object)."
                        },
                        "notification_type": {
                            "description": "Type of notification.",
                            "type": "string"
                        },
                        "purchase": {
                            "$ref": {
                                "type": "object",
                                "description": "Object containing purchase details.",
                                "properties": {
                                    "virtual_items": {
                                        "$ref": {
                                            "type": "object",
                                            "description": "A model containing information about the virtual items in purchase.",
                                            "properties": {
                                                "items": {
                                                    "items": {
                                                        "$ref": {
                                                            "type": "object",
                                                            "description": "Item data",
                                                            "properties": {
                                                                "sku": {
                                                                    "description": "Item ID.",
                                                                    "type": "string"
                                                                },
                                                                "amount": {
                                                                    "format": "int32",
                                                                    "description": "Item quantity.",
                                                                    "type": "integer"
                                                                }
                                                            }
                                                        }
                                                    },
                                                    "type": "array",
                                                    "description": "Item data (array)."
                                                },
                                                "currency": {
                                                    "description": "Currency of the purchase. Three-letter currency code per ISO 4217.",
                                                    "type": "string"
                                                },
                                                "amount": {
                                                    "format": "double",
                                                    "description": "Purchase amount.",
                                                    "type": "number"
                                                }
                                            }
                                        },
                                        "description": "Object with data about the virtual items in purchase."
                                    },
                                    "virtual_currency": {
                                        "$ref": {
                                            "type": "object",
                                            "description": "Virtual currency to purchase (object).",
                                            "properties": {
                                                "currency": {
                                                    "description": "Currency of the purchase. Three-letter currency code per ISO 4217.",
                                                    "type": "string"
                                                },
                                                "name": {
                                                    "description": "Virtual currency name.",
                                                    "type": "string"
                                                },
                                                "amount": {
                                                    "format": "double",
                                                    "description": "Price in real currency.",
                                                    "type": "number"
                                                },
                                                "sku": {
                                                    "description": "Virtual currency package SKU (if set for the virtual currency package).",
                                                    "type": "string"
                                                },
                                                "quantity": {
                                                    "format": "int32",
                                                    "description": "Quantity.",
                                                    "type": "integer"
                                                }
                                            }
                                        },
                                        "description": "Virtual currency to purchase (object)."
                                    },
                                    "checkout": {
                                        "$ref": {
                                            "type": "object",
                                            "description": "Total price of Checkout (object).",
                                            "properties": {
                                                "amount": {
                                                    "format": "double",
                                                    "description": "Price.",
                                                    "type": "number"
                                                },
                                                "currency": {
                                                    "description": "Currency of the purchase. Three-letter currency code per ISO 4217.",
                                                    "type": "string"
                                                }
                                            }
                                        },
                                        "description": "Object with data about the checkout."
                                    },
                                    "subscription": {
                                        "$ref": {
                                            "type": "object",
                                            "description": "Subscription request (object).",
                                            "properties": {
                                                "currency": {
                                                    "description": "Currency of the purchase. Three-letter currency code per ISO 4217.",
                                                    "type": "string"
                                                },
                                                "plan_id": {
                                                    "description": "Plan ID.",
                                                    "type": "string"
                                                },
                                                "subscription_id": {
                                                    "format": "int64",
                                                    "description": "Subscription ID.",
                                                    "type": "integer"
                                                },
                                                "date_next_charge": {
                                                    "format": "date-time",
                                                    "description": "Date of ending subscription.",
                                                    "type": "string"
                                                },
                                                "product_id": {
                                                    "description": "Product ID.",
                                                    "type": "string"
                                                },
                                                "amount": {
                                                    "format": "double",
                                                    "description": "Price.",
                                                    "type": "number"
                                                },
                                                "date_create": {
                                                    "format": "date-time",
                                                    "description": "Date of creation.",
                                                    "type": "string"
                                                }
                                            }
                                        },
                                        "description": "Object with data about the subscription in purchase."
                                    },
                                    "total": {
                                        "$ref": {
                                            "type": "object",
                                            "description": "Total price of purchase (object).",
                                            "properties": {
                                                "amount": {
                                                    "format": "double",
                                                    "description": "Price.",
                                                    "type": "number"
                                                },
                                                "currency": {
                                                    "description": "Currency of the purchase. Three-letter currency code per ISO 4217.",
                                                    "type": "string"
                                                }
                                            }
                                        },
                                        "description": "Total price of purchase (object). Required."
                                    }
                                }
                            },
                            "description": "Object containing purchase details."
                        },
                        "user": {
                            "$ref": {
                                "type": "object",
                                "description": "User details (object)",
                                "properties": {
                                    "country": {
                                        "description": "User country. ISO 3166 country code.",
                                        "type": "string"
                                    },
                                    "id": {
                                        "description": "User ID. Required.",
                                        "type": "string"
                                    },
                                    "phone": {
                                        "description": "User phone.",
                                        "type": "string"
                                    },
                                    "email": {
                                        "description": "User email.",
                                        "type": "string"
                                    },
                                    "ip": {
                                        "description": "User IP address.",
                                        "type": "string"
                                    }
                                }
                            },
                            "description": "User details (object)"
                        },
                        "refund_details": {
                            "$ref": {
                                "type": "object",
                                "description": "Refund details (object).",
                                "properties": {
                                    "reason": {
                                        "description": "Reason.",
                                        "type": "string"
                                    },
                                    "code": {
                                        "format": "int32",
                                        "description": "Refund code.",
                                        "type": "integer"
                                    }
                                }
                            },
                            "description": "Refund details (object)."
                        },
                        "custom_parameters": {
                            "$ref": {
                                "type": "object",
                                "description": "Custom Parameters provided as part of request to the webhook endpoint\r\nMust be kept in sync with {!:Roblox.Billing.Client.Model.XsollaPaymentUiTokenRequestModel}",
                                "properties": {
                                    "upsell_product": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "checkout_session_id": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "user_agent": {
                                        "type": "string"
                                    },
                                    "main_product": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "account_id": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "user_id": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "payment_method": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "currency": {
                                        "type": "string"
                                    },
                                    "total_price": {
                                        "type": "number",
                                        "format": "double"
                                    },
                                    "price_country_id": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "ip_address": {
                                        "type": "string"
                                    },
                                    "main_product_price": {
                                        "type": "number",
                                        "format": "double"
                                    },
                                    "transaction_time": {
                                        "type": "string",
                                        "format": "date-time"
                                    },
                                    "upsell_product_price": {
                                        "type": "number",
                                        "format": "double"
                                    }
                                }
                            },
                            "description": "Custom Parameters (object)"
                        },
                        "subscription": {
                            "$ref": {
                                "type": "object",
                                "description": "Subscription request (object).",
                                "properties": {
                                    "currency": {
                                        "description": "Currency of the purchase. Three-letter currency code per ISO 4217.",
                                        "type": "string"
                                    },
                                    "plan_id": {
                                        "description": "Plan ID.",
                                        "type": "string"
                                    },
                                    "subscription_id": {
                                        "format": "int64",
                                        "description": "Subscription ID.",
                                        "type": "integer"
                                    },
                                    "date_next_charge": {
                                        "format": "date-time",
                                        "description": "Date of ending subscription.",
                                        "type": "string"
                                    },
                                    "product_id": {
                                        "description": "Product ID.",
                                        "type": "string"
                                    },
                                    "amount": {
                                        "format": "double",
                                        "description": "Price.",
                                        "type": "number"
                                    },
                                    "date_create": {
                                        "format": "date-time",
                                        "description": "Date of creation.",
                                        "type": "string"
                                    }
                                }
                            },
                            "description": "Subscription details (object)"
                        },
                        "transaction": {
                            "$ref": {
                                "type": "object",
                                "description": "Transaction details (object). Required.",
                                "properties": {
                                    "payment_method": {
                                        "format": "int32",
                                        "description": "Payment method identifier.",
                                        "type": "integer"
                                    },
                                    "dry_run": {
                                        "format": "int32",
                                        "description": "Test transaction.",
                                        "type": "integer"
                                    },
                                    "id": {
                                        "format": "int32",
                                        "description": "Transaction ID.",
                                        "type": "integer"
                                    },
                                    "external_id": {
                                        "description": "Transaction external ID.",
                                        "type": "string"
                                    },
                                    "payment_date": {
                                        "format": "date-time",
                                        "description": "Date of payment.",
                                        "type": "string"
                                    }
                                }
                            },
                            "description": "Transaction details (object)."
                        }
                    }
                }
            },
            "description": "Xsolla notification model that contains the information about the webhook."
        }
    },
    "Responses": {
        "200": {
            "description": "",
            "schema": {
                "$ref": {
                    "properties": {
                    },
                    "type": "object"
                }
            }
        },
        "400": {
            "description": "Service was unable to validate the request is coming from Xsolla."
        }
    },
}
```
<hr>


## /v1/google/validate
```json
{
    "Method": "POST",
    "Description": "Validate a ProductId before making a purchase.",
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
            "name": "validateModel",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A model containing information about validation",
                    "properties": {
                        "currency": {
                            "description": "Currency Code e.g. \"USD\", \"PHP\", \"CAD\"",
                            "type": "string"
                        },
                        "productId": {
                            "description": "Internal Product Id",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "Product Id for example: com.roblox.client.bc1month, com.roblox.client.tbc1month, ..."
        }
    },
    "Responses": {
        "403": {
            "description": "Unauthorized to make request. XSRF token is needed.\r\n0: Token Validation Failed"
        },
        "400": {
            "description": "Service has thrown an unknown exception."
        },
        "401": {
            "description": "Unauthorized to make request. Auth cookie is needed\r\n0: Authorization has been denied for this request."
        },
        "200": {
            "description": "",
            "schema": {
                "$ref": {
                    "properties": {
                    },
                    "type": "object"
                }
            }
        },
        "503": {
            "description": "Service has been turned off. Header response will include Retry-After in seconds."
        },
        "429": {
            "description": "Service has been rate limited to user."
        },
        "404": {
            "description": "{validateModel} is invalid."
        }
    },
}
```
<hr>


## /v1/payments/vantiv/checkout
```json
{
    "Method": "POST",
    "Description": "Submit Vantiv payment",
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
            "name": "vantivPaymentRequest",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Metadata response model for Vantiv Payment page",
                    "properties": {
                        "maskedCreditCardInfoModel": {
                            "$ref": {
                                "type": "object",
                                "description": "Metadata response model for Vantiv MaskedCreditCardInfoModel",
                                "properties": {
                                    "expirationMonth": {
                                        "format": "int32",
                                        "description": "Expiration month\r\n[Range(1, 12)]",
                                        "type": "integer"
                                    },
                                    "lastFour": {
                                        "description": "Last four\r\n[RegularExpression(@\"\d{4}\")]",
                                        "type": "string"
                                    },
                                    "expirationYear": {
                                        "format": "int32",
                                        "description": "Expiration year",
                                        "type": "integer"
                                    },
                                    "firstSix": {
                                        "description": "First six\r\n[RegularExpression(@\"\d{6}\")]",
                                        "type": "string"
                                    }
                                }
                            },
                            "description": "Masked Credit Card Info Model"
                        },
                        "lastName": {
                            "description": "Countries",
                            "type": "string"
                        },
                        "address1": {
                            "description": "Address 1:",
                            "type": "string"
                        },
                        "firstName": {
                            "description": "First Name",
                            "type": "string"
                        },
                        "kountSessionIdentifier": {
                            "type": "string"
                        },
                        "zip": {
                            "description": "Zip",
                            "type": "string"
                        },
                        "mainProduct": {
                            "$ref": {
                                "type": "object",
                                "description": "Product model",
                                "properties": {
                                    "expectedPrice": {
                                        "format": "double",
                                        "description": "Expected price",
                                        "type": "number"
                                    },
                                    "productId": {
                                        "format": "int32",
                                        "description": "Product Id",
                                        "type": "integer"
                                    }
                                }
                            },
                            "description": "Main product"
                        },
                        "paypageRegistrationId": {
                            "description": "PaypageRegistrationId",
                            "type": "string"
                        },
                        "phone": {
                            "description": "Phone",
                            "type": "string"
                        },
                        "email": {
                            "description": "Email",
                            "type": "string"
                        },
                        "state": {
                            "description": "State, only validate when Country is US, it will happen in the UpgradesControllers",
                            "type": "string"
                        },
                        "upsellProduct": {
                            "$ref": {
                                "type": "object",
                                "description": "Product model",
                                "properties": {
                                    "expectedPrice": {
                                        "format": "double",
                                        "description": "Expected price",
                                        "type": "number"
                                    },
                                    "productId": {
                                        "format": "int32",
                                        "description": "Product Id",
                                        "type": "integer"
                                    }
                                }
                            },
                            "description": "UpsellProduct"
                        },
                        "isDoublePurchaseConfirmed": {
                            "description": "IsDoublePurchaseConfirmed",
                            "type": "boolean"
                        },
                        "address2": {
                            "description": "Address 2:",
                            "type": "string"
                        },
                        "expectedPrice": {
                            "format": "double",
                            "description": "ExpectedPrice",
                            "type": "number"
                        },
                        "country": {
                            "description": "Country",
                            "type": "string"
                        },
                        "city": {
                            "description": "City",
                            "type": "string"
                        },
                        "vantivThreatMetrixIdentifier": {
                            "type": "string"
                        }
                    }
                }
            },
            "description": "submit payment with user credit infomation"
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Metadata response model for Vantiv Payment page",
                    "properties": {
                        "redirectLink": {
                            "description": "Redirection link",
                            "type": "string"
                        },
                        "errorMessage": {
                            "description": "ErrorMessage",
                            "type": "string"
                        },
                        "isSuccess": {
                            "description": "IsSuccess",
                            "type": "boolean"
                        },
                        "viewModel": {
                            "$ref": {
                                "type": "object",
                                "description": "View Model for Vantiv Payment page",
                                "properties": {
                                    "vantivThreatMetrixSessionId": {
                                        "description": "VantivThreatMetrixSessionId",
                                        "type": "string"
                                    },
                                    "selectedUpsellProductId": {
                                        "format": "int32",
                                        "description": "Selected upsell product Id",
                                        "type": "integer"
                                    },
                                    "dataViewModel": {
                                        "$ref": {
                                            "type": "object",
                                            "description": "A model containing payment data",
                                            "properties": {
                                                "currencyTypeId": {
                                                    "format": "int32",
                                                    "description": "CurrencyTypeId",
                                                    "type": "integer"
                                                },
                                                "currency": {
                                                    "$ref": {
                                                        "properties": {
                                                            "Id": {
                                                                "format": "int32",
                                                                "readOnly": true,
                                                                "type": "integer"
                                                            },
                                                            "CurrencyName": {
                                                                "readOnly": true,
                                                                "type": "string"
                                                            },
                                                            "CurrencyType": {
                                                                "enum": {
                                                                    "1": "USD",
                                                                    "2": "CAD",
                                                                    "3": "GBP",
                                                                    "4": "EUR",
                                                                    "5": "DZD",
                                                                    "6": "AUD",
                                                                    "7": "BDT",
                                                                    "8": "BOB",
                                                                    "9": "BRL",
                                                                    "10": "BGN",
                                                                    "11": "CLP",
                                                                    "12": "CNY",
                                                                    "13": "COP",
                                                                    "14": "CRC",
                                                                    "15": "HRK",
                                                                    "16": "CZK",
                                                                    "17": "DKK",
                                                                    "18": "EGP",
                                                                    "19": "GHS",
                                                                    "20": "HKD",
                                                                    "21": "HUF",
                                                                    "22": "INR",
                                                                    "23": "IDR",
                                                                    "24": "ILS",
                                                                    "25": "JPY",
                                                                    "26": "KZT",
                                                                    "27": "KES",
                                                                    "28": "LBP",
                                                                    "29": "MOP",
                                                                    "30": "MYR",
                                                                    "31": "MXN",
                                                                    "32": "MAD",
                                                                    "33": "NZD",
                                                                    "34": "NGN",
                                                                    "35": "NOK",
                                                                    "36": "PKR",
                                                                    "37": "PEN",
                                                                    "38": "PHP",
                                                                    "39": "PLN",
                                                                    "40": "QAR",
                                                                    "41": "RON",
                                                                    "42": "RUB",
                                                                    "43": "SAR",
                                                                    "44": "SGD",
                                                                    "45": "ZAR",
                                                                    "46": "KRW",
                                                                    "47": "LKR",
                                                                    "48": "SEK",
                                                                    "49": "CHF",
                                                                    "50": "TWD",
                                                                    "51": "TZS",
                                                                    "52": "THB",
                                                                    "53": "TRY",
                                                                    "54": "UAH",
                                                                    "55": "AED",
                                                                    "56": "VND"
                                                                },
                                                                "readOnly": true,
                                                                "type": "string"
                                                            },
                                                            "CurrencySymbol": {
                                                                "readOnly": true,
                                                                "type": "string"
                                                            }
                                                        },
                                                        "type": "object"
                                                    },
                                                    "description": "Currency"
                                                },
                                                "isDesktopLocalPricingEnabled": {
                                                    "description": "Is desktop local pricing enabled",
                                                    "type": "boolean"
                                                },
                                                "countryCurrencyTypeId": {
                                                    "format": "int32",
                                                    "description": "Country Currency Type Id",
                                                    "type": "integer"
                                                },
                                                "selectedProductPrice": {
                                                    "format": "double",
                                                    "description": "SelectedProductPrice",
                                                    "type": "number"
                                                }
                                            }
                                        },
                                        "description": "Data view model"
                                    },
                                    "paymentProviderType": {
                                        "enum": {
                                            "1": "AppleAppStore",
                                            "2": "Boku",
                                            "3": "Check",
                                            "4": "Credit",
                                            "5": "PayPalCreditCard",
                                            "6": "GooglePlayStore",
                                            "7": "InComm",
                                            "8": "Mail",
                                            "9": "Paypal",
                                            "10": "Rixty",
                                            "11": "RixtyPin",
                                            "12": "LiveGamer",
                                            "13": "RobloxGiveaway",
                                            "14": "AmazonStore",
                                            "15": "XboxStore",
                                            "16": "Wallie",
                                            "17": "WindowsStore",
                                            "18": "VantivToken",
                                            "19": "XsollaOXXO",
                                            "20": "XsollaBoleto",
                                            "21": "XsollaSOFORT",
                                            "22": "XsollaPaysafe",
                                            "23": "XsollaCreditDebitCards",
                                            "24": "XsollaAmazonPay",
                                            "25": "XsollaPayPal",
                                            "26": "XsollaOther",
                                            "27": "MidasWeChatDesktop",
                                            "28": "MidasWeChatAndroid",
                                            "29": "MidasWeChatApple",
                                            "30": "XsollaKoreaCreditDebitCards",
                                            "31": "Undefined"
                                        },
                                        "description": "Payment provider type",
                                        "type": "string"
                                    },
                                    "kountSessionId": {
                                        "description": "KountSessionId",
                                        "type": "string"
                                    },
                                    "userBillingInfo": {
                                        "$ref": {
                                            "type": "object",
                                            "description": "View Model for user section",
                                            "properties": {
                                                "country": {
                                                    "description": "Country",
                                                    "type": "string"
                                                },
                                                "phone": {
                                                    "description": "Phone",
                                                    "type": "string"
                                                },
                                                "lastName": {
                                                    "description": "Countries",
                                                    "type": "string"
                                                },
                                                "address1": {
                                                    "description": "Address 1:",
                                                    "type": "string"
                                                },
                                                "firstName": {
                                                    "description": "First Name",
                                                    "type": "string"
                                                },
                                                "countries": {
                                                    "items": {
                                                        "$ref": {
                                                            "type": "object",
                                                            "description": "A model containing information about Country",
                                                            "properties": {
                                                                "isSelected": {
                                                                    "description": "IsSelected",
                                                                    "type": "boolean"
                                                                },
                                                                "name": {
                                                                    "description": "Name",
                                                                    "type": "string"
                                                                },
                                                                "code": {
                                                                    "description": "Code",
                                                                    "type": "string"
                                                                }
                                                            }
                                                        }
                                                    },
                                                    "type": "array",
                                                    "description": "Countries"
                                                },
                                                "address2": {
                                                    "description": "Address 2:",
                                                    "type": "string"
                                                },
                                                "email": {
                                                    "description": "Email",
                                                    "type": "string"
                                                },
                                                "zip": {
                                                    "description": "Zip",
                                                    "type": "string"
                                                },
                                                "state": {
                                                    "description": "State, only validate when Country is US, it will happen in the UpgradesControllers",
                                                    "type": "string"
                                                },
                                                "city": {
                                                    "description": "City",
                                                    "type": "string"
                                                }
                                            }
                                        },
                                        "description": "User Section Info"
                                    },
                                    "kountNoIFrameEnabled": {
                                        "description": "KountNoIFrameEnabled",
                                        "type": "boolean"
                                    },
                                    "selectedProduct": {
                                        "$ref": {
                                            "properties": {
                                                "IsDisabled": {
                                                    "type": "boolean"
                                                },
                                                "Expiration": {
                                                    "type": "string",
                                                    "format": "date-time"
                                                },
                                                "Price": {
                                                    "type": "number",
                                                    "format": "double"
                                                },
                                                "PriceText": {
                                                    "type": "string"
                                                },
                                                "ImageFile": {
                                                    "type": "string"
                                                },
                                                "RenewOrExpireText": {
                                                    "type": "string"
                                                },
                                                "IsRenewable": {
                                                    "type": "boolean"
                                                },
                                                "PremiumFeatureId": {
                                                    "type": "integer",
                                                    "format": "int32"
                                                },
                                                "Name": {
                                                    "type": "string"
                                                },
                                                "ProductId": {
                                                    "type": "integer",
                                                    "format": "int32"
                                                },
                                                "IsCurrentPremiumFeature": {
                                                    "type": "boolean"
                                                },
                                                "GiftcardShoppingCartProductId": {
                                                    "type": "integer",
                                                    "format": "int64"
                                                },
                                                "DurationTitle": {
                                                    "type": "string"
                                                },
                                                "Rank": {
                                                    "type": "string",
                                                    "enum": {
                                                        "1": "None",
                                                        "2": "BC",
                                                        "3": "TBC",
                                                        "4": "OBC"
                                                    }
                                                }
                                            },
                                            "type": "object"
                                        },
                                        "description": "Selected product"
                                    },
                                    "isVantivThreatMetrixEnabled": {
                                        "description": "IsVantivThreatMetrixEnabled",
                                        "type": "boolean"
                                    },
                                    "isKountEnabled": {
                                        "description": "IsKountEnabled",
                                        "type": "boolean"
                                    },
                                    "robuxBcBonus": {
                                        "format": "int32",
                                        "description": "Robux Bc bonus",
                                        "type": "integer"
                                    },
                                    "vantivIframeViewModel": {
                                        "$ref": {
                                            "type": "object",
                                            "description": "Metadata response model for Vantiv Iframe",
                                            "properties": {
                                                "paypageRegistrationId": {
                                                    "description": "PaypageRegistrationId",
                                                    "type": "string"
                                                },
                                                "eprotectId": {
                                                    "type": "string",
                                                    "description": "Gets the unique eProtect identifier assigned from Vantiv.",
                                                    "readOnly": true
                                                },
                                                "maskedCreditCardInfoModel": {
                                                    "$ref": {
                                                        "type": "object",
                                                        "description": "Metadata response model for Vantiv MaskedCreditCardInfoModel",
                                                        "properties": {
                                                            "expirationMonth": {
                                                                "format": "int32",
                                                                "description": "Expiration month\r\n[Range(1, 12)]",
                                                                "type": "integer"
                                                            },
                                                            "lastFour": {
                                                                "description": "Last four\r\n[RegularExpression(@\"\d{4}\")]",
                                                                "type": "string"
                                                            },
                                                            "expirationYear": {
                                                                "format": "int32",
                                                                "description": "Expiration year",
                                                                "type": "integer"
                                                            },
                                                            "firstSix": {
                                                                "description": "First six\r\n[RegularExpression(@\"\d{6}\")]",
                                                                "type": "string"
                                                            }
                                                        }
                                                    },
                                                    "description": "maskedCreditCardInfoModel"
                                                },
                                                "reportGroup": {
                                                    "type": "string",
                                                    "description": "Gets the report group that under which this transaction will be displayed in Vantiv iQ Reporting and Analytics.",
                                                    "readOnly": true
                                                },
                                                "timeoutInMilliseconds": {
                                                    "readOnly": true,
                                                    "format": "int32",
                                                    "description": "Gets the number of milliseconds before a transaction times out and the timeout callback is invoked.",
                                                    "type": "integer"
                                                },
                                                "orderId": {
                                                    "type": "string",
                                                    "description": "Gets the merchant-assigned value representing the order. Max length is 25 characters.",
                                                    "readOnly": true
                                                },
                                                "cssFilename": {
                                                    "type": "string",
                                                    "description": "Gets the style sheet filename excluding the \".css\".",
                                                    "readOnly": true
                                                },
                                                "eprotectClientJsSource": {
                                                    "type": "string",
                                                    "description": "Gets the eprotect client javascript source.",
                                                    "readOnly": true
                                                }
                                            }
                                        },
                                        "description": "VantivIframeViewModel"
                                    },
                                    "isIframeLoadingForVantivEnabled": {
                                        "description": "IsIframeLoadingForVantivEnabled",
                                        "type": "boolean"
                                    },
                                    "creditCard": {
                                        "$ref": {
                                            "properties": {
                                                "Number": {
                                                    "type": "string"
                                                },
                                                "CardType": {
                                                    "type": "string",
                                                    "enum": {
                                                        "1": "Visa",
                                                        "2": "MasterCard",
                                                        "3": "Discover",
                                                        "4": "AmericanExpress"
                                                    }
                                                },
                                                "ExpirationMonth": {
                                                    "type": "string"
                                                },
                                                "ExpirationYear": {
                                                    "type": "string"
                                                },
                                                "SecurityCode": {
                                                    "type": "string"
                                                }
                                            },
                                            "type": "object"
                                        },
                                        "description": "CreditCard"
                                    },
                                    "vantivThreatMetrixScriptUrl": {
                                        "description": "VantivThreatMetrixScriptUrl",
                                        "type": "string"
                                    },
                                    "selectedProductBcVersion": {
                                        "$ref": {
                                            "properties": {
                                                "IsDisabled": {
                                                    "type": "boolean"
                                                },
                                                "Expiration": {
                                                    "type": "string",
                                                    "format": "date-time"
                                                },
                                                "Price": {
                                                    "type": "number",
                                                    "format": "double"
                                                },
                                                "PriceText": {
                                                    "type": "string"
                                                },
                                                "ImageFile": {
                                                    "type": "string"
                                                },
                                                "RenewOrExpireText": {
                                                    "type": "string"
                                                },
                                                "IsRenewable": {
                                                    "type": "boolean"
                                                },
                                                "PremiumFeatureId": {
                                                    "type": "integer",
                                                    "format": "int32"
                                                },
                                                "Name": {
                                                    "type": "string"
                                                },
                                                "ProductId": {
                                                    "type": "integer",
                                                    "format": "int32"
                                                },
                                                "IsCurrentPremiumFeature": {
                                                    "type": "boolean"
                                                },
                                                "GiftcardShoppingCartProductId": {
                                                    "type": "integer",
                                                    "format": "int64"
                                                },
                                                "DurationTitle": {
                                                    "type": "string"
                                                },
                                                "Rank": {
                                                    "type": "string",
                                                    "enum": {
                                                        "1": "None",
                                                        "2": "BC",
                                                        "3": "TBC",
                                                        "4": "OBC"
                                                    }
                                                }
                                            },
                                            "type": "object"
                                        },
                                        "description": "Selected Bc version product"
                                    },
                                    "kountScriptSDKUrl": {
                                        "description": "KountScriptSDKUrl",
                                        "type": "string"
                                    },
                                    "iframeLoadingTimeOutForVantiv": {
                                        "format": "int32",
                                        "description": "IframeLoadingTimeOutForVantiv",
                                        "type": "integer"
                                    },
                                    "kountUrl": {
                                        "description": "KountUrl",
                                        "type": "string"
                                    },
                                    "doublePurchaseConfirmed": {
                                        "description": "DoublePurchaseConfirmed",
                                        "type": "boolean"
                                    },
                                    "vantivThreatMetrixIframeUrl": {
                                        "description": "VantivThreatMetrixIframeUrl",
                                        "type": "string"
                                    },
                                    "vantivPaymentAbTestVariationValue": {
                                        "format": "int32",
                                        "description": "VantivPaymentAbTestVariationValue",
                                        "type": "integer"
                                    },
                                    "displayDoublePurchase": {
                                        "description": "DisplayDoublePurchase",
                                        "type": "boolean"
                                    }
                                }
                            },
                            "description": "View model"
                        }
                    }
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


## /v1/payments/xsolla/incrementcounterbyagent
```json
{
    "Method": "POST",
    "Description": "increment a counter based on user agent",
    "Consumes": "NONE",
    "Produces": "NONE",
    "Parameters": {
        "1": {
            "in": "query",
            "type": "string",
            "name": "counterPrefix",
            "required": true,
            "description": ""
        }
    },
    "Responses": {
        "204": {
            "description": "No Content"
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


