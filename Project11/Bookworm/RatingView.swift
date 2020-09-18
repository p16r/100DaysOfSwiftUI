//
//  RatingView.swift
//  Bookworm
//
//  Created by Prathamesh Kowarkar on 18/09/20.
//  Copyright © 2020 Prathamesh Kowarkar. All rights reserved.
//

import SwiftUI

struct RatingView: View {

    @Binding var rating: Int

    var label: String = ""
    var maximumRating: Int = 5

    var offImage = Image?.none
    var onImage = Image(systemName: "star.fill")

    var offColor = Color.gray
    var onColor = Color.yellow

    var body: some View {
        HStack {
            if label.isEmpty == false { Text(label) }
            ForEach(1 ..< maximumRating + 1) { number in
                image(for: number)
                    .foregroundColor(number > rating ? offColor : onColor)
                    .onTapGesture {
                        rating = number
                    }
            }
        }
    }

    private func image(for number: Int) -> Image {
        if number > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }

}

struct RatingView_Previews: PreviewProvider {

    @State static var rating = 3

    static var previews: some View {
        RatingView(rating: $rating)
    }

}
