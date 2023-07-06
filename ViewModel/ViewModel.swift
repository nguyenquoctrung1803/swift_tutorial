//
//  ViewModel.swift
//  mvvm_rxswift_tutorial
//
//  Created by Trung Nguyễn Quốc on 06/07/2023.
//

import Foundation
import RxSwift
import RxCocoa



class ViewModel {
    var inputText = PublishSubject<String>()
    var anotherInputText = PublishSubject<String>()
    
    
    var isChecked: Observable<Bool> {
        Observable.combineLatest(inputText.asObservable(), anotherInputText.asObserver()) {
            input, anotherInput in
            input.count >= 3 && anotherInput.count >= 3
        }
    }
    
}
