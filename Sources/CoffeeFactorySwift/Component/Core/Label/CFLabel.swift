//
//  SwiftUIView.swift
//
//
//  Created by yuncoffee on 1/29/24.
//

import SwiftUI

struct CFLabel: View, StyleEssential, LabelStyleEssential {
    var content: (label: String, icon: String?) = ("Label", icon : nil)
    
    var type: LabelType = .text
    var size: LabelSize = .body
    var color: Color = .cf(.grayScale(.black))
    
    var alignStyle: LabelAlignStyle = .textOnly
    var iconSize: CGFloat?
    var contentColor: Color?
    
    var expandable: Bool = false
    var fontStyle: (weight: Pretendard, scale: Pretendard.FontScale) = (weight: .regular, scale: .body)
    
    var width: CGFloat?
    var padding: (v: CGFloat, h: CGFloat) = (v: .cfSpacing(.xxxsmall), h: .cfSpacing(.xxxsmall))
    
    
    var body: some View {
        Label(content.label, systemImage: content.icon ?? "cup.and.saucer.fill")
            .labelStyle(
                CFLabelStyle(
                    type: type,
                    size: size,
                    color: color,
                    alignStyle: alignStyle,
                    iconSize: iconSize,
                    contentColor: contentColor,
                    fontStyle: fontStyle,
                    expandable: expandable,
                    width: width,
                    padding: padding
                )
            )
    }
}

#Preview {
    CFLabel(content: (label: "가나다라마바사아자차카타파하", icon: nil),
            alignStyle: .textWithIcon,
            fontStyle: (weight: .bold, scale: .title)
    )
    .border(.blue)
    .padding(24)
    .border(.red)
}
