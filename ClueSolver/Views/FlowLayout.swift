//
//  FlowLayout.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 6/23/25.
//

import SwiftUI

struct FlowLayout: Layout {
    var spacing: CGSize = CGSize(width: 8, height: 8) // Customize spacing here

    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        var size = CGSize.zero
        var rowHeight: CGFloat = 0
        var x: CGFloat = 0
        var y: CGFloat = 0
        let maxWidth = proposal.width ?? .infinity

        for subview in subviews {
            let subviewSize = subview.sizeThatFits(.unspecified)

            if x + subviewSize.width > maxWidth {
                x = 0
                y += rowHeight + spacing.height
                rowHeight = 0
            }

            x += subviewSize.width + spacing.width
            rowHeight = max(rowHeight, subviewSize.height)
        }

        size.width = maxWidth
        size.height = y + rowHeight

        return size
    }

    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        var x: CGFloat = bounds.minX
        var y: CGFloat = bounds.minY
        var rowHeight: CGFloat = 0

        for subview in subviews {
            let size = subview.sizeThatFits(.unspecified)

            if x + size.width > bounds.maxX {
                x = bounds.minX
                y += rowHeight + spacing.height
                rowHeight = 0
            }

            subview.place(at: CGPoint(x: x, y: y), proposal: ProposedViewSize(width: size.width, height: size.height))
            x += size.width + spacing.width
            rowHeight = max(rowHeight, size.height)
        }
    }
}

#Preview {
    
}
