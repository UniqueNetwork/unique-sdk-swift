//
//  UNQCollectionLimits.swift
//  UniqueSDK
//
//  Created by Мах Ol on 15.11.2022.
//

import Foundation

public struct UNQCollectionLimits: Codable {
    public let accountTokenOwnershipLimit: Int?
    public let sponsoredDataSize: Int?
    public let sponsoredDataRateLimit: Int?
    public let tokenLimit: Int?
    public let sponsorTransferTimeout: Int?
    public let sponsorApproveTimeout: Int?
    public let ownerCanTransfer: Bool?
    public let ownerCanDestroy: Bool?
    public let transfersEnabled: Bool?
    
    public init(accountTokenOwnershipLimit: Int?,
                sponsoredDataSize: Int?,
                sponsoredDataRateLimit: Int?,
                tokenLimit: Int?,
                sponsorTransferTimeout: Int?,
                sponsorApproveTimeout: Int?,
                ownerCanTransfer: Bool?,
                ownerCanDestroy: Bool?,
                transfersEnabled: Bool?)
    {
        self.accountTokenOwnershipLimit = accountTokenOwnershipLimit
        self.sponsoredDataSize = sponsoredDataSize
        self.sponsoredDataRateLimit = sponsoredDataRateLimit
        self.tokenLimit = tokenLimit
        self.sponsorTransferTimeout = sponsorTransferTimeout
        self.sponsorApproveTimeout = sponsorApproveTimeout
        self.ownerCanTransfer = ownerCanTransfer
        self.ownerCanDestroy = ownerCanDestroy
        self.transfersEnabled = transfersEnabled
    }
}
