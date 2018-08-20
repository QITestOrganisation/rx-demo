//
//  SearchViewController.swift
//  RxDemo
//
//  Created by Muhammad Amir Pervaiz on 8/19/18.
//  Copyright © 2018 Muhammad Amir Pervaiz. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources
class SearchViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    
    var viewModel: SearchViewModelType = SearchViewModel(Environment.environment)
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        
        tableView.estimatedRowHeight = 100.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
        self.bindViewModel()
        
        self.viewModel.inputs.viewdidLoad()
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func bindViewModel()  {
        
        self.viewModel.outputs.moviesList
            .bind(to: tableView.rx.items(cellIdentifier: "SearchCell", cellType: SearchCell.self)) { (row, element, cell) in
                cell.configureWith(element)
            }
            .disposed(by: disposeBag)
        
        self.viewModel.outputs.showIndicatorView.asDriver(onErrorJustReturn: ()).drive(onNext: { [weak self] _ in
            self?.indicatorView.startAnimating()
        }).disposed(by: self.disposeBag)
        
        self.viewModel.outputs.hideIndicatorView.asDriver(onErrorJustReturn: ()).drive(onNext: { [weak self] _ in
            self?.indicatorView.stopAnimating()
        }).disposed(by: self.disposeBag)
        
        self.viewModel.outputs.isErrorOccured.asDriver(onErrorJustReturn:"").drive(onNext: { [weak self] error in
            let alert = UIAlertController(title: "", message: error, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
            self?.present(alert, animated: true)
        }).disposed(by: self.disposeBag)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
