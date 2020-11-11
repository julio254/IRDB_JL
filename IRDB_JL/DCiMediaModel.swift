//
//  DCiMediaModel.swift
//  IRDB_JL
//
//  Created by Julio Lopez on 11/10/20.
//

import UIKit

class DCiMediaModel: Codable {
    var dciGroup: [Group]
}

class Group: Codable {
    let groupName: String
    let groupEntries: [GroupEntries]
}

class GroupEntries: Codable {
    let orgName: String
    let style: String
    let yearFounded: String
    let yearOfRecentWin: String?
    let totalWins: Int?
    let topShow: String?
    let network: String?
    let groupImage: String
    let groupLocation: String
    let groupSummary: String
    let groupStaff: [CorpStaff]
}

class CorpStaff: Codable {
    let staffMember: String
    let staffRole: String
}
