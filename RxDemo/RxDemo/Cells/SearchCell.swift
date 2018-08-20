//
//  SearchCell.swift
//  RxDemo
//
//  Created by Muhammad Amir Pervaiz on 8/19/18.
//  Copyright © 2018 Muhammad Amir Pervaiz. All rights reserved.
//

import UIKit
import RxSwift
import SDWebImage

class SearchCell: UITableViewCell {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var overview: UILabel!
    private var disposeBag = DisposeBag()

    var viewModel: SearchCellViewModelType = SearchCellViewModel()
    
    override func awakeFromNib() {
        bindViewModel()
        super.awakeFromNib()
        // Initialization code
    }

    func configureWith(_ value: Movie) {
        self.viewModel.inputs.configure(value)
    }
    
    func bindViewModel() {
        self.viewModel.outputs.title.asDriver(onErrorJustReturn: "").drive(self.name.rx.text).disposed(by: self.disposeBag)
        
        self.viewModel.outputs.overView.asDriver(onErrorJustReturn: "").drive(self.overview.rx.text).disposed(by: self.disposeBag)

        self.viewModel.outputs.date.asDriver(onErrorJustReturn: "").drive(self.releaseDate.rx.text).disposed(by: self.disposeBag)
        
        self.viewModel.outputs.image.asDriver(onErrorJustReturn: URL.init(string: "place_holder")!).drive(onNext: { [weak self] (url) in
            self?.movieImageView.sd_setImage(with: URL.init(string: "https://image.tmdb.org/t/p/w500\(url)") , completed: nil)
        }).disposed(by: self.disposeBag)
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
