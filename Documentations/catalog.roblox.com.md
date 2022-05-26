# <b>Catalog Api v1</b>

## /v1/favorites/assets/{assetId}/count
```json
{
    "Method": "GET",
    "Description": "Gets the favorite count for the given asset Id.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "assetId",
            "format": "int64",
            "required": true
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "type": "integer",
                "format": "int64"
            }
        },
        "400": {
            "description": "2: Invalid asset Id."
        }
    },
}
```
<hr>


## /v1/assets/{assetId}/bundles
```json
{
    "Method": "GET",
    "Description": "Lists the bundles a particular asset belongs to. Use the Id of the last bundle in the response to get the next page.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "assetId",
            "format": "int64",
            "required": true
        },
        "2": {
            "in": "query",
            "type": "string",
            "default": "Asc",
            "enum": {
                "1": "Asc",
                "2": "Desc"
            },
            "description": "The order the results are sorted in.",
            "name": "sortOrder",
        },
        "3": {
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
        "4": {
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
                                        "bundleType": {
                                            "readOnly": true,
                                            "type": "string"
                                        },
                                        "name": {
                                            "readOnly": true,
                                            "type": "string"
                                        },
                                        "description": {
                                            "readOnly": true,
                                            "type": "string"
                                        },
                                        "id": {
                                            "format": "int64",
                                            "readOnly": true,
                                            "type": "integer"
                                        },
                                        "items": {
                                            "items": {
                                                "$ref": {
                                                    "properties": {
                                                        "owned": {
                                                            "readOnly": true,
                                                            "type": "boolean"
                                                        },
                                                        "type": {
                                                            "readOnly": true,
                                                            "type": "string"
                                                        },
                                                        "name": {
                                                            "readOnly": true,
                                                            "type": "string"
                                                        },
                                                        "id": {
                                                            "format": "int64",
                                                            "readOnly": true,
                                                            "type": "integer"
                                                        }
                                                    },
                                                    "type": "object"
                                                }
                                            },
                                            "type": "array",
                                            "readOnly": true
                                        },
                                        "creator": {
                                            "$ref": {
                                                "properties": {
                                                    "id": {
                                                        "format": "int64",
                                                        "readOnly": true,
                                                        "type": "integer"
                                                    },
                                                    "type": {
                                                        "readOnly": true,
                                                        "type": "string"
                                                    },
                                                    "name": {
                                                        "readOnly": true,
                                                        "type": "string"
                                                    }
                                                },
                                                "type": "object"
                                            },
                                            "readOnly": true
                                        },
                                        "product": {
                                            "$ref": {
                                                "properties": {
                                                    "isPublicDomain": {
                                                        "type": "boolean"
                                                    },
                                                    "type": {
                                                        "type": "string"
                                                    },
                                                    "isFree": {
                                                        "type": "boolean"
                                                    },
                                                    "isForSale": {
                                                        "type": "boolean"
                                                    },
                                                    "id": {
                                                        "type": "integer",
                                                        "format": "int64"
                                                    },
                                                    "priceInRobux": {
                                                        "type": "integer",
                                                        "format": "int64"
                                                    },
                                                    "noPriceText": {
                                                        "type": "string"
                                                    },
                                                    "premiumPricing": {
                                                        "$ref": {
                                                            "type": "object",
                                                            "description": "Defines the Premium pricing for a catalog item",
                                                            "properties": {
                                                                "premiumDiscountPercentage": {
                                                                    "format": "int32",
                                                                    "description": "The Premium discount percentage for a catalog item",
                                                                    "type": "integer"
                                                                },
                                                                "premiumPriceInRobux": {
                                                                    "format": "int64",
                                                                    "description": "The Premium price for a catalog item",
                                                                    "type": "integer"
                                                                }
                                                            }
                                                        }
                                                    }
                                                },
                                                "type": "object"
                                            },
                                            "readOnly": true
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
        "400": {
            "description": "1: Invalid assetId\r\n4: Invalid Cursor."
        }
    },
}
```
<hr>


## /v1/search/items/details
```json
{
    "Method": "GET",
    "Description": "Search for avatarCatalog items",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "string",
            "name": "model.category",
            "enum": {
                "1": "Accessories",
                "2": "All",
                "3": "AvatarAnimations",
                "4": "BodyParts",
                "5": "Clothing",
                "6": "Collectibles",
                "7": "Featured",
                "8": "Gear",
                "9": "CommunityCreations",
                "10": "Premium",
                "11": "Recommended"
            },
        },
        "2": {
            "in": "query",
            "type": "string",
            "name": "model.subcategory",
            "enum": {
                "1": "Accessories",
                "2": "All",
                "3": "AvatarAnimations",
                "4": "BackAccessories",
                "5": "BodyParts",
                "6": "Clothing",
                "7": "Collectibles",
                "8": "FaceAccessories",
                "9": "Faces",
                "10": "Featured",
                "11": "FrontAccessories",
                "12": "Gear",
                "13": "HairAccessories",
                "14": "Hats",
                "15": "Heads",
                "16": "NeckAccessories",
                "17": "Pants",
                "18": "Shirts",
                "19": "ShoulderAccessories",
                "20": "Tshirts",
                "21": "WaistAccessories",
                "22": "Bundles",
                "23": "AnimationBundles",
                "24": "EmoteAnimations",
                "25": "CommunityCreations",
                "26": "Melee",
                "27": "Ranged",
                "28": "Explosive",
                "29": "PowerUp",
                "30": "Navigation",
                "31": "Musical",
                "32": "Social",
                "33": "Building",
                "34": "Transport",
                "35": "Premium",
                "36": "Recommended"
            },
        },
        "3": {
            "in": "query",
            "type": "string",
            "name": "model.sortAggregation",
            "enum": {
                "1": "Past12Hours",
                "2": "PastDay",
                "3": "Past3Days",
                "4": "PastWeek",
                "5": "PastMonth",
                "6": "AllTime"
            },
        },
        "4": {
            "in": "query",
            "type": "string",
            "name": "model.sortCurrency",
            "enum": {
                "1": "All",
                "2": "Robux",
                "3": "Tickets",
                "4": "CustomRobux",
                "5": "CustomTickets",
                "6": "Free"
            },
        },
        "5": {
            "in": "query",
            "type": "array",
            "collectionFormat": "multi",
            "items": {
                "type": "string"
            },
            "name": "model.genres",
        },
        "6": {
            "in": "query",
            "type": "string",
            "name": "model.sortType",
            "enum": {
                "1": "Relevance",
                "2": "Favorited",
                "3": "Sales",
                "4": "Updated",
                "5": "PriceAsc",
                "6": "PriceDesc"
            },
        },
        "7": {
            "in": "query",
            "type": "string",
            "name": "model.creatorType",
            "enum": {
                "1": "User",
                "2": "Group"
            },
        },
        "8": {
            "in": "query",
            "type": "string",
            "name": "model.premiumBenefitFilterType",
            "enum": {
                "1": "None",
                "2": "PremiumDiscountedOnly",
                "3": "PremiumExclusiveOnly"
            },
        },
        "9": {
            "in": "query",
            "type": "integer",
            "name": "model.creatorTargetId",
            "format": "int64",
        },
        "10": {
            "in": "query",
            "type": "string",
            "name": "model.creatorName",
        },
        "11": {
            "in": "query",
            "type": "integer",
            "name": "model.maxPrice",
            "format": "int32",
        },
        "12": {
            "in": "query",
            "type": "integer",
            "name": "model.minPrice",
            "format": "int32",
        },
        "13": {
            "in": "query",
            "type": "string",
            "name": "model.keyword",
        },
        "14": {
            "in": "query",
            "type": "boolean",
            "name": "model.includeNotForSale",
        },
        "15": {
            "in": "query",
            "type": "array",
            "collectionFormat": "multi",
            "items": {
                "type": "string"
            },
            "name": "model.tagNames",
        },
        "16": {
            "in": "query",
            "type": "string",
            "default": "Desc",
            "enum": {
                "1": "Asc",
                "2": "Desc"
            },
            "description": "The order the results are sorted in.",
            "name": "sortOrder",
        },
        "17": {
            "in": "query",
            "type": "integer",
            "default": 10,
            "format": "int32",
            "enum": {
                "1": 10,
                "2": 28,
                "3": 30
            },
            "description": "The amount of results per request.",
            "name": "limit",
        },
        "18": {
            "in": "query",
            "type": "string",
            "name": "cursor",
            "description": "The paging cursor for the previous or next page.",
        }
    },
    "Responses": {
        "403": {
            "description": "7: User is unauthorized."
        },
        "400": {
            "description": "1: Category subcategory selection not supported.\r\n2: Creator id not found.\r\n3: Creator type not found.\r\n4: Genre not found.\r\n5: Sort combination not supported.\r\n6: Invalid price range.\r\n10: StartRequest is invalid."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "ApiPageResponse for catalog search",
                    "properties": {
                        "nextPageCursor": {
                            "type": "string"
                        },
                        "elasticsearchDebugInfo": {
                            "$ref": {
                                "properties": {
                                    "isForceTerminationEnabledByRequest": {
                                        "type": "boolean"
                                    },
                                    "indexName": {
                                        "type": "string"
                                    },
                                    "isFromCache": {
                                        "type": "boolean"
                                    },
                                    "elasticsearchQuery": {
                                        "type": "string"
                                    },
                                    "isTerminatedEarly": {
                                        "type": "boolean"
                                    }
                                },
                                "type": "object"
                            },
                            "description": "Elasticsearch debug info returned from AvatarCatalogSearch service"
                        },
                        "previousPageCursor": {
                            "type": "string"
                        },
                        "keyword": {
                            "description": "Keyword used for search query",
                            "type": "string"
                        },
                        "data": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "The detailed model for catalog items.",
                                    "properties": {
                                        "description": {
                                            "description": "The item description.",
                                            "type": "string"
                                        },
                                        "genres": {
                                            "items": {
                                                "type": "string",
                                                "enum": {
                                                    "1": "All",
                                                    "2": "Tutorial",
                                                    "3": "Scary",
                                                    "4": "TownAndCity",
                                                    "5": "War",
                                                    "6": "Funny",
                                                    "7": "Fantasy",
                                                    "8": "Adventure",
                                                    "9": "SciFi",
                                                    "10": "Pirate",
                                                    "11": "FPS",
                                                    "12": "RPG",
                                                    "13": "Sports",
                                                    "14": "Ninja",
                                                    "15": "WildWest"
                                                }
                                            },
                                            "type": "array",
                                            "description": "The {System.Collections.Generic.IEnumerable`1}, serialized if item has genres."
                                        },
                                        "bundledItems": {
                                            "items": {
                                                "$ref": {
                                                    "properties": {
                                                        "owned": {
                                                            "readOnly": true,
                                                            "type": "boolean"
                                                        },
                                                        "type": {
                                                            "readOnly": true,
                                                            "type": "string"
                                                        },
                                                        "name": {
                                                            "readOnly": true,
                                                            "type": "string"
                                                        },
                                                        "id": {
                                                            "format": "int64",
                                                            "readOnly": true,
                                                            "type": "integer"
                                                        }
                                                    },
                                                    "type": "object"
                                                }
                                            },
                                            "type": "array",
                                            "description": "The {System.Collections.Generic.IEnumerable`1} contained in the bundle, serialized if item is a bundle."
                                        },
                                        "priceStatus": {
                                            "description": "The localized string item status if the item's price should not be displayed.",
                                            "type": "string"
                                        },
                                        "assetType": {
                                            "enum": {
                                                "1": "Image",
                                                "2": "TShirt",
                                                "3": "Audio",
                                                "4": "Mesh",
                                                "5": "Lua",
                                                "6": "HTML",
                                                "7": "Text",
                                                "8": "Hat",
                                                "9": "Place",
                                                "10": "Model",
                                                "11": "Shirt",
                                                "12": "Pants",
                                                "13": "Decal",
                                                "14": "Avatar",
                                                "15": "Head",
                                                "16": "Face",
                                                "17": "Gear",
                                                "18": "Badge",
                                                "19": "GroupEmblem",
                                                "20": "Animation",
                                                "21": "Arms",
                                                "22": "Legs",
                                                "23": "Torso",
                                                "24": "RightArm",
                                                "25": "LeftArm",
                                                "26": "LeftLeg",
                                                "27": "RightLeg",
                                                "28": "Package",
                                                "29": "YouTubeVideo",
                                                "30": "GamePass",
                                                "31": "App",
                                                "32": "Code",
                                                "33": "Plugin",
                                                "34": "SolidModel",
                                                "35": "MeshPart",
                                                "36": "HairAccessory",
                                                "37": "FaceAccessory",
                                                "38": "NeckAccessory",
                                                "39": "ShoulderAccessory",
                                                "40": "FrontAccessory",
                                                "41": "BackAccessory",
                                                "42": "WaistAccessory",
                                                "43": "ClimbAnimation",
                                                "44": "DeathAnimation",
                                                "45": "FallAnimation",
                                                "46": "IdleAnimation",
                                                "47": "JumpAnimation",
                                                "48": "RunAnimation",
                                                "49": "SwimAnimation",
                                                "50": "WalkAnimation",
                                                "51": "PoseAnimation",
                                                "52": "LocalizationTableManifest",
                                                "53": "LocalizationTableTranslation",
                                                "54": "EmoteAnimation",
                                                "55": "Video",
                                                "56": "TexturePack"
                                            },
                                            "description": "The {Roblox.Platform.Assets.AssetType} serialized if item is an asset.",
                                            "type": "string"
                                        },
                                        "productId": {
                                            "format": "int64",
                                            "description": "The product id of corresponding item.",
                                            "type": "integer"
                                        },
                                        "itemRestrictions": {
                                            "items": {
                                                "type": "string",
                                                "enum": {
                                                    "1": "ThirteenPlus",
                                                    "2": "LimitedUnique",
                                                    "3": "Limited",
                                                    "4": "BuildersClub",
                                                    "5": "TurboBuildersClub",
                                                    "6": "OutrageousBuildersClub",
                                                    "7": "Rthro"
                                                }
                                            },
                                            "type": "array",
                                            "description": "The {System.Collections.Generic.IEnumerable`1} if item has {Roblox.Catalog.Api.CatalogItemRestriction}."
                                        },
                                        "itemStatus": {
                                            "items": {
                                                "type": "string",
                                                "enum": {
                                                    "1": "New",
                                                    "2": "Sale",
                                                    "3": "XboxExclusive",
                                                    "4": "AmazonExclusive",
                                                    "5": "GooglePlayExclusive",
                                                    "6": "IosExclusive",
                                                    "7": "SaleTimer"
                                                }
                                            },
                                            "type": "array",
                                            "description": "The {System.Collections.Generic.IEnumerable`1} if item has {Roblox.Catalog.Api.CatalogItemStatus}."
                                        },
                                        "favoriteCount": {
                                            "format": "int64",
                                            "description": "The number of times the item has been favorited.",
                                            "type": "integer"
                                        },
                                        "itemType": {
                                            "enum": {
                                                "1": "Asset",
                                                "2": "Bundle"
                                            },
                                            "description": "The {Roblox.Catalog.Api.CatalogSearchDetailedResponseItem.ItemType} item type.",
                                            "type": "string"
                                        },
                                        "id": {
                                            "format": "int64",
                                            "description": "The Item Id.",
                                            "type": "integer"
                                        },
                                        "creatorTargetId": {
                                            "format": "int64",
                                            "description": "The creator id of the item's creator.",
                                            "type": "integer"
                                        },
                                        "unitsAvailableForConsumption": {
                                            "format": "int64",
                                            "description": "The number of items in stock, only if the item is resellable and is limitedEdition",
                                            "type": "integer"
                                        },
                                        "purchaseCount": {
                                            "format": "int64",
                                            "description": "The number of times the item has been purchased.",
                                            "type": "integer"
                                        },
                                        "bundleType": {
                                            "enum": {
                                                "1": "BodyParts",
                                                "2": "AvatarAnimations"
                                            },
                                            "description": "The {Roblox.Platform.Bundles.Core.BundleType} serialized if item is a bundle.",
                                            "type": "string"
                                        },
                                        "offSaleDeadline": {
                                            "format": "date-time",
                                            "description": "When the item will go off sale, if the item has an off deadline.",
                                            "type": "string"
                                        },
                                        "name": {
                                            "description": "The item name.",
                                            "type": "string"
                                        },
                                        "premiumPricing": {
                                            "$ref": {
                                                "type": "object",
                                                "description": "Defines the Premium pricing for a catalog item",
                                                "properties": {
                                                    "premiumDiscountPercentage": {
                                                        "format": "int32",
                                                        "description": "The Premium discount percentage for a catalog item",
                                                        "type": "integer"
                                                    },
                                                    "premiumPriceInRobux": {
                                                        "format": "int64",
                                                        "description": "The Premium price for a catalog item",
                                                        "type": "integer"
                                                    }
                                                }
                                            },
                                            "description": "The Premium pricing information for the item."
                                        },
                                        "price": {
                                            "format": "int64",
                                            "description": "The item's price.",
                                            "type": "integer"
                                        },
                                        "lowestPrice": {
                                            "format": "int64",
                                            "description": "The item's lowest price, only if the item is resellable and there are resellers.",
                                            "type": "integer"
                                        },
                                        "creatorName": {
                                            "description": "The creator name of the item's creator.",
                                            "type": "string"
                                        },
                                        "creatorType": {
                                            "enum": {
                                                "1": "User",
                                                "2": "Group"
                                            },
                                            "description": "The {Roblox.Catalog.Api.CatalogSearchDetailedResponseItem.CreatorType} of the item's creator.",
                                            "type": "string"
                                        }
                                    }
                                }
                            },
                            "type": "array"
                        }
                    }
                }
            }
        },
        "429": {
            "description": "8: The flood limit has been exceeded."
        },
        "503": {
            "description": "18: Search request timed out"
        }
    },
}
```
<hr>


## /v1/favorites/users/{userId}/bundles/{bundleId}/favorite
```json
{
    "Method": "POST",
    "Description": "Create a favorite for the bundle by the authenticated user.",
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
            "required": true
        },
        "2": {
            "in": "path",
            "type": "integer",
            "name": "bundleId",
            "format": "int64",
            "required": true
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n6: You are not authorized to perform this action."
        },
        "400": {
            "description": "1: Invalid user Id.\r\n2: Invalid bundle Id."
        },
        "409": {
            "description": "3: Bunde is already favorited."
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
            "description": "5: This action was floodchecked. Please try again later."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>

```json
{
    "Method": "DELETE",
    "Description": "Delete favorite for the bundle by the authenticated user.",
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
            "required": true
        },
        "2": {
            "in": "path",
            "type": "integer",
            "name": "bundleId",
            "format": "int64",
            "required": true
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n6: You are not authorized to perform this action."
        },
        "400": {
            "description": "1: Invalid user Id.\r\n2: Invalid bundle Id."
        },
        "409": {
            "description": "4: Bundle is already not favorited."
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
            "description": "5: This action was floodchecked. Please try again later."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>

```json
{
    "Method": "GET",
    "Description": "Gets the favorite model for the bundle and user.",
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
            "required": true
        },
        "2": {
            "in": "path",
            "type": "integer",
            "name": "bundleId",
            "format": "int64",
            "required": true
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A model to represent bundle favorites.",
                    "properties": {
                        "created": {
                            "readOnly": true,
                            "format": "date-time",
                            "description": "The time at which the user favorited the bundle.",
                            "type": "string"
                        },
                        "bundleId": {
                            "readOnly": true,
                            "format": "int64",
                            "description": "The Id of the bundle being favorited.",
                            "type": "integer"
                        },
                        "userId": {
                            "readOnly": true,
                            "format": "int64",
                            "description": "The Id of the user favoriting the bundle.",
                            "type": "integer"
                        }
                    }
                }
            }
        },
        "400": {
            "description": "1: Invalid user Id.\r\n2: Invalid bundle Id."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/bundles/{bundleId}/recommendations
```json
{
    "Method": "GET",
    "Description": "Gets recommendations for a given bundle, bundleId of 0 returns randomized bundles
- Accepts both public and authenticated users",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "bundleId",
            "format": "int64",
            "required": true,
            "description": ""
        },
        "2": {
            "in": "query",
            "type": "integer",
            "name": "numItems",
            "format": "int32",
            "description": "The number of recommended items to return.",
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
                                        "bundleType": {
                                            "readOnly": true,
                                            "type": "string"
                                        },
                                        "name": {
                                            "readOnly": true,
                                            "type": "string"
                                        },
                                        "description": {
                                            "readOnly": true,
                                            "type": "string"
                                        },
                                        "id": {
                                            "format": "int64",
                                            "readOnly": true,
                                            "type": "integer"
                                        },
                                        "items": {
                                            "items": {
                                                "$ref": {
                                                    "properties": {
                                                        "owned": {
                                                            "readOnly": true,
                                                            "type": "boolean"
                                                        },
                                                        "type": {
                                                            "readOnly": true,
                                                            "type": "string"
                                                        },
                                                        "name": {
                                                            "readOnly": true,
                                                            "type": "string"
                                                        },
                                                        "id": {
                                                            "format": "int64",
                                                            "readOnly": true,
                                                            "type": "integer"
                                                        }
                                                    },
                                                    "type": "object"
                                                }
                                            },
                                            "type": "array",
                                            "readOnly": true
                                        },
                                        "creator": {
                                            "$ref": {
                                                "properties": {
                                                    "id": {
                                                        "format": "int64",
                                                        "readOnly": true,
                                                        "type": "integer"
                                                    },
                                                    "type": {
                                                        "readOnly": true,
                                                        "type": "string"
                                                    },
                                                    "name": {
                                                        "readOnly": true,
                                                        "type": "string"
                                                    }
                                                },
                                                "type": "object"
                                            },
                                            "readOnly": true
                                        },
                                        "product": {
                                            "$ref": {
                                                "properties": {
                                                    "isPublicDomain": {
                                                        "type": "boolean"
                                                    },
                                                    "type": {
                                                        "type": "string"
                                                    },
                                                    "isFree": {
                                                        "type": "boolean"
                                                    },
                                                    "isForSale": {
                                                        "type": "boolean"
                                                    },
                                                    "id": {
                                                        "type": "integer",
                                                        "format": "int64"
                                                    },
                                                    "priceInRobux": {
                                                        "type": "integer",
                                                        "format": "int64"
                                                    },
                                                    "noPriceText": {
                                                        "type": "string"
                                                    },
                                                    "premiumPricing": {
                                                        "$ref": {
                                                            "type": "object",
                                                            "description": "Defines the Premium pricing for a catalog item",
                                                            "properties": {
                                                                "premiumDiscountPercentage": {
                                                                    "format": "int32",
                                                                    "description": "The Premium discount percentage for a catalog item",
                                                                    "type": "integer"
                                                                },
                                                                "premiumPriceInRobux": {
                                                                    "format": "int64",
                                                                    "description": "The Premium price for a catalog item",
                                                                    "type": "integer"
                                                                }
                                                            }
                                                        }
                                                    }
                                                },
                                                "type": "object"
                                            },
                                            "readOnly": true
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
        "400": {
            "description": "1: Invalid bundle\r\n2: Error retrieving bundles\r\n3: Error getting bundle recommendations\r\n4: NumItems exceed maximum"
        }
    },
}
```
<hr>


## /v1/catalog/items/{itemId}/details
```json
{
    "Method": "GET",
    "Description": "Returns catalog item details, complete with user ownership and economy information",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "itemId",
            "format": "int64",
            "required": true,
            "description": "long, id of the asset or bundle"
        },
        "2": {
            "in": "query",
            "type": "string",
            "name": "itemType",
            "required": true,
            "description": "String, asset or bundle only"
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "The detailed model for catalog items, complete with economy and ownership info",
                    "properties": {
                        "description": {
                            "description": "The item description.",
                            "type": "string"
                        },
                        "genres": {
                            "items": {
                                "type": "string",
                                "enum": {
                                    "1": "All",
                                    "2": "Tutorial",
                                    "3": "Scary",
                                    "4": "TownAndCity",
                                    "5": "War",
                                    "6": "Funny",
                                    "7": "Fantasy",
                                    "8": "Adventure",
                                    "9": "SciFi",
                                    "10": "Pirate",
                                    "11": "FPS",
                                    "12": "RPG",
                                    "13": "Sports",
                                    "14": "Ninja",
                                    "15": "WildWest"
                                }
                            },
                            "type": "array",
                            "description": "The {System.Collections.Generic.IEnumerable`1}, serialized if item has genres."
                        },
                        "owned": {
                            "description": "Whether item is owned by user",
                            "type": "boolean"
                        },
                        "priceStatus": {
                            "description": "The localized string item status if the item's price should not be displayed.",
                            "type": "string"
                        },
                        "assetType": {
                            "enum": {
                                "1": "Image",
                                "2": "TShirt",
                                "3": "Audio",
                                "4": "Mesh",
                                "5": "Lua",
                                "6": "HTML",
                                "7": "Text",
                                "8": "Hat",
                                "9": "Place",
                                "10": "Model",
                                "11": "Shirt",
                                "12": "Pants",
                                "13": "Decal",
                                "14": "Avatar",
                                "15": "Head",
                                "16": "Face",
                                "17": "Gear",
                                "18": "Badge",
                                "19": "GroupEmblem",
                                "20": "Animation",
                                "21": "Arms",
                                "22": "Legs",
                                "23": "Torso",
                                "24": "RightArm",
                                "25": "LeftArm",
                                "26": "LeftLeg",
                                "27": "RightLeg",
                                "28": "Package",
                                "29": "YouTubeVideo",
                                "30": "GamePass",
                                "31": "App",
                                "32": "Code",
                                "33": "Plugin",
                                "34": "SolidModel",
                                "35": "MeshPart",
                                "36": "HairAccessory",
                                "37": "FaceAccessory",
                                "38": "NeckAccessory",
                                "39": "ShoulderAccessory",
                                "40": "FrontAccessory",
                                "41": "BackAccessory",
                                "42": "WaistAccessory",
                                "43": "ClimbAnimation",
                                "44": "DeathAnimation",
                                "45": "FallAnimation",
                                "46": "IdleAnimation",
                                "47": "JumpAnimation",
                                "48": "RunAnimation",
                                "49": "SwimAnimation",
                                "50": "WalkAnimation",
                                "51": "PoseAnimation",
                                "52": "LocalizationTableManifest",
                                "53": "LocalizationTableTranslation",
                                "54": "EmoteAnimation",
                                "55": "Video",
                                "56": "TexturePack"
                            },
                            "description": "The {Roblox.Platform.Assets.AssetType} serialized if item is an asset.",
                            "type": "string"
                        },
                        "expectedSellerId": {
                            "format": "int64",
                            "description": "Id to pass into economy purchase api\r\nuserID of lowest private seller if resellable\r\nCreator AgentID (deprecated) / CreatorTargetId otherwise",
                            "type": "integer"
                        },
                        "itemRestrictions": {
                            "items": {
                                "type": "string",
                                "enum": {
                                    "1": "ThirteenPlus",
                                    "2": "LimitedUnique",
                                    "3": "Limited",
                                    "4": "BuildersClub",
                                    "5": "TurboBuildersClub",
                                    "6": "OutrageousBuildersClub",
                                    "7": "Rthro"
                                }
                            },
                            "type": "array",
                            "description": "The {System.Collections.Generic.IEnumerable`1} if item has {Roblox.Catalog.Api.CatalogItemRestriction}."
                        },
                        "itemStatus": {
                            "items": {
                                "type": "string",
                                "enum": {
                                    "1": "New",
                                    "2": "Sale",
                                    "3": "XboxExclusive",
                                    "4": "AmazonExclusive",
                                    "5": "GooglePlayExclusive",
                                    "6": "IosExclusive",
                                    "7": "SaleTimer"
                                }
                            },
                            "type": "array",
                            "description": "The {System.Collections.Generic.IEnumerable`1} if item has {Roblox.Catalog.Api.CatalogItemStatus}."
                        },
                        "productId": {
                            "format": "int64",
                            "description": "The product id of corresponding item.",
                            "type": "integer"
                        },
                        "isPurchasable": {
                            "description": "Whether item can be purchased",
                            "type": "boolean"
                        },
                        "price": {
                            "format": "int64",
                            "description": "The item's price.",
                            "type": "integer"
                        },
                        "favoriteCount": {
                            "format": "int64",
                            "description": "The number of times the item has been favorited.",
                            "type": "integer"
                        },
                        "isForRent": {
                            "description": "whether item is available for rent",
                            "type": "boolean"
                        },
                        "bundledItems": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "owned": {
                                            "readOnly": true,
                                            "type": "boolean"
                                        },
                                        "type": {
                                            "readOnly": true,
                                            "type": "string"
                                        },
                                        "name": {
                                            "readOnly": true,
                                            "type": "string"
                                        },
                                        "id": {
                                            "format": "int64",
                                            "readOnly": true,
                                            "type": "integer"
                                        }
                                    },
                                    "type": "object"
                                }
                            },
                            "type": "array",
                            "description": "The {System.Collections.Generic.IEnumerable`1} contained in the bundle, serialized if item is a bundle."
                        },
                        "id": {
                            "format": "int64",
                            "description": "The Item Id.",
                            "type": "integer"
                        },
                        "premiumPricing": {
                            "$ref": {
                                "type": "object",
                                "description": "Defines the Premium pricing for a catalog item",
                                "properties": {
                                    "premiumDiscountPercentage": {
                                        "format": "int32",
                                        "description": "The Premium discount percentage for a catalog item",
                                        "type": "integer"
                                    },
                                    "premiumPriceInRobux": {
                                        "format": "int64",
                                        "description": "The Premium price for a catalog item",
                                        "type": "integer"
                                    }
                                }
                            },
                            "description": "The Premium pricing information for the item."
                        },
                        "unitsAvailableForConsumption": {
                            "format": "int64",
                            "description": "The number of items in stock, only if the item is resellable and is limitedEdition",
                            "type": "integer"
                        },
                        "purchaseCount": {
                            "format": "int64",
                            "description": "The number of times the item has been purchased.",
                            "type": "integer"
                        },
                        "bundleType": {
                            "enum": {
                                "1": "BodyParts",
                                "2": "AvatarAnimations"
                            },
                            "description": "The {Roblox.Platform.Bundles.Core.BundleType} serialized if item is a bundle.",
                            "type": "string"
                        },
                        "offSaleDeadline": {
                            "format": "date-time",
                            "description": "When the item will go off sale, if the item has an off deadline.",
                            "type": "string"
                        },
                        "name": {
                            "description": "The item name.",
                            "type": "string"
                        },
                        "creatorTargetId": {
                            "format": "int64",
                            "description": "The creator id of the item's creator.",
                            "type": "integer"
                        },
                        "itemType": {
                            "enum": {
                                "1": "Asset",
                                "2": "Bundle"
                            },
                            "description": "The {Roblox.Catalog.Api.CatalogSearchDetailedResponseItem.ItemType} item type.",
                            "type": "string"
                        },
                        "lowestPrice": {
                            "format": "int64",
                            "description": "The item's lowest price, only if the item is resellable and there are resellers.",
                            "type": "integer"
                        },
                        "creatorName": {
                            "description": "The creator name of the item's creator.",
                            "type": "string"
                        },
                        "creatorType": {
                            "enum": {
                                "1": "User",
                                "2": "Group"
                            },
                            "description": "The {Roblox.Catalog.Api.CatalogSearchDetailedResponseItem.CreatorType} of the item's creator.",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "403": {
            "description": "7: User is unauthorized."
        },
        "400": {
            "description": "9: itemType must be either asset or bundle"
        },
        "429": {
            "description": "8: The flood limit has been exceeded."
        }
    },
}
```
<hr>


## /v1/recommendations/metadata
```json
{
    "Method": "GET",
    "Description": "Return Metadata for Recommendations Component based on the page it is used on",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "string",
            "name": "page",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Recommendations Metadata Model",
                    "properties": {
                        "numOfRecommendationsRetrieved": {
                            "type": "integer",
                            "format": "int32"
                        },
                        "numOfRecommendationsDisplayed": {
                            "type": "integer",
                            "format": "int32"
                        },
                        "subject": {
                            "type": "string"
                        },
                        "isV2EndpointEnabled": {
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


## /v1/bundles/{bundleId}/details
```json
{
    "Method": "GET",
    "Description": "Returns details about the given bundleId.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "bundleId",
            "format": "int64",
            "required": true
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "bundleType": {
                            "readOnly": true,
                            "type": "string"
                        },
                        "name": {
                            "readOnly": true,
                            "type": "string"
                        },
                        "description": {
                            "readOnly": true,
                            "type": "string"
                        },
                        "id": {
                            "format": "int64",
                            "readOnly": true,
                            "type": "integer"
                        },
                        "items": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "owned": {
                                            "readOnly": true,
                                            "type": "boolean"
                                        },
                                        "type": {
                                            "readOnly": true,
                                            "type": "string"
                                        },
                                        "name": {
                                            "readOnly": true,
                                            "type": "string"
                                        },
                                        "id": {
                                            "format": "int64",
                                            "readOnly": true,
                                            "type": "integer"
                                        }
                                    },
                                    "type": "object"
                                }
                            },
                            "type": "array",
                            "readOnly": true
                        },
                        "creator": {
                            "$ref": {
                                "properties": {
                                    "id": {
                                        "format": "int64",
                                        "readOnly": true,
                                        "type": "integer"
                                    },
                                    "type": {
                                        "readOnly": true,
                                        "type": "string"
                                    },
                                    "name": {
                                        "readOnly": true,
                                        "type": "string"
                                    }
                                },
                                "type": "object"
                            },
                            "readOnly": true
                        },
                        "product": {
                            "$ref": {
                                "properties": {
                                    "isPublicDomain": {
                                        "type": "boolean"
                                    },
                                    "type": {
                                        "type": "string"
                                    },
                                    "isFree": {
                                        "type": "boolean"
                                    },
                                    "isForSale": {
                                        "type": "boolean"
                                    },
                                    "id": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "priceInRobux": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "noPriceText": {
                                        "type": "string"
                                    },
                                    "premiumPricing": {
                                        "$ref": {
                                            "type": "object",
                                            "description": "Defines the Premium pricing for a catalog item",
                                            "properties": {
                                                "premiumDiscountPercentage": {
                                                    "format": "int32",
                                                    "description": "The Premium discount percentage for a catalog item",
                                                    "type": "integer"
                                                },
                                                "premiumPriceInRobux": {
                                                    "format": "int64",
                                                    "description": "The Premium price for a catalog item",
                                                    "type": "integer"
                                                }
                                            }
                                        }
                                    }
                                },
                                "type": "object"
                            },
                            "readOnly": true
                        }
                    },
                    "type": "object"
                }
            }
        },
        "400": {
            "description": "1: Invalid bundle"
        }
    },
}
```
<hr>


## /v1/catalog/sorts
```json
{
    "Method": "GET",
    "Description": "Returns catalog sorts",
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
                        "sorts": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "items": {
                                            "items": {
                                                "$ref": {
                                                    "properties": {
                                                        "id": {
                                                            "type": "integer",
                                                            "format": "int64"
                                                        },
                                                        "itemType": {
                                                            "type": "string",
                                                            "enum": {
                                                                "1": "Asset",
                                                                "2": "Bundle"
                                                            }
                                                        }
                                                    },
                                                    "type": "object"
                                                }
                                            },
                                            "type": "array",
                                            "description": "Items in the sort"
                                        },
                                        "numberOfItems": {
                                            "format": "int32",
                                            "description": "Number of items to be displayed for the sort",
                                            "type": "integer"
                                        },
                                        "name": {
                                            "description": "Name of the sort",
                                            "type": "string"
                                        },
                                        "displayName": {
                                            "description": "Display name of the sort",
                                            "type": "string"
                                        }
                                    },
                                    "type": "object"
                                }
                            },
                            "type": "array",
                            "description": "Response object representing all categories"
                        }
                    },
                    "type": "object"
                }
            }
        }
    },
}
```
<hr>


## /v1/bundles/{bundleId}/unpack
```json
{
    "Method": "POST",
    "Description": "Unpacks a bundle and grants all of the associated items.
It may take a few seconds for all items to be granted after the request finishes.",
    "Consumes": "NONE",
    "Produces": "NONE",
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "bundleId",
            "format": "int64",
            "required": true
        }
    },
    "Responses": {
        "204": {
            "description": "No Content"
        },
        "403": {
            "description": "0: Token Validation Failed"
        },
        "400": {
            "description": "1: Invalid bundle\r\n2: Bundle is not owned"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/favorites/bundles/{bundleId}/count
```json
{
    "Method": "GET",
    "Description": "Gets the favorite count for the given bundle Id.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "bundleId",
            "format": "int64",
            "required": true
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "type": "integer",
                "format": "int64"
            }
        },
        "400": {
            "description": "2: Invalid bundle Id."
        }
    },
}
```
<hr>


## /v1/subcategories
```json
{
    "Method": "GET",
    "Description": "Lists Subcategory Names and their Ids",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": "NONE",
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "additionalProperties": {
                    "type": "integer",
                    "format": "int64"
                },
                "type": "object"
            }
        }
    },
}
```
<hr>


## /v1/asset-to-category
```json
{
    "Method": "GET",
    "Description": "Lists a mapping for assets to category IDs to convert from inventory ID to catalog ID. Creates a mapping to link 'Get More' button in inventory page to the relevant catalog page.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": "NONE",
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "additionalProperties": {
                    "type": "integer",
                    "format": "int64"
                },
                "type": "object"
            }
        }
    },
}
```
<hr>


## /v1/categories
```json
{
    "Method": "GET",
    "Description": "Lists Category Names and their Ids",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": "NONE",
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "additionalProperties": {
                    "type": "integer",
                    "format": "int64"
                },
                "type": "object"
            }
        }
    },
}
```
<hr>


## /v1/search/items
```json
{
    "Method": "GET",
    "Description": "Search for avatarCatalog item ids",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "string",
            "name": "model.category",
            "enum": {
                "1": "Accessories",
                "2": "All",
                "3": "AvatarAnimations",
                "4": "BodyParts",
                "5": "Clothing",
                "6": "Collectibles",
                "7": "Featured",
                "8": "Gear",
                "9": "CommunityCreations",
                "10": "Premium",
                "11": "Recommended"
            },
        },
        "2": {
            "in": "query",
            "type": "string",
            "name": "model.subcategory",
            "enum": {
                "1": "Accessories",
                "2": "All",
                "3": "AvatarAnimations",
                "4": "BackAccessories",
                "5": "BodyParts",
                "6": "Clothing",
                "7": "Collectibles",
                "8": "FaceAccessories",
                "9": "Faces",
                "10": "Featured",
                "11": "FrontAccessories",
                "12": "Gear",
                "13": "HairAccessories",
                "14": "Hats",
                "15": "Heads",
                "16": "NeckAccessories",
                "17": "Pants",
                "18": "Shirts",
                "19": "ShoulderAccessories",
                "20": "Tshirts",
                "21": "WaistAccessories",
                "22": "Bundles",
                "23": "AnimationBundles",
                "24": "EmoteAnimations",
                "25": "CommunityCreations",
                "26": "Melee",
                "27": "Ranged",
                "28": "Explosive",
                "29": "PowerUp",
                "30": "Navigation",
                "31": "Musical",
                "32": "Social",
                "33": "Building",
                "34": "Transport",
                "35": "Premium",
                "36": "Recommended"
            },
        },
        "3": {
            "in": "query",
            "type": "string",
            "name": "model.sortAggregation",
            "enum": {
                "1": "Past12Hours",
                "2": "PastDay",
                "3": "Past3Days",
                "4": "PastWeek",
                "5": "PastMonth",
                "6": "AllTime"
            },
        },
        "4": {
            "in": "query",
            "type": "string",
            "name": "model.sortCurrency",
            "enum": {
                "1": "All",
                "2": "Robux",
                "3": "Tickets",
                "4": "CustomRobux",
                "5": "CustomTickets",
                "6": "Free"
            },
        },
        "5": {
            "in": "query",
            "type": "array",
            "collectionFormat": "multi",
            "items": {
                "type": "string"
            },
            "name": "model.genres",
        },
        "6": {
            "in": "query",
            "type": "string",
            "name": "model.sortType",
            "enum": {
                "1": "Relevance",
                "2": "Favorited",
                "3": "Sales",
                "4": "Updated",
                "5": "PriceAsc",
                "6": "PriceDesc"
            },
        },
        "7": {
            "in": "query",
            "type": "string",
            "name": "model.creatorType",
            "enum": {
                "1": "User",
                "2": "Group"
            },
        },
        "8": {
            "in": "query",
            "type": "string",
            "name": "model.premiumBenefitFilterType",
            "enum": {
                "1": "None",
                "2": "PremiumDiscountedOnly",
                "3": "PremiumExclusiveOnly"
            },
        },
        "9": {
            "in": "query",
            "type": "integer",
            "name": "model.creatorTargetId",
            "format": "int64",
        },
        "10": {
            "in": "query",
            "type": "string",
            "name": "model.creatorName",
        },
        "11": {
            "in": "query",
            "type": "integer",
            "name": "model.maxPrice",
            "format": "int32",
        },
        "12": {
            "in": "query",
            "type": "integer",
            "name": "model.minPrice",
            "format": "int32",
        },
        "13": {
            "in": "query",
            "type": "string",
            "name": "model.keyword",
        },
        "14": {
            "in": "query",
            "type": "boolean",
            "name": "model.includeNotForSale",
        },
        "15": {
            "in": "query",
            "type": "array",
            "collectionFormat": "multi",
            "items": {
                "type": "string"
            },
            "name": "model.tagNames",
        },
        "16": {
            "in": "query",
            "type": "string",
            "default": "Desc",
            "enum": {
                "1": "Asc",
                "2": "Desc"
            },
            "description": "The order the results are sorted in.",
            "name": "sortOrder",
        },
        "17": {
            "in": "query",
            "type": "integer",
            "default": 10,
            "format": "int32",
            "enum": {
                "1": 10,
                "2": 28,
                "3": 30,
                "4": 50,
                "5": 60,
                "6": 100
            },
            "description": "The amount of results per request.",
            "name": "limit",
        },
        "18": {
            "in": "query",
            "type": "string",
            "name": "cursor",
            "description": "The paging cursor for the previous or next page.",
        }
    },
    "Responses": {
        "403": {
            "description": "7: User is unauthorized."
        },
        "400": {
            "description": "1: Category subcategory selection not supported.\r\n2: Creator id not found.\r\n3: Creator type not found.\r\n4: Genre not found.\r\n5: Sort combination not supported.\r\n6: Invalid price range.\r\n10: StartRequest is invalid."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "ApiPageResponse for catalog search",
                    "properties": {
                        "nextPageCursor": {
                            "type": "string"
                        },
                        "elasticsearchDebugInfo": {
                            "$ref": {
                                "properties": {
                                    "isForceTerminationEnabledByRequest": {
                                        "type": "boolean"
                                    },
                                    "indexName": {
                                        "type": "string"
                                    },
                                    "isFromCache": {
                                        "type": "boolean"
                                    },
                                    "elasticsearchQuery": {
                                        "type": "string"
                                    },
                                    "isTerminatedEarly": {
                                        "type": "boolean"
                                    }
                                },
                                "type": "object"
                            },
                            "description": "Elasticsearch debug info returned from AvatarCatalogSearch service"
                        },
                        "previousPageCursor": {
                            "type": "string"
                        },
                        "keyword": {
                            "description": "Keyword used for search query",
                            "type": "string"
                        },
                        "data": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "id": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "itemType": {
                                            "type": "string",
                                            "enum": {
                                                "1": "Asset",
                                                "2": "Bundle"
                                            }
                                        }
                                    },
                                    "type": "object"
                                }
                            },
                            "type": "array"
                        }
                    }
                }
            }
        },
        "429": {
            "description": "8: The flood limit has been exceeded."
        },
        "503": {
            "description": "18: Search request timed out"
        }
    },
}
```
<hr>


## /v1/bundles/details
```json
{
    "Method": "GET",
    "Description": "Returns details about the given bundleIds.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "array",
            "collectionFormat": "csv",
            "items": {
                "format": "int64",
                "type": "integer"
            },
            "required": true,
            "name": "bundleIds"
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "items": {
                    "$ref": {
                        "properties": {
                            "bundleType": {
                                "readOnly": true,
                                "type": "string"
                            },
                            "name": {
                                "readOnly": true,
                                "type": "string"
                            },
                            "description": {
                                "readOnly": true,
                                "type": "string"
                            },
                            "id": {
                                "format": "int64",
                                "readOnly": true,
                                "type": "integer"
                            },
                            "items": {
                                "items": {
                                    "$ref": {
                                        "properties": {
                                            "owned": {
                                                "readOnly": true,
                                                "type": "boolean"
                                            },
                                            "type": {
                                                "readOnly": true,
                                                "type": "string"
                                            },
                                            "name": {
                                                "readOnly": true,
                                                "type": "string"
                                            },
                                            "id": {
                                                "format": "int64",
                                                "readOnly": true,
                                                "type": "integer"
                                            }
                                        },
                                        "type": "object"
                                    }
                                },
                                "type": "array",
                                "readOnly": true
                            },
                            "creator": {
                                "$ref": {
                                    "properties": {
                                        "id": {
                                            "format": "int64",
                                            "readOnly": true,
                                            "type": "integer"
                                        },
                                        "type": {
                                            "readOnly": true,
                                            "type": "string"
                                        },
                                        "name": {
                                            "readOnly": true,
                                            "type": "string"
                                        }
                                    },
                                    "type": "object"
                                },
                                "readOnly": true
                            },
                            "product": {
                                "$ref": {
                                    "properties": {
                                        "isPublicDomain": {
                                            "type": "boolean"
                                        },
                                        "type": {
                                            "type": "string"
                                        },
                                        "isFree": {
                                            "type": "boolean"
                                        },
                                        "isForSale": {
                                            "type": "boolean"
                                        },
                                        "id": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "priceInRobux": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "noPriceText": {
                                            "type": "string"
                                        },
                                        "premiumPricing": {
                                            "$ref": {
                                                "type": "object",
                                                "description": "Defines the Premium pricing for a catalog item",
                                                "properties": {
                                                    "premiumDiscountPercentage": {
                                                        "format": "int32",
                                                        "description": "The Premium discount percentage for a catalog item",
                                                        "type": "integer"
                                                    },
                                                    "premiumPriceInRobux": {
                                                        "format": "int64",
                                                        "description": "The Premium price for a catalog item",
                                                        "type": "integer"
                                                    }
                                                }
                                            }
                                        }
                                    },
                                    "type": "object"
                                },
                                "readOnly": true
                            }
                        },
                        "type": "object"
                    }
                },
                "type": "array"
            }
        },
        "400": {
            "description": "2: Invalid collection of bundleIds\r\n3: Cannot request so many bundles at once."
        }
    },
}
```
<hr>


## /v1/search/navigation-menu-items
```json
{
    "Method": "GET",
    "Description": "Return Navigation Menu Items for Catalog Webpage",
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
                    "description": "Response model for navigation menu items",
                    "properties": {
                        "categories": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "Response model for category",
                                    "properties": {
                                        "categoryId": {
                                            "format": "int32",
                                            "description": "Category id",
                                            "type": "integer"
                                        },
                                        "isSearchable": {
                                            "description": "Gets or sets whether the category is searchable in search bar",
                                            "type": "boolean"
                                        },
                                        "name": {
                                            "description": "Category name",
                                            "type": "string"
                                        },
                                        "category": {
                                            "enum": {
                                                "1": "Accessories",
                                                "2": "All",
                                                "3": "AvatarAnimations",
                                                "4": "BodyParts",
                                                "5": "Clothing",
                                                "6": "Collectibles",
                                                "7": "Featured",
                                                "8": "Gear",
                                                "9": "CommunityCreations",
                                                "10": "Premium",
                                                "11": "Recommended"
                                            },
                                            "description": "Category type",
                                            "type": "string"
                                        },
                                        "orderIndex": {
                                            "format": "int32",
                                            "description": "Category order index",
                                            "type": "integer"
                                        },
                                        "subcategories": {
                                            "items": {
                                                "$ref": {
                                                    "type": "object",
                                                    "description": "Response model for subcategory",
                                                    "properties": {
                                                        "shortName": {
                                                            "description": "Subcategory short name",
                                                            "type": "string"
                                                        },
                                                        "subcategoryId": {
                                                            "format": "int32",
                                                            "description": "Subcategory id",
                                                            "type": "integer"
                                                        },
                                                        "name": {
                                                            "description": "Subcategory name",
                                                            "type": "string"
                                                        },
                                                        "subcategory": {
                                                            "enum": {
                                                                "1": "Accessories",
                                                                "2": "All",
                                                                "3": "AvatarAnimations",
                                                                "4": "BackAccessories",
                                                                "5": "BodyParts",
                                                                "6": "Clothing",
                                                                "7": "Collectibles",
                                                                "8": "FaceAccessories",
                                                                "9": "Faces",
                                                                "10": "Featured",
                                                                "11": "FrontAccessories",
                                                                "12": "Gear",
                                                                "13": "HairAccessories",
                                                                "14": "Hats",
                                                                "15": "Heads",
                                                                "16": "NeckAccessories",
                                                                "17": "Pants",
                                                                "18": "Shirts",
                                                                "19": "ShoulderAccessories",
                                                                "20": "Tshirts",
                                                                "21": "WaistAccessories",
                                                                "22": "Bundles",
                                                                "23": "AnimationBundles",
                                                                "24": "EmoteAnimations",
                                                                "25": "CommunityCreations",
                                                                "26": "Melee",
                                                                "27": "Ranged",
                                                                "28": "Explosive",
                                                                "29": "PowerUp",
                                                                "30": "Navigation",
                                                                "31": "Musical",
                                                                "32": "Social",
                                                                "33": "Building",
                                                                "34": "Transport",
                                                                "35": "Premium",
                                                                "36": "Recommended"
                                                            },
                                                            "description": "Subcategory type",
                                                            "type": "string"
                                                        }
                                                    }
                                                }
                                            },
                                            "type": "array",
                                            "description": "Subcategories under this category"
                                        }
                                    }
                                }
                            },
                            "type": "array",
                            "description": "Response object representing all categories"
                        },
                        "genres": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "Response model for genre",
                                    "properties": {
                                        "isSelected": {
                                            "description": "Whether this genre is selected by default",
                                            "type": "boolean"
                                        },
                                        "genre": {
                                            "enum": {
                                                "1": "TownAndCity",
                                                "2": "Medieval",
                                                "3": "SciFi",
                                                "4": "Fighting",
                                                "5": "Horror",
                                                "6": "Naval",
                                                "7": "Adventure",
                                                "8": "Sports",
                                                "9": "Comedy",
                                                "10": "Western",
                                                "11": "Military",
                                                "12": "Building",
                                                "13": "Fps",
                                                "14": "Rpg"
                                            },
                                            "description": "Genre type",
                                            "type": "string"
                                        },
                                        "name": {
                                            "description": "Genre name",
                                            "type": "string"
                                        }
                                    }
                                }
                            },
                            "type": "array",
                            "description": "Response object representing all genres"
                        },
                        "sortMenu": {
                            "$ref": {
                                "type": "object",
                                "description": "Response model for sort menu",
                                "properties": {
                                    "sortOptions": {
                                        "items": {
                                            "$ref": {
                                                "type": "object",
                                                "description": "Response model for sort option",
                                                "properties": {
                                                    "sortOrder": {
                                                        "enum": {
                                                            "1": "Asc",
                                                            "2": "Desc"
                                                        },
                                                        "description": "Descending or Ascending order of the sort",
                                                        "type": "string"
                                                    },
                                                    "name": {
                                                        "description": "Sort option Name",
                                                        "type": "string"
                                                    },
                                                    "hasSubMenu": {
                                                        "description": "Whether this sort option has sub menu",
                                                        "type": "boolean"
                                                    },
                                                    "isSelected": {
                                                        "description": "Whether this sort option is selected by default",
                                                        "type": "boolean"
                                                    },
                                                    "isPriceRelated": {
                                                        "description": "Whether this sort option is price related",
                                                        "type": "boolean"
                                                    },
                                                    "sortType": {
                                                        "enum": {
                                                            "1": "Relevance",
                                                            "2": "Favorited",
                                                            "3": "Sales",
                                                            "4": "Updated",
                                                            "5": "PriceAsc",
                                                            "6": "PriceDesc"
                                                        },
                                                        "description": "Sort type",
                                                        "type": "string"
                                                    }
                                                }
                                            }
                                        },
                                        "type": "array",
                                        "description": "List of sort options"
                                    },
                                    "sortAggregations": {
                                        "items": {
                                            "$ref": {
                                                "type": "object",
                                                "description": "Response model for sort aggregation",
                                                "properties": {
                                                    "name": {
                                                        "description": "Sort aggregation name",
                                                        "type": "string"
                                                    },
                                                    "hasSubMenu": {
                                                        "description": "Whether this sort aggregation has sub menu",
                                                        "type": "boolean"
                                                    },
                                                    "sortAggregation": {
                                                        "enum": {
                                                            "1": "Past12Hours",
                                                            "2": "PastDay",
                                                            "3": "Past3Days",
                                                            "4": "PastWeek",
                                                            "5": "PastMonth",
                                                            "6": "AllTime"
                                                        },
                                                        "description": "Sort aggregation type",
                                                        "type": "string"
                                                    },
                                                    "isSelected": {
                                                        "description": "Whether this sort aggregation is selected by default",
                                                        "type": "boolean"
                                                    },
                                                    "isPriceRelated": {
                                                        "description": "Whether this sort aggregation is price related",
                                                        "type": "boolean"
                                                    }
                                                }
                                            }
                                        },
                                        "type": "array",
                                        "description": "List of sort aggregations"
                                    }
                                }
                            },
                            "description": "Response object representing sort menu"
                        },
                        "priceFilters": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "Response model for price filter",
                                    "properties": {
                                        "excludePriceSorts": {
                                            "description": "Whether if this price filter exclude price sorts",
                                            "type": "boolean"
                                        },
                                        "name": {
                                            "description": "Price filter Name",
                                            "type": "string"
                                        },
                                        "currencyType": {
                                            "enum": {
                                                "1": "All",
                                                "2": "Robux",
                                                "3": "Tickets",
                                                "4": "CustomRobux",
                                                "5": "CustomTickets",
                                                "6": "Free"
                                            },
                                            "description": "Currency Type of this price filter",
                                            "type": "string"
                                        }
                                    }
                                }
                            },
                            "type": "array",
                            "description": "Response object representing all price filters"
                        },
                        "defaultSortAggregation": {
                            "type": "string",
                            "enum": {
                                "1": "Past12Hours",
                                "2": "PastDay",
                                "3": "Past3Days",
                                "4": "PastWeek",
                                "5": "PastMonth",
                                "6": "AllTime"
                            }
                        },
                        "creatorFilters": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "Response model for creator filter",
                                    "properties": {
                                        "isSelected": {
                                            "description": "Whether this filter is selected by default",
                                            "type": "boolean"
                                        },
                                        "userId": {
                                            "format": "int64",
                                            "description": "Creator user Id",
                                            "type": "integer"
                                        },
                                        "name": {
                                            "description": "Creator name",
                                            "type": "string"
                                        }
                                    }
                                }
                            },
                            "type": "array",
                            "description": "Response object representing all creator filters"
                        },
                        "defaultCreator": {
                            "type": "string",
                            "enum": {
                                "1": "User",
                                "2": "Group"
                            }
                        },
                        "robloxUserId": {
                            "type": "integer",
                            "format": "int64"
                        },
                        "defaultSortType": {
                            "type": "string",
                            "enum": {
                                "1": "Relevance",
                                "2": "Favorited",
                                "3": "Sales",
                                "4": "Updated",
                                "5": "PriceAsc",
                                "6": "PriceDesc"
                            }
                        },
                        "freeFilter": {
                            "type": "string",
                            "enum": {
                                "1": "All",
                                "2": "Robux",
                                "3": "Tickets",
                                "4": "CustomRobux",
                                "5": "CustomTickets",
                                "6": "Free"
                            }
                        },
                        "defaultCategoryIdForRecommendedSearch": {
                            "type": "string",
                            "enum": {
                                "1": "Accessories",
                                "2": "All",
                                "3": "AvatarAnimations",
                                "4": "BodyParts",
                                "5": "Clothing",
                                "6": "Collectibles",
                                "7": "Featured",
                                "8": "Gear",
                                "9": "CommunityCreations",
                                "10": "Premium",
                                "11": "Recommended"
                            }
                        },
                        "defaultGearSubcategory": {
                            "type": "string",
                            "enum": {
                                "1": "Accessories",
                                "2": "All",
                                "3": "AvatarAnimations",
                                "4": "BackAccessories",
                                "5": "BodyParts",
                                "6": "Clothing",
                                "7": "Collectibles",
                                "8": "FaceAccessories",
                                "9": "Faces",
                                "10": "Featured",
                                "11": "FrontAccessories",
                                "12": "Gear",
                                "13": "HairAccessories",
                                "14": "Hats",
                                "15": "Heads",
                                "16": "NeckAccessories",
                                "17": "Pants",
                                "18": "Shirts",
                                "19": "ShoulderAccessories",
                                "20": "Tshirts",
                                "21": "WaistAccessories",
                                "22": "Bundles",
                                "23": "AnimationBundles",
                                "24": "EmoteAnimations",
                                "25": "CommunityCreations",
                                "26": "Melee",
                                "27": "Ranged",
                                "28": "Explosive",
                                "29": "PowerUp",
                                "30": "Navigation",
                                "31": "Musical",
                                "32": "Social",
                                "33": "Building",
                                "34": "Transport",
                                "35": "Premium",
                                "36": "Recommended"
                            }
                        },
                        "gearSubcategory": {
                            "type": "string",
                            "enum": {
                                "1": "Accessories",
                                "2": "All",
                                "3": "AvatarAnimations",
                                "4": "BackAccessories",
                                "5": "BodyParts",
                                "6": "Clothing",
                                "7": "Collectibles",
                                "8": "FaceAccessories",
                                "9": "Faces",
                                "10": "Featured",
                                "11": "FrontAccessories",
                                "12": "Gear",
                                "13": "HairAccessories",
                                "14": "Hats",
                                "15": "Heads",
                                "16": "NeckAccessories",
                                "17": "Pants",
                                "18": "Shirts",
                                "19": "ShoulderAccessories",
                                "20": "Tshirts",
                                "21": "WaistAccessories",
                                "22": "Bundles",
                                "23": "AnimationBundles",
                                "24": "EmoteAnimations",
                                "25": "CommunityCreations",
                                "26": "Melee",
                                "27": "Ranged",
                                "28": "Explosive",
                                "29": "PowerUp",
                                "30": "Navigation",
                                "31": "Musical",
                                "32": "Social",
                                "33": "Building",
                                "34": "Transport",
                                "35": "Premium",
                                "36": "Recommended"
                            }
                        },
                        "allCategories": {
                            "type": "string",
                            "enum": {
                                "1": "Accessories",
                                "2": "All",
                                "3": "AvatarAnimations",
                                "4": "BodyParts",
                                "5": "Clothing",
                                "6": "Collectibles",
                                "7": "Featured",
                                "8": "Gear",
                                "9": "CommunityCreations",
                                "10": "Premium",
                                "11": "Recommended"
                            }
                        },
                        "robloxUserName": {
                            "type": "string"
                        },
                        "customRobuxFilter": {
                            "type": "string",
                            "enum": {
                                "1": "All",
                                "2": "Robux",
                                "3": "Tickets",
                                "4": "CustomRobux",
                                "5": "CustomTickets",
                                "6": "Free"
                            }
                        },
                        "robuxFilter": {
                            "type": "string",
                            "enum": {
                                "1": "All",
                                "2": "Robux",
                                "3": "Tickets",
                                "4": "CustomRobux",
                                "5": "CustomTickets",
                                "6": "Free"
                            }
                        },
                        "defaultCategory": {
                            "type": "string",
                            "enum": {
                                "1": "Accessories",
                                "2": "All",
                                "3": "AvatarAnimations",
                                "4": "BodyParts",
                                "5": "Clothing",
                                "6": "Collectibles",
                                "7": "Featured",
                                "8": "Gear",
                                "9": "CommunityCreations",
                                "10": "Premium",
                                "11": "Recommended"
                            }
                        },
                        "categoriesWithCreator": {
                            "items": {
                                "type": "string",
                                "enum": {
                                    "1": "Accessories",
                                    "2": "All",
                                    "3": "AvatarAnimations",
                                    "4": "BodyParts",
                                    "5": "Clothing",
                                    "6": "Collectibles",
                                    "7": "Featured",
                                    "8": "Gear",
                                    "9": "CommunityCreations",
                                    "10": "Premium",
                                    "11": "Recommended"
                                }
                            },
                            "type": "array"
                        },
                        "defaultCurrency": {
                            "type": "string",
                            "enum": {
                                "1": "All",
                                "2": "Robux",
                                "3": "Tickets",
                                "4": "CustomRobux",
                                "5": "CustomTickets",
                                "6": "Free"
                            }
                        }
                    }
                }
            }
        }
    },
}
```
<hr>


## /v1/recommendations/asset/{assetTypeId}
```json
{
    "Method": "GET",
    "Description": "Gets a list of recommended assets, given an asset type
- Migrated from Inventory.Api, functional similarity preserved",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "assetTypeId",
            "format": "int32",
            "required": true,
            "description": "The asset type id {Roblox.AssetType}"
        },
        "2": {
            "in": "query",
            "type": "integer",
            "name": "numItems",
            "format": "int32",
            "description": "The number of recommended items to return.",
        },
        "3": {
            "in": "query",
            "type": "integer",
            "name": "contextAssetId",
            "format": "int64",
            "description": "Optional asset id",
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
                                        "creator": {
                                            "$ref": {
                                                "properties": {
                                                    "creatorProfileLink": {
                                                        "type": "string"
                                                    },
                                                    "creatorId": {
                                                        "type": "integer",
                                                        "format": "int64"
                                                    },
                                                    "name": {
                                                        "type": "string"
                                                    },
                                                    "creatorType": {
                                                        "type": "string"
                                                    }
                                                },
                                                "type": "object"
                                            },
                                            "readOnly": true
                                        },
                                        "item": {
                                            "$ref": {
                                                "properties": {
                                                    "assetId": {
                                                        "type": "integer",
                                                        "format": "int64"
                                                    },
                                                    "name": {
                                                        "type": "string"
                                                    },
                                                    "premiumPrice": {
                                                        "type": "integer",
                                                        "format": "int64"
                                                    },
                                                    "price": {
                                                        "type": "integer",
                                                        "format": "int64"
                                                    },
                                                    "audioUrl": {
                                                        "type": "string"
                                                    },
                                                    "absoluteUrl": {
                                                        "type": "string"
                                                    }
                                                },
                                                "type": "object"
                                            },
                                            "readOnly": true
                                        },
                                        "product": {
                                            "$ref": {
                                                "properties": {
                                                    "totalPrivateSales": {
                                                        "type": "integer",
                                                        "format": "int64"
                                                    },
                                                    "isFree": {
                                                        "type": "boolean"
                                                    },
                                                    "sellerId": {
                                                        "type": "integer",
                                                        "format": "int64"
                                                    },
                                                    "isLimitedUnique": {
                                                        "type": "boolean"
                                                    },
                                                    "bcRequirement": {
                                                        "type": "integer",
                                                        "format": "int32"
                                                    },
                                                    "isXboxExclusiveItem": {
                                                        "type": "boolean"
                                                    },
                                                    "isResellable": {
                                                        "type": "boolean"
                                                    },
                                                    "serialNumber": {
                                                        "type": "integer",
                                                        "format": "int64"
                                                    },
                                                    "sellerName": {
                                                        "type": "string"
                                                    },
                                                    "id": {
                                                        "type": "integer",
                                                        "format": "int64"
                                                    },
                                                    "rentalDurationInHours": {
                                                        "type": "integer",
                                                        "format": "int64"
                                                    },
                                                    "isPublicDomain": {
                                                        "type": "boolean"
                                                    },
                                                    "offsaleDeadline": {
                                                        "type": "string"
                                                    },
                                                    "lowestPrivateSaleUserAssetId": {
                                                        "type": "integer",
                                                        "format": "int64"
                                                    },
                                                    "priceInRobux": {
                                                        "type": "integer",
                                                        "format": "int64"
                                                    },
                                                    "noPriceText": {
                                                        "type": "string"
                                                    },
                                                    "isForSale": {
                                                        "type": "boolean"
                                                    },
                                                    "isLimited": {
                                                        "type": "boolean"
                                                    },
                                                    "isRental": {
                                                        "type": "boolean"
                                                    }
                                                },
                                                "type": "object"
                                            },
                                            "readOnly": true
                                        }
                                    },
                                    "type": "object"
                                }
                            },
                            "type": "array"
                        },
                        "total": {
                            "type": "integer",
                            "format": "int64"
                        }
                    },
                    "type": "object"
                }
            }
        }
    },
}
```
<hr>


## /v1/favorites/users/{userId}/assets/{assetId}/favorite
```json
{
    "Method": "POST",
    "Description": "Create a favorite for an asset by the authenticated user.",
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
            "required": true
        },
        "2": {
            "in": "path",
            "type": "integer",
            "name": "assetId",
            "format": "int64",
            "required": true
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n6: You are not authorized to perform this action."
        },
        "400": {
            "description": "1: Invalid user Id.\r\n2: Invalid asset Id."
        },
        "409": {
            "description": "3: Asset is already favorited."
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
            "description": "5: This action was floodchecked. Please try again later."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>

```json
{
    "Method": "DELETE",
    "Description": "Delete a favorite for an asset by the authenticated user.",
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
            "required": true
        },
        "2": {
            "in": "path",
            "type": "integer",
            "name": "assetId",
            "format": "int64",
            "required": true
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n6: You are not authorized to perform this action."
        },
        "400": {
            "description": "1: Invalid user Id.\r\n2: Invalid asset Id."
        },
        "409": {
            "description": "4: Asset is already not favorited."
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
            "description": "5: This action was floodchecked. Please try again later."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>

```json
{
    "Method": "GET",
    "Description": "Gets the favorite model for the asset and user.",
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
            "required": true
        },
        "2": {
            "in": "path",
            "type": "integer",
            "name": "assetId",
            "format": "int64",
            "required": true
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A model to represent asset favorites.",
                    "properties": {
                        "created": {
                            "readOnly": true,
                            "format": "date-time",
                            "description": "The time at which the user favorited the asset.",
                            "type": "string"
                        },
                        "assetId": {
                            "readOnly": true,
                            "format": "int64",
                            "description": "The Id of the asset being favorited.",
                            "type": "integer"
                        },
                        "userId": {
                            "readOnly": true,
                            "format": "int64",
                            "description": "The Id of the user favoriting the asset.",
                            "type": "integer"
                        }
                    }
                }
            }
        },
        "400": {
            "description": "1: Invalid user Id.\r\n2: Invalid asset Id."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/asset-to-subcategory
```json
{
    "Method": "GET",
    "Description": "Lists a mapping for assets to subcategory IDs to convert from inventory ID to catalog ID. Creates a mapping to link 'Get More' button in inventory page to the relevant catalog page.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": "NONE",
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "additionalProperties": {
                    "type": "integer",
                    "format": "int64"
                },
                "type": "object"
            }
        }
    },
}
```
<hr>


## /v1/users/{userId}/bundles
```json
{
    "Method": "GET",
    "Description": "Lists the bundles owned by a given user.",
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
            "required": true
        },
        "2": {
            "in": "query",
            "type": "string",
            "default": "Asc",
            "enum": {
                "1": "Asc",
                "2": "Desc"
            },
            "description": "Sorted by bundle",
            "name": "sortOrder",
        },
        "3": {
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
        "4": {
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
                                    "type": "object",
                                    "description": "A model to represent owned bundles.",
                                    "properties": {
                                        "id": {
                                            "format": "int64",
                                            "readOnly": true,
                                            "type": "integer"
                                        },
                                        "creator": {
                                            "$ref": {
                                                "properties": {
                                                    "id": {
                                                        "format": "int64",
                                                        "readOnly": true,
                                                        "type": "integer"
                                                    },
                                                    "type": {
                                                        "readOnly": true,
                                                        "type": "string"
                                                    },
                                                    "name": {
                                                        "readOnly": true,
                                                        "type": "string"
                                                    }
                                                },
                                                "type": "object"
                                            },
                                            "readOnly": true
                                        },
                                        "name": {
                                            "readOnly": true,
                                            "type": "string"
                                        },
                                        "bundleType": {
                                            "readOnly": true,
                                            "type": "string"
                                        }
                                    }
                                }
                            },
                            "type": "array"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "400": {
            "description": "1: Invalid bundle"
        }
    },
}
```
<hr>


## /v1/catalog/items/details
```json
{
    "Method": "POST",
    "Description": "Returns list of item details",
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
            "name": "model",
            "required": true,
            "schema": {
                "$ref": {
                    "properties": {
                        "items": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "itemType": {
                                            "type": "string",
                                            "enum": {
                                                "1": "Asset",
                                                "2": "Bundle"
                                            }
                                        },
                                        "id": {
                                            "type": "integer",
                                            "format": "int64"
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
            },
            "description": "{Roblox.Catalog.Api.MultigetItemDetailsRequestModel}"
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
                                    "type": "object",
                                    "description": "The detailed model for catalog items.",
                                    "properties": {
                                        "description": {
                                            "description": "The item description.",
                                            "type": "string"
                                        },
                                        "genres": {
                                            "items": {
                                                "type": "string",
                                                "enum": {
                                                    "1": "All",
                                                    "2": "Tutorial",
                                                    "3": "Scary",
                                                    "4": "TownAndCity",
                                                    "5": "War",
                                                    "6": "Funny",
                                                    "7": "Fantasy",
                                                    "8": "Adventure",
                                                    "9": "SciFi",
                                                    "10": "Pirate",
                                                    "11": "FPS",
                                                    "12": "RPG",
                                                    "13": "Sports",
                                                    "14": "Ninja",
                                                    "15": "WildWest"
                                                }
                                            },
                                            "type": "array",
                                            "description": "The {System.Collections.Generic.IEnumerable`1}, serialized if item has genres."
                                        },
                                        "bundledItems": {
                                            "items": {
                                                "$ref": {
                                                    "properties": {
                                                        "owned": {
                                                            "readOnly": true,
                                                            "type": "boolean"
                                                        },
                                                        "type": {
                                                            "readOnly": true,
                                                            "type": "string"
                                                        },
                                                        "name": {
                                                            "readOnly": true,
                                                            "type": "string"
                                                        },
                                                        "id": {
                                                            "format": "int64",
                                                            "readOnly": true,
                                                            "type": "integer"
                                                        }
                                                    },
                                                    "type": "object"
                                                }
                                            },
                                            "type": "array",
                                            "description": "The {System.Collections.Generic.IEnumerable`1} contained in the bundle, serialized if item is a bundle."
                                        },
                                        "priceStatus": {
                                            "description": "The localized string item status if the item's price should not be displayed.",
                                            "type": "string"
                                        },
                                        "assetType": {
                                            "enum": {
                                                "1": "Image",
                                                "2": "TShirt",
                                                "3": "Audio",
                                                "4": "Mesh",
                                                "5": "Lua",
                                                "6": "HTML",
                                                "7": "Text",
                                                "8": "Hat",
                                                "9": "Place",
                                                "10": "Model",
                                                "11": "Shirt",
                                                "12": "Pants",
                                                "13": "Decal",
                                                "14": "Avatar",
                                                "15": "Head",
                                                "16": "Face",
                                                "17": "Gear",
                                                "18": "Badge",
                                                "19": "GroupEmblem",
                                                "20": "Animation",
                                                "21": "Arms",
                                                "22": "Legs",
                                                "23": "Torso",
                                                "24": "RightArm",
                                                "25": "LeftArm",
                                                "26": "LeftLeg",
                                                "27": "RightLeg",
                                                "28": "Package",
                                                "29": "YouTubeVideo",
                                                "30": "GamePass",
                                                "31": "App",
                                                "32": "Code",
                                                "33": "Plugin",
                                                "34": "SolidModel",
                                                "35": "MeshPart",
                                                "36": "HairAccessory",
                                                "37": "FaceAccessory",
                                                "38": "NeckAccessory",
                                                "39": "ShoulderAccessory",
                                                "40": "FrontAccessory",
                                                "41": "BackAccessory",
                                                "42": "WaistAccessory",
                                                "43": "ClimbAnimation",
                                                "44": "DeathAnimation",
                                                "45": "FallAnimation",
                                                "46": "IdleAnimation",
                                                "47": "JumpAnimation",
                                                "48": "RunAnimation",
                                                "49": "SwimAnimation",
                                                "50": "WalkAnimation",
                                                "51": "PoseAnimation",
                                                "52": "LocalizationTableManifest",
                                                "53": "LocalizationTableTranslation",
                                                "54": "EmoteAnimation",
                                                "55": "Video",
                                                "56": "TexturePack"
                                            },
                                            "description": "The {Roblox.Platform.Assets.AssetType} serialized if item is an asset.",
                                            "type": "string"
                                        },
                                        "productId": {
                                            "format": "int64",
                                            "description": "The product id of corresponding item.",
                                            "type": "integer"
                                        },
                                        "itemRestrictions": {
                                            "items": {
                                                "type": "string",
                                                "enum": {
                                                    "1": "ThirteenPlus",
                                                    "2": "LimitedUnique",
                                                    "3": "Limited",
                                                    "4": "BuildersClub",
                                                    "5": "TurboBuildersClub",
                                                    "6": "OutrageousBuildersClub",
                                                    "7": "Rthro"
                                                }
                                            },
                                            "type": "array",
                                            "description": "The {System.Collections.Generic.IEnumerable`1} if item has {Roblox.Catalog.Api.CatalogItemRestriction}."
                                        },
                                        "itemStatus": {
                                            "items": {
                                                "type": "string",
                                                "enum": {
                                                    "1": "New",
                                                    "2": "Sale",
                                                    "3": "XboxExclusive",
                                                    "4": "AmazonExclusive",
                                                    "5": "GooglePlayExclusive",
                                                    "6": "IosExclusive",
                                                    "7": "SaleTimer"
                                                }
                                            },
                                            "type": "array",
                                            "description": "The {System.Collections.Generic.IEnumerable`1} if item has {Roblox.Catalog.Api.CatalogItemStatus}."
                                        },
                                        "favoriteCount": {
                                            "format": "int64",
                                            "description": "The number of times the item has been favorited.",
                                            "type": "integer"
                                        },
                                        "itemType": {
                                            "enum": {
                                                "1": "Asset",
                                                "2": "Bundle"
                                            },
                                            "description": "The {Roblox.Catalog.Api.CatalogSearchDetailedResponseItem.ItemType} item type.",
                                            "type": "string"
                                        },
                                        "id": {
                                            "format": "int64",
                                            "description": "The Item Id.",
                                            "type": "integer"
                                        },
                                        "creatorTargetId": {
                                            "format": "int64",
                                            "description": "The creator id of the item's creator.",
                                            "type": "integer"
                                        },
                                        "unitsAvailableForConsumption": {
                                            "format": "int64",
                                            "description": "The number of items in stock, only if the item is resellable and is limitedEdition",
                                            "type": "integer"
                                        },
                                        "purchaseCount": {
                                            "format": "int64",
                                            "description": "The number of times the item has been purchased.",
                                            "type": "integer"
                                        },
                                        "bundleType": {
                                            "enum": {
                                                "1": "BodyParts",
                                                "2": "AvatarAnimations"
                                            },
                                            "description": "The {Roblox.Platform.Bundles.Core.BundleType} serialized if item is a bundle.",
                                            "type": "string"
                                        },
                                        "offSaleDeadline": {
                                            "format": "date-time",
                                            "description": "When the item will go off sale, if the item has an off deadline.",
                                            "type": "string"
                                        },
                                        "name": {
                                            "description": "The item name.",
                                            "type": "string"
                                        },
                                        "premiumPricing": {
                                            "$ref": {
                                                "type": "object",
                                                "description": "Defines the Premium pricing for a catalog item",
                                                "properties": {
                                                    "premiumDiscountPercentage": {
                                                        "format": "int32",
                                                        "description": "The Premium discount percentage for a catalog item",
                                                        "type": "integer"
                                                    },
                                                    "premiumPriceInRobux": {
                                                        "format": "int64",
                                                        "description": "The Premium price for a catalog item",
                                                        "type": "integer"
                                                    }
                                                }
                                            },
                                            "description": "The Premium pricing information for the item."
                                        },
                                        "price": {
                                            "format": "int64",
                                            "description": "The item's price.",
                                            "type": "integer"
                                        },
                                        "lowestPrice": {
                                            "format": "int64",
                                            "description": "The item's lowest price, only if the item is resellable and there are resellers.",
                                            "type": "integer"
                                        },
                                        "creatorName": {
                                            "description": "The creator name of the item's creator.",
                                            "type": "string"
                                        },
                                        "creatorType": {
                                            "enum": {
                                                "1": "User",
                                                "2": "Group"
                                            },
                                            "description": "The {Roblox.Catalog.Api.CatalogSearchDetailedResponseItem.CreatorType} of the item's creator.",
                                            "type": "string"
                                        }
                                    }
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
            "description": "0: Token Validation Failed\r\n7: User is unauthorized."
        },
        "400": {
            "description": "2: Invalid count"
        },
        "429": {
            "description": "8: The flood limit has been exceeded."
        }
    },
}
```
<hr>


## /v1/exclusive-items/{appStoreType}/bundles
```json
{
    "Method": "GET",
    "Description": "Lists the exclusive catalog items for a particular app store.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "string",
            "name": "appStoreType",
            "enum": {
                "1": "GooglePlay",
                "2": "Amazon",
                "3": "iOS",
                "4": "Xbox"
            },
            "required": true
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
                                    "type": "object",
                                    "description": "Basic catalog item model",
                                    "properties": {
                                        "type": {
                                            "readOnly": true,
                                            "type": "string"
                                        },
                                        "name": {
                                            "readOnly": true,
                                            "type": "string"
                                        },
                                        "priceInRobux": {
                                            "format": "int64",
                                            "readOnly": true,
                                            "type": "integer"
                                        },
                                        "id": {
                                            "format": "int64",
                                            "readOnly": true,
                                            "type": "integer"
                                        },
                                        "description": {
                                            "readOnly": true,
                                            "type": "string"
                                        },
                                        "premiumPricing": {
                                            "$ref": {
                                                "type": "object",
                                                "description": "Defines the Premium pricing for a catalog item",
                                                "properties": {
                                                    "premiumDiscountPercentage": {
                                                        "format": "int32",
                                                        "description": "The Premium discount percentage for a catalog item",
                                                        "type": "integer"
                                                    },
                                                    "premiumPriceInRobux": {
                                                        "format": "int64",
                                                        "description": "The Premium price for a catalog item",
                                                        "type": "integer"
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            },
                            "type": "array"
                        },
                        "total": {
                            "type": "integer",
                            "format": "int64"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "400": {
            "description": "1: Invalid app store."
        }
    },
}
```
<hr>


## /v1/users/{userId}/bundles/{bundleType}
```json
{
    "Method": "GET",
    "Description": ""NONE"",
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
            "required": true
        },
        "2": {
            "in": "path",
            "type": "string",
            "name": "bundleType",
            "enum": {
                "1": "BodyParts",
                "2": "AvatarAnimations"
            },
            "required": true
        },
        "3": {
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
        "4": {
            "in": "query",
            "type": "string",
            "name": "cursor",
            "description": "The paging cursor for the previous or next page.",
        },
        "5": {
            "in": "query",
            "type": "string",
            "default": "Desc",
            "enum": {
                "1": "Asc",
                "2": "Desc"
            },
            "description": "The order the results are sorted in.",
            "name": "sortOrder",
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
                                    "type": "object",
                                    "description": "A model to represent owned bundles.",
                                    "properties": {
                                        "id": {
                                            "format": "int64",
                                            "readOnly": true,
                                            "type": "integer"
                                        },
                                        "creator": {
                                            "$ref": {
                                                "properties": {
                                                    "id": {
                                                        "format": "int64",
                                                        "readOnly": true,
                                                        "type": "integer"
                                                    },
                                                    "type": {
                                                        "readOnly": true,
                                                        "type": "string"
                                                    },
                                                    "name": {
                                                        "readOnly": true,
                                                        "type": "string"
                                                    }
                                                },
                                                "type": "object"
                                            },
                                            "readOnly": true
                                        },
                                        "name": {
                                            "readOnly": true,
                                            "type": "string"
                                        },
                                        "bundleType": {
                                            "readOnly": true,
                                            "type": "string"
                                        }
                                    }
                                }
                            },
                            "type": "array"
                        }
                    },
                    "type": "object"
                }
            }
        }
    },
}
```
<hr>


## /v1/catalog/metadata
```json
{
    "Method": "GET",
    "Description": "Return Metadata for Catalog Webpage",
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
                    "description": "Catalog Metadata model",
                    "properties": {
                        "isPremiumSortEnabled": {
                            "description": "Determines whether Premium sort is availabe",
                            "type": "boolean"
                        },
                        "numberOfCatalogItemsToDisplayOnSplash": {
                            "format": "int32",
                            "description": "Default number of Splash tiles in catalog page",
                            "type": "integer"
                        },
                        "is3dInEachItemCardEnabled": {
                            "type": "boolean"
                        },
                        "timeoutOn3dThumbnailRequestInMs": {
                            "type": "integer",
                            "format": "int64"
                        },
                        "numberOfCatalogItemsToDisplayOnSplashOnPhone": {
                            "format": "int32",
                            "description": "Number of splash tiles in catalog page on phone",
                            "type": "integer"
                        },
                        "isPremiumIconOnItemTilesEnabled": {
                            "description": "Determines whether Premium icons, when applicable, should be shown on catalog item tiles",
                            "type": "boolean"
                        },
                        "isCatalogSortsFromApiEnabled": {
                            "description": "Should consumer use catalog sorts",
                            "type": "boolean"
                        },
                        "is3dInEachItemCardAbTestingEnabled": {
                            "type": "boolean"
                        },
                        "isPremiumPriceOnItemTilesEnabled": {
                            "description": "Determines whether Premium prices, when available, should be shown on catalog item tiles",
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


# <b>Catalog Api v2</b>

## /v2/recommendations/{subject}
```json
{
    "Method": "GET",
    "Description": "Generic recommendations endpoint for various catalog subjects - assets, bundles, user-inventory etc",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "string",
            "name": "subject",
            "required": true,
            "description": "one of assets, bundles, user-inventory"
        },
        "2": {
            "in": "query",
            "type": "integer",
            "name": "assetTypeId",
            "format": "int32",
            "description": "assetTypeId for assets and user-inventory recommendations",
        },
        "3": {
            "in": "query",
            "type": "integer",
            "name": "numItems",
            "format": "int32",
            "description": "number items to return",
        },
        "4": {
            "in": "query",
            "type": "integer",
            "name": "assetId",
            "format": "int64",
            "description": "AssetId for subject = assets",
        },
        "5": {
            "in": "query",
            "type": "integer",
            "name": "bundleId",
            "format": "int64",
            "description": "BundleId for subject = bundles",
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
                                "type": "integer",
                                "format": "int64"
                            },
                            "type": "array"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "404": {
            "description": "5: Invalid subject specified"
        },
        "400": {
            "description": "1: Invalid bundle\r\n2: Error retrieving bundles\r\n3: Error getting bundle recommendations\r\n4: NumItems exceed maximum\r\n6: Asset type id required\r\n7: Invalid asset"
        },
        "401": {
            "description": "8: Unauthorized request to view inventory recommendations"
        }
    },
}
```
<hr>


## /v2/search/items/details
```json
{
    "Method": "GET",
    "Description": "Search for catalog items.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "array",
            "collectionFormat": "multi",
            "items": {
                "format": "int32",
                "type": "integer"
            },
            "name": "model.assetTypeIds",
        },
        "2": {
            "in": "query",
            "type": "array",
            "collectionFormat": "multi",
            "items": {
                "format": "int32",
                "type": "integer"
            },
            "name": "model.bundleTypeIds",
        },
        "3": {
            "in": "query",
            "type": "string",
            "name": "model.categoryFilter",
            "enum": {
                "1": "None",
                "2": "Featured",
                "3": "Collectibles",
                "4": "CommunityCreations",
                "5": "Landing",
                "6": "Premium",
                "7": "Recommended"
            },
        },
        "4": {
            "in": "query",
            "type": "string",
            "name": "model.sortAggregation",
            "enum": {
                "1": "Past12Hours",
                "2": "PastDay",
                "3": "Past3Days",
                "4": "PastWeek",
                "5": "PastMonth",
                "6": "AllTime"
            },
        },
        "5": {
            "in": "query",
            "type": "string",
            "name": "model.sortCurrency",
            "enum": {
                "1": "All",
                "2": "Robux",
                "3": "Tickets",
                "4": "CustomRobux",
                "5": "CustomTickets",
                "6": "Free"
            },
        },
        "6": {
            "in": "query",
            "type": "array",
            "collectionFormat": "multi",
            "items": {
                "type": "string"
            },
            "name": "model.genres",
        },
        "7": {
            "in": "query",
            "type": "string",
            "name": "model.sortType",
            "enum": {
                "1": "Relevance",
                "2": "Favorited",
                "3": "Sales",
                "4": "Updated",
                "5": "PriceAsc",
                "6": "PriceDesc"
            },
        },
        "8": {
            "in": "query",
            "type": "string",
            "name": "model.creatorType",
            "enum": {
                "1": "User",
                "2": "Group"
            },
        },
        "9": {
            "in": "query",
            "type": "string",
            "name": "model.premiumBenefitFilterType",
            "enum": {
                "1": "None",
                "2": "PremiumDiscountedOnly",
                "3": "PremiumExclusiveOnly"
            },
        },
        "10": {
            "in": "query",
            "type": "integer",
            "name": "model.creatorTargetId",
            "format": "int64",
        },
        "11": {
            "in": "query",
            "type": "string",
            "name": "model.creatorName",
        },
        "12": {
            "in": "query",
            "type": "integer",
            "name": "model.maxPrice",
            "format": "int32",
        },
        "13": {
            "in": "query",
            "type": "integer",
            "name": "model.minPrice",
            "format": "int32",
        },
        "14": {
            "in": "query",
            "type": "string",
            "name": "model.keyword",
        },
        "15": {
            "in": "query",
            "type": "boolean",
            "name": "model.includeNotForSale",
        },
        "16": {
            "in": "query",
            "type": "array",
            "collectionFormat": "multi",
            "items": {
                "type": "string"
            },
            "name": "model.tagNames",
        },
        "17": {
            "in": "query",
            "type": "string",
            "default": "Desc",
            "enum": {
                "1": "Desc"
            },
            "description": "The order the results are sorted in.",
            "name": "sortOrder",
        },
        "18": {
            "in": "query",
            "type": "integer",
            "default": 10,
            "format": "int32",
            "enum": {
                "1": 10,
                "2": 28,
                "3": 30
            },
            "description": "The amount of results per request.",
            "name": "limit",
        },
        "19": {
            "in": "query",
            "type": "string",
            "name": "cursor",
            "description": "The paging cursor for the previous or next page.",
        }
    },
    "Responses": {
        "403": {
            "description": "7: User is unauthorized."
        },
        "400": {
            "description": "1: Category subcategory selection not supported.\r\n2: Creator id not found.\r\n3: Creator type not found.\r\n4: Genre not found.\r\n5: Sort combination not supported.\r\n6: Invalid price range.\r\n10: StartRequest is invalid."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "ApiPageResponse for catalog search",
                    "properties": {
                        "nextPageCursor": {
                            "type": "string"
                        },
                        "elasticsearchDebugInfo": {
                            "$ref": {
                                "properties": {
                                    "isForceTerminationEnabledByRequest": {
                                        "type": "boolean"
                                    },
                                    "indexName": {
                                        "type": "string"
                                    },
                                    "isFromCache": {
                                        "type": "boolean"
                                    },
                                    "elasticsearchQuery": {
                                        "type": "string"
                                    },
                                    "isTerminatedEarly": {
                                        "type": "boolean"
                                    }
                                },
                                "type": "object"
                            },
                            "description": "Elasticsearch debug info returned from AvatarCatalogSearch service"
                        },
                        "previousPageCursor": {
                            "type": "string"
                        },
                        "keyword": {
                            "description": "Keyword used for search query",
                            "type": "string"
                        },
                        "data": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "The detailed model for catalog items.",
                                    "properties": {
                                        "description": {
                                            "description": "The item description.",
                                            "type": "string"
                                        },
                                        "genres": {
                                            "items": {
                                                "type": "string",
                                                "enum": {
                                                    "1": "All",
                                                    "2": "Tutorial",
                                                    "3": "Scary",
                                                    "4": "TownAndCity",
                                                    "5": "War",
                                                    "6": "Funny",
                                                    "7": "Fantasy",
                                                    "8": "Adventure",
                                                    "9": "SciFi",
                                                    "10": "Pirate",
                                                    "11": "FPS",
                                                    "12": "RPG",
                                                    "13": "Sports",
                                                    "14": "Ninja",
                                                    "15": "WildWest"
                                                }
                                            },
                                            "type": "array",
                                            "description": "The {System.Collections.Generic.IEnumerable`1}, serialized if item has genres."
                                        },
                                        "bundledItems": {
                                            "items": {
                                                "$ref": {
                                                    "properties": {
                                                        "owned": {
                                                            "readOnly": true,
                                                            "type": "boolean"
                                                        },
                                                        "type": {
                                                            "readOnly": true,
                                                            "type": "string"
                                                        },
                                                        "name": {
                                                            "readOnly": true,
                                                            "type": "string"
                                                        },
                                                        "id": {
                                                            "format": "int64",
                                                            "readOnly": true,
                                                            "type": "integer"
                                                        }
                                                    },
                                                    "type": "object"
                                                }
                                            },
                                            "type": "array",
                                            "description": "The {System.Collections.Generic.IEnumerable`1} contained in the bundle, serialized if item is a bundle."
                                        },
                                        "priceStatus": {
                                            "description": "The localized string item status if the item's price should not be displayed.",
                                            "type": "string"
                                        },
                                        "assetType": {
                                            "enum": {
                                                "1": "Image",
                                                "2": "TShirt",
                                                "3": "Audio",
                                                "4": "Mesh",
                                                "5": "Lua",
                                                "6": "HTML",
                                                "7": "Text",
                                                "8": "Hat",
                                                "9": "Place",
                                                "10": "Model",
                                                "11": "Shirt",
                                                "12": "Pants",
                                                "13": "Decal",
                                                "14": "Avatar",
                                                "15": "Head",
                                                "16": "Face",
                                                "17": "Gear",
                                                "18": "Badge",
                                                "19": "GroupEmblem",
                                                "20": "Animation",
                                                "21": "Arms",
                                                "22": "Legs",
                                                "23": "Torso",
                                                "24": "RightArm",
                                                "25": "LeftArm",
                                                "26": "LeftLeg",
                                                "27": "RightLeg",
                                                "28": "Package",
                                                "29": "YouTubeVideo",
                                                "30": "GamePass",
                                                "31": "App",
                                                "32": "Code",
                                                "33": "Plugin",
                                                "34": "SolidModel",
                                                "35": "MeshPart",
                                                "36": "HairAccessory",
                                                "37": "FaceAccessory",
                                                "38": "NeckAccessory",
                                                "39": "ShoulderAccessory",
                                                "40": "FrontAccessory",
                                                "41": "BackAccessory",
                                                "42": "WaistAccessory",
                                                "43": "ClimbAnimation",
                                                "44": "DeathAnimation",
                                                "45": "FallAnimation",
                                                "46": "IdleAnimation",
                                                "47": "JumpAnimation",
                                                "48": "RunAnimation",
                                                "49": "SwimAnimation",
                                                "50": "WalkAnimation",
                                                "51": "PoseAnimation",
                                                "52": "LocalizationTableManifest",
                                                "53": "LocalizationTableTranslation",
                                                "54": "EmoteAnimation",
                                                "55": "Video",
                                                "56": "TexturePack"
                                            },
                                            "description": "The {Roblox.Platform.Assets.AssetType} serialized if item is an asset.",
                                            "type": "string"
                                        },
                                        "productId": {
                                            "format": "int64",
                                            "description": "The product id of corresponding item.",
                                            "type": "integer"
                                        },
                                        "itemRestrictions": {
                                            "items": {
                                                "type": "string",
                                                "enum": {
                                                    "1": "ThirteenPlus",
                                                    "2": "LimitedUnique",
                                                    "3": "Limited",
                                                    "4": "BuildersClub",
                                                    "5": "TurboBuildersClub",
                                                    "6": "OutrageousBuildersClub",
                                                    "7": "Rthro"
                                                }
                                            },
                                            "type": "array",
                                            "description": "The {System.Collections.Generic.IEnumerable`1} if item has {Roblox.Catalog.Api.CatalogItemRestriction}."
                                        },
                                        "itemStatus": {
                                            "items": {
                                                "type": "string",
                                                "enum": {
                                                    "1": "New",
                                                    "2": "Sale",
                                                    "3": "XboxExclusive",
                                                    "4": "AmazonExclusive",
                                                    "5": "GooglePlayExclusive",
                                                    "6": "IosExclusive",
                                                    "7": "SaleTimer"
                                                }
                                            },
                                            "type": "array",
                                            "description": "The {System.Collections.Generic.IEnumerable`1} if item has {Roblox.Catalog.Api.CatalogItemStatus}."
                                        },
                                        "favoriteCount": {
                                            "format": "int64",
                                            "description": "The number of times the item has been favorited.",
                                            "type": "integer"
                                        },
                                        "itemType": {
                                            "enum": {
                                                "1": "Asset",
                                                "2": "Bundle"
                                            },
                                            "description": "The {Roblox.Catalog.Api.CatalogSearchDetailedResponseItem.ItemType} item type.",
                                            "type": "string"
                                        },
                                        "id": {
                                            "format": "int64",
                                            "description": "The Item Id.",
                                            "type": "integer"
                                        },
                                        "creatorTargetId": {
                                            "format": "int64",
                                            "description": "The creator id of the item's creator.",
                                            "type": "integer"
                                        },
                                        "unitsAvailableForConsumption": {
                                            "format": "int64",
                                            "description": "The number of items in stock, only if the item is resellable and is limitedEdition",
                                            "type": "integer"
                                        },
                                        "purchaseCount": {
                                            "format": "int64",
                                            "description": "The number of times the item has been purchased.",
                                            "type": "integer"
                                        },
                                        "bundleType": {
                                            "enum": {
                                                "1": "BodyParts",
                                                "2": "AvatarAnimations"
                                            },
                                            "description": "The {Roblox.Platform.Bundles.Core.BundleType} serialized if item is a bundle.",
                                            "type": "string"
                                        },
                                        "offSaleDeadline": {
                                            "format": "date-time",
                                            "description": "When the item will go off sale, if the item has an off deadline.",
                                            "type": "string"
                                        },
                                        "name": {
                                            "description": "The item name.",
                                            "type": "string"
                                        },
                                        "premiumPricing": {
                                            "$ref": {
                                                "type": "object",
                                                "description": "Defines the Premium pricing for a catalog item",
                                                "properties": {
                                                    "premiumDiscountPercentage": {
                                                        "format": "int32",
                                                        "description": "The Premium discount percentage for a catalog item",
                                                        "type": "integer"
                                                    },
                                                    "premiumPriceInRobux": {
                                                        "format": "int64",
                                                        "description": "The Premium price for a catalog item",
                                                        "type": "integer"
                                                    }
                                                }
                                            },
                                            "description": "The Premium pricing information for the item."
                                        },
                                        "price": {
                                            "format": "int64",
                                            "description": "The item's price.",
                                            "type": "integer"
                                        },
                                        "lowestPrice": {
                                            "format": "int64",
                                            "description": "The item's lowest price, only if the item is resellable and there are resellers.",
                                            "type": "integer"
                                        },
                                        "creatorName": {
                                            "description": "The creator name of the item's creator.",
                                            "type": "string"
                                        },
                                        "creatorType": {
                                            "enum": {
                                                "1": "User",
                                                "2": "Group"
                                            },
                                            "description": "The {Roblox.Catalog.Api.CatalogSearchDetailedResponseItem.CreatorType} of the item's creator.",
                                            "type": "string"
                                        }
                                    }
                                }
                            },
                            "type": "array"
                        }
                    }
                }
            }
        },
        "429": {
            "description": "8: The flood limit has been exceeded."
        },
        "503": {
            "description": "18: Search request timed out"
        }
    },
}
```
<hr>


