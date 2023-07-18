// To parse this JSON data, do
//
//     final ItemModel = ItemModelFromJson(jsonString);

import 'dart:convert';

class ItemModel {
    String? status;
    String? message;
    dynamic metadata;
    List<Datum>? data;
    dynamic authToken;

    ItemModel({
        this.status,
        this.message,
        this.metadata,
        this.data,
        this.authToken,
    });

    factory ItemModel.fromRawJson(String str) => ItemModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        status: json["status"],
        message: json["message"],
        metadata: json["metadata"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        authToken: json["auth_token"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "metadata": metadata,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "auth_token": authToken,
    };
}

class Datum {
    String? companyId;
    String? divisionId;
    String? departmentId;
    String? itemId;
    bool? isActive;
    String? itemTypeId;
    String? itemName;
    String? itemDescription;
    String? itemLongDescription;
    String? itemCategoryId;
    String? itemFamilyId;
    dynamic salesDescription;
    dynamic purchaseDescription;
    dynamic pictureUrl;
    dynamic largePictureUrl;
    int? itemWeight;
    int? itemWeightMetric;
    int? itemShipWeight;
    String? itemUpccode;
    dynamic itemEpccode;
    dynamic itemRfid;
    dynamic itemSize;
    dynamic itemSizeCmm;
    dynamic itemDimentions;
    dynamic itemDimentionsCmm;
    dynamic itemColor;
    dynamic itemNrfcolor;
    dynamic itemStyle;
    dynamic itemNrfstyle;
    dynamic itemCareInstructions;
    dynamic itemDefaultWarehouse;
    dynamic itemDefaultWarehouseBin;
    dynamic itemLocationX;
    dynamic itemLocationY;
    dynamic itemLocationZ;
    dynamic downloadLocation;
    dynamic downloadPassword;
    String? itemUom;
    String? glitemSalesAccount;
    String? glitemCogsaccount;
    String? glitemInventoryAccount;
    dynamic packId;
    dynamic currencyId;
    dynamic currencyExchangeRate;
    double? price;
    String? itemPricingCode;
    dynamic pricingMethods;
    bool? taxable;
    dynamic vendorId;
    dynamic leadTime;
    dynamic leadTimeUnit;
    int? reOrderLevel;
    int? reOrderQty;
    dynamic buildTime;
    dynamic buildTimeUnit;
    dynamic useageRate;
    dynamic useageRateUnit;
    dynamic salesForecast;
    dynamic salesForecastUnit;
    dynamic calculatedCover;
    dynamic calculatedCoverUnits;
    bool? isAssembly;
    dynamic itemAssembly;
    double? lifo;
    double? lifovalue;
    double? lifocost;
    double? average;
    double? averageValue;
    double? averageCost;
    double? fifo;
    double? fifovalue;
    double? fifocost;
    double? expected;
    dynamic expectedValue;
    dynamic expectedCost;
    dynamic landed;
    dynamic landedValue;
    dynamic landedCost;
    double? other;
    dynamic otherValue;
    dynamic otherCost;
    bool? commissionable;
    int? commissionType;
    int? commissionPerc;
    bool? approved;
    dynamic approvedBy;
    dynamic approvedDate;
    String? enteredBy;
    String? taxGroupId;
    dynamic taxPercent;
    dynamic lockedBy;
    dynamic lockTs;
    bool? isSerialLotItem;
    bool? isWarrantyItem;
    dynamic warrantyPeriod;
    dynamic minimumQty;
    DateTime? lastEditDate;
    DateTime? creationDate;
    dynamic glitemFreightAccount;
    dynamic glitemHandlingAccount;
    bool? allowPurchaseTrans;
    bool? allowSalesTrans;
    bool? allowInventoryTrans;
    dynamic toleranceLevel;
    dynamic branchCode;
    dynamic enforceQualityAssuranceOnPo;
    bool? isPack;
    bool? allowPack;
    dynamic minimumQtyForPacking;
    dynamic projectId;

    Datum({
        this.companyId,
        this.divisionId,
        this.departmentId,
        this.itemId,
        this.isActive,
        this.itemTypeId,
        this.itemName,
        this.itemDescription,
        this.itemLongDescription,
        this.itemCategoryId,
        this.itemFamilyId,
        this.salesDescription,
        this.purchaseDescription,
        this.pictureUrl,
        this.largePictureUrl,
        this.itemWeight,
        this.itemWeightMetric,
        this.itemShipWeight,
        this.itemUpccode,
        this.itemEpccode,
        this.itemRfid,
        this.itemSize,
        this.itemSizeCmm,
        this.itemDimentions,
        this.itemDimentionsCmm,
        this.itemColor,
        this.itemNrfcolor,
        this.itemStyle,
        this.itemNrfstyle,
        this.itemCareInstructions,
        this.itemDefaultWarehouse,
        this.itemDefaultWarehouseBin,
        this.itemLocationX,
        this.itemLocationY,
        this.itemLocationZ,
        this.downloadLocation,
        this.downloadPassword,
        this.itemUom,
        this.glitemSalesAccount,
        this.glitemCogsaccount,
        this.glitemInventoryAccount,
        this.packId,
        this.currencyId,
        this.currencyExchangeRate,
        this.price,
        this.itemPricingCode,
        this.pricingMethods,
        this.taxable,
        this.vendorId,
        this.leadTime,
        this.leadTimeUnit,
        this.reOrderLevel,
        this.reOrderQty,
        this.buildTime,
        this.buildTimeUnit,
        this.useageRate,
        this.useageRateUnit,
        this.salesForecast,
        this.salesForecastUnit,
        this.calculatedCover,
        this.calculatedCoverUnits,
        this.isAssembly,
        this.itemAssembly,
        this.lifo,
        this.lifovalue,
        this.lifocost,
        this.average,
        this.averageValue,
        this.averageCost,
        this.fifo,
        this.fifovalue,
        this.fifocost,
        this.expected,
        this.expectedValue,
        this.expectedCost,
        this.landed,
        this.landedValue,
        this.landedCost,
        this.other,
        this.otherValue,
        this.otherCost,
        this.commissionable,
        this.commissionType,
        this.commissionPerc,
        this.approved,
        this.approvedBy,
        this.approvedDate,
        this.enteredBy,
        this.taxGroupId,
        this.taxPercent,
        this.lockedBy,
        this.lockTs,
        this.isSerialLotItem,
        this.isWarrantyItem,
        this.warrantyPeriod,
        this.minimumQty,
        this.lastEditDate,
        this.creationDate,
        this.glitemFreightAccount,
        this.glitemHandlingAccount,
        this.allowPurchaseTrans,
        this.allowSalesTrans,
        this.allowInventoryTrans,
        this.toleranceLevel,
        this.branchCode,
        this.enforceQualityAssuranceOnPo,
        this.isPack,
        this.allowPack,
        this.minimumQtyForPacking,
        this.projectId,
    });

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        companyId: json["companyId"],
        divisionId: json["divisionId"],
        departmentId: json["departmentId"],
        itemId: json["itemId"],
        isActive: json["isActive"],
        itemTypeId: json["itemTypeId"],
        itemName: json["itemName"],
        itemDescription: json["itemDescription"],
        itemLongDescription: json["itemLongDescription"],
        itemCategoryId: json["itemCategoryId"],
        itemFamilyId: json["itemFamilyId"],
        salesDescription: json["salesDescription"],
        purchaseDescription: json["purchaseDescription"],
        pictureUrl: json["pictureUrl"],
        largePictureUrl: json["largePictureUrl"],
        itemWeight: json["itemWeight"],
        itemWeightMetric: json["itemWeightMetric"],
        itemShipWeight: json["itemShipWeight"],
        itemUpccode: json["itemUpccode"],
        itemEpccode: json["itemEpccode"],
        itemRfid: json["itemRfid"],
        itemSize: json["itemSize"],
        itemSizeCmm: json["itemSizeCmm"],
        itemDimentions: json["itemDimentions"],
        itemDimentionsCmm: json["itemDimentionsCmm"],
        itemColor: json["itemColor"],
        itemNrfcolor: json["itemNrfcolor"],
        itemStyle: json["itemStyle"],
        itemNrfstyle: json["itemNrfstyle"],
        itemCareInstructions: json["itemCareInstructions"],
        itemDefaultWarehouse: json["itemDefaultWarehouse"],
        itemDefaultWarehouseBin: json["itemDefaultWarehouseBin"],
        itemLocationX: json["itemLocationX"],
        itemLocationY: json["itemLocationY"],
        itemLocationZ: json["itemLocationZ"],
        downloadLocation: json["downloadLocation"],
        downloadPassword: json["downloadPassword"],
        itemUom: json["itemUom"],
        glitemSalesAccount: json["glitemSalesAccount"],
        glitemCogsaccount: json["glitemCogsaccount"],
        glitemInventoryAccount: json["glitemInventoryAccount"],
        packId: json["packId"],
        currencyId: json["currencyId"],
        currencyExchangeRate: json["currencyExchangeRate"],
        price: json["price"],
        itemPricingCode: json["itemPricingCode"],
        pricingMethods: json["pricingMethods"],
        taxable: json["taxable"],
        vendorId: json["vendorId"],
        leadTime: json["leadTime"],
        leadTimeUnit: json["leadTimeUnit"],
        reOrderLevel: json["reOrderLevel"],
        reOrderQty: json["reOrderQty"],
        buildTime: json["buildTime"],
        buildTimeUnit: json["buildTimeUnit"],
        useageRate: json["useageRate"],
        useageRateUnit: json["useageRateUnit"],
        salesForecast: json["salesForecast"],
        salesForecastUnit: json["salesForecastUnit"],
        calculatedCover: json["calculatedCover"],
        calculatedCoverUnits: json["calculatedCoverUnits"],
        isAssembly: json["isAssembly"],
        itemAssembly: json["itemAssembly"],
        lifo: json["lifo"],
        lifovalue: json["lifovalue"],
        lifocost: json["lifocost"],
        average: json["average"],
        averageValue: json["averageValue"],
        averageCost: json["averageCost"],
        fifo: json["fifo"],
        fifovalue: json["fifovalue"],
        fifocost: json["fifocost"],
        expected: json["expected"],
        expectedValue: json["expectedValue"],
        expectedCost: json["expectedCost"],
        landed: json["landed"],
        landedValue: json["landedValue"],
        landedCost: json["landedCost"],
        other: json["other"],
        otherValue: json["otherValue"],
        otherCost: json["otherCost"],
        commissionable: json["commissionable"],
        commissionType: json["commissionType"],
        commissionPerc: json["commissionPerc"],
        approved: json["approved"],
        approvedBy: json["approvedBy"],
        approvedDate: json["approvedDate"],
        enteredBy: json["enteredBy"],
        taxGroupId: json["taxGroupId"],
        taxPercent: json["taxPercent"],
        lockedBy: json["lockedBy"],
        lockTs: json["lockTs"],
        isSerialLotItem: json["isSerialLotItem"],
        isWarrantyItem: json["isWarrantyItem"],
        warrantyPeriod: json["warrantyPeriod"],
        minimumQty: json["minimumQty"],
        lastEditDate: json["lastEditDate"] == null ? null : DateTime.parse(json["lastEditDate"]),
        creationDate: json["creationDate"] == null ? null : DateTime.parse(json["creationDate"]),
        glitemFreightAccount: json["glitemFreightAccount"],
        glitemHandlingAccount: json["glitemHandlingAccount"],
        allowPurchaseTrans: json["allowPurchaseTrans"],
        allowSalesTrans: json["allowSalesTrans"],
        allowInventoryTrans: json["allowInventoryTrans"],
        toleranceLevel: json["toleranceLevel"],
        branchCode: json["branchCode"],
        enforceQualityAssuranceOnPo: json["enforceQualityAssuranceOnPo"],
        isPack: json["isPack"],
        allowPack: json["allowPack"],
        minimumQtyForPacking: json["minimumQtyForPacking"],
        projectId: json["projectId"],
    );

    Map<String, dynamic> toJson() => {
        "companyId": companyId,
        "divisionId": divisionId,
        "departmentId": departmentId,
        "itemId": itemId,
        "isActive": isActive,
        "itemTypeId": itemTypeId,
        "itemName": itemName,
        "itemDescription": itemDescription,
        "itemLongDescription": itemLongDescription,
        "itemCategoryId": itemCategoryId,
        "itemFamilyId": itemFamilyId,
        "salesDescription": salesDescription,
        "purchaseDescription": purchaseDescription,
        "pictureUrl": pictureUrl,
        "largePictureUrl": largePictureUrl,
        "itemWeight": itemWeight,
        "itemWeightMetric": itemWeightMetric,
        "itemShipWeight": itemShipWeight,
        "itemUpccode": itemUpccode,
        "itemEpccode": itemEpccode,
        "itemRfid": itemRfid,
        "itemSize": itemSize,
        "itemSizeCmm": itemSizeCmm,
        "itemDimentions": itemDimentions,
        "itemDimentionsCmm": itemDimentionsCmm,
        "itemColor": itemColor,
        "itemNrfcolor": itemNrfcolor,
        "itemStyle": itemStyle,
        "itemNrfstyle": itemNrfstyle,
        "itemCareInstructions": itemCareInstructions,
        "itemDefaultWarehouse": itemDefaultWarehouse,
        "itemDefaultWarehouseBin": itemDefaultWarehouseBin,
        "itemLocationX": itemLocationX,
        "itemLocationY": itemLocationY,
        "itemLocationZ": itemLocationZ,
        "downloadLocation": downloadLocation,
        "downloadPassword": downloadPassword,
        "itemUom": itemUom,
        "glitemSalesAccount": glitemSalesAccount,
        "glitemCogsaccount": glitemCogsaccount,
        "glitemInventoryAccount": glitemInventoryAccount,
        "packId": packId,
        "currencyId": currencyId,
        "currencyExchangeRate": currencyExchangeRate,
        "price": price,
        "itemPricingCode": itemPricingCode,
        "pricingMethods": pricingMethods,
        "taxable": taxable,
        "vendorId": vendorId,
        "leadTime": leadTime,
        "leadTimeUnit": leadTimeUnit,
        "reOrderLevel": reOrderLevel,
        "reOrderQty": reOrderQty,
        "buildTime": buildTime,
        "buildTimeUnit": buildTimeUnit,
        "useageRate": useageRate,
        "useageRateUnit": useageRateUnit,
        "salesForecast": salesForecast,
        "salesForecastUnit": salesForecastUnit,
        "calculatedCover": calculatedCover,
        "calculatedCoverUnits": calculatedCoverUnits,
        "isAssembly": isAssembly,
        "itemAssembly": itemAssembly,
        "lifo": lifo,
        "lifovalue": lifovalue,
        "lifocost": lifocost,
        "average": average,
        "averageValue": averageValue,
        "averageCost": averageCost,
        "fifo": fifo,
        "fifovalue": fifovalue,
        "fifocost": fifocost,
        "expected": expected,
        "expectedValue": expectedValue,
        "expectedCost": expectedCost,
        "landed": landed,
        "landedValue": landedValue,
        "landedCost": landedCost,
        "other": other,
        "otherValue": otherValue,
        "otherCost": otherCost,
        "commissionable": commissionable,
        "commissionType": commissionType,
        "commissionPerc": commissionPerc,
        "approved": approved,
        "approvedBy": approvedBy,
        "approvedDate": approvedDate,
        "enteredBy": enteredBy,
        "taxGroupId": taxGroupId,
        "taxPercent": taxPercent,
        "lockedBy": lockedBy,
        "lockTs": lockTs,
        "isSerialLotItem": isSerialLotItem,
        "isWarrantyItem": isWarrantyItem,
        "warrantyPeriod": warrantyPeriod,
        "minimumQty": minimumQty,
        "lastEditDate": lastEditDate?.toIso8601String(),
        "creationDate": creationDate?.toIso8601String(),
        "glitemFreightAccount": glitemFreightAccount,
        "glitemHandlingAccount": glitemHandlingAccount,
        "allowPurchaseTrans": allowPurchaseTrans,
        "allowSalesTrans": allowSalesTrans,
        "allowInventoryTrans": allowInventoryTrans,
        "toleranceLevel": toleranceLevel,
        "branchCode": branchCode,
        "enforceQualityAssuranceOnPo": enforceQualityAssuranceOnPo,
        "isPack": isPack,
        "allowPack": allowPack,
        "minimumQtyForPacking": minimumQtyForPacking,
        "projectId": projectId,
    };
}
