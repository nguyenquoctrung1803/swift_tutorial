//
//  ViewController.swift
//  mvvm_rxswift_tutorial
//
//  Created by Trung Nguyễn Quốc on 06/07/2023.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    //MARK: - IbOutlets
    @IBOutlet weak var lblOutput: UILabel!
    @IBOutlet weak var txtInput: UITextField!
    @IBOutlet weak var txtAnotherInput: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    
    //MARK: - Propertites
    let viewModel = ViewModel()
    let disposeBag = DisposeBag()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        txtInput.rx.text.map {$0 ?? ""}
            .bind(to: viewModel.inputText)
            .disposed(by: disposeBag)
        
        txtAnotherInput.rx.text.map({$0 ?? ""})
            .bind(to: viewModel.anotherInputText)
            .disposed(by: disposeBag)
        
        viewModel.isChecked.bind(to: btnLogin.rx.isEnabled)
            .disposed(by: disposeBag)
        
        viewModel.isChecked
            .subscribe(onNext: { [weak self] isChecked in
                self?.lblOutput?.text = isChecked ? "Available" : "Not Available"
                self?.lblOutput.textColor = isChecked ? .green : .red
                print(isChecked)
                
            })
            .disposed(by: disposeBag)

        
    }

}

