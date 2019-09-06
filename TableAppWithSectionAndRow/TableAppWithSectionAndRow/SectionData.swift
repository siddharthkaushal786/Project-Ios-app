//
//  SectionData.swift
//  TableAppWithSectionAndRow
//
//  Created by trainee on 04/09/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import Foundation

struct SectionData {
    var sectionTitle : String
    var isExpanded : Bool
    var conteinsUserSelectedValue: Bool
    var selectionOption : [String]
    init(sectionTitle: String, isExpanded: Bool, conteinsUserSelectedValue: Bool, selectionOption: [String]) {
        self.sectionTitle = sectionTitle
        self.isExpanded = isExpanded
        self.conteinsUserSelectedValue = conteinsUserSelectedValue
        self.selectionOption = selectionOption
    }
}
