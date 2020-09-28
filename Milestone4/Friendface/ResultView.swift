//
//  ResultView.swift
//  Friendface
//
//  Created by Prathamesh Kowarkar on 28/09/20.
//

import SwiftUI

struct ResultView<Success, Failure, SuccessView, FailureView>: View where
    Failure: Error,
    SuccessView: View,
    FailureView: View
{

    let result: Result<Success, Failure>
    let successContent: (Success) -> SuccessView
    let failureContent: (Failure) -> FailureView

    var body: some View {
        switch result {
            case .success(let value): successContent(value)
            case .failure(let error): failureContent(error)
        }
    }

}

struct ResultView_Previews: PreviewProvider {

    static var result: Result<String, Error> = Bool.random()
        ? .success("Hello")
        : .failure(URLError(.unknown))

    static var previews: some View {
        ResultView(result: result) {
            Text($0)
        } failureContent: { error in
            Text(error.localizedDescription)
        }
    }

}
