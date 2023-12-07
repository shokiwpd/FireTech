//
//  newsView.swift
//  FireTech
//
//  Created by Павел Уланов on 09.02.2023.
//

import Foundation
import UIKit


class newsView: UIView  {
    
    weak var rootVC: NewsViewController?
    
    let newsViewCollection = newsCollection()
    //MARK: Функция которая создает UICollectionView в сториборде
    func addViewCollection(_ view: UIView){
        view.addSubview(newsViewCollection)
    }
    //MARK: Функция для расположения UICollectionView на сториборде
    func layoutViewCollection(_ view: UIView) {
        newsViewCollection.positionOfElements(view.topAnchor, 0,

                                              view.leadingAnchor, 0,
                                              view.trailingAnchor, 0,
                                              view.bottomAnchor, 0)
    }
}

//MARK: Создаем класс для настройки UICollectionView
class newsCollection: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    //MARK: создаем ссылку на контроллер в котором будет отображаться UICollectionView
    weak var newsCollectionView: NewsViewController?
    let newsDecodeJSON: [newsDecodable] = try! JSONDecoder().decode([newsDecodable].self, from: newsJSONData)
    
    init(){
        
        //MARK: инициализируем возможность графической настройки UICollectionView
        let collectionLayout = UICollectionViewFlowLayout()
        //MARK: задаем направление скролла
        collectionLayout.scrollDirection = .vertical
        //MARK: инициализируем UICollectionView
        super.init(frame: .zero, collectionViewLayout: collectionLayout)
        //MARK: подписываем протоколы
        delegate = self
        dataSource = self
        //MARK: register
        register(newsCollectionCell.self, forCellWithReuseIdentifier: newsCollectionCell.cellName)
        //MARK: Убираем горизонтальный индикатор
        showsHorizontalScrollIndicator = false
        collectionLayout.minimumLineSpacing = 20
        contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsDecodeJSON.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: newsCollectionCell.cellName, for: indexPath) as! newsCollectionCell
        cell.headerNews.text = newsDecodeJSON[indexPath.row].newsTitle
        cell.newsImage.image = UIImage(named:newsDecodeJSON[indexPath.row].newsImage)!
        cell.newsFirstText.text = newsDecodeJSON[indexPath.row].newsText
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Int(frame.width * 0.9), height: Int(frame.width * 0.9))//Int(frame.height * 0.5))
    }
}

//MARK: Создание и оформление UICollectionViewCell для UICollectionView
class newsCollectionCell: UICollectionViewCell {
    
    static let cellName = "newsCollectionCell"
    
    //MARK: Создаем элементы которые будут отображаться в ячейке
    let newsImage = UIImageView()

    private let blurView:UIView = {
       let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    var headerNews = headerLabel()
    let newsFirstText = initialTextLabel()
  
    //MARK: Распологаем элементы внутри ячейки
    override func layoutSubviews() {
        super.layoutSubviews()
        newsImage.positionOfElements(topAnchor, 0,
                                     leadingAnchor, 0,
                                     trailingAnchor, 0,
                                     bottomAnchor, 0)
        
        blurView.positionOfElements(topAnchor, CGFloat(Int(frame.width / 1.4)),
                                    leadingAnchor, 0,
                                    trailingAnchor, 0,
                                    bottomAnchor, 0)
        print(CGFloat(Int(frame.width / 1.2)))
        print(frame.width)
        headerNews.positionOfElements(blurView.topAnchor, 0,
                                      leadingAnchor, 10,
                                      trailingAnchor, -10,
                                      nil, 0)
        newsFirstText.positionOfElements(headerNews.bottomAnchor, 5,
                                         headerNews.leadingAnchor, 0,
                                         headerNews.trailingAnchor, 0,
                                         nil, 0)
        layerSetting()
        
    }
    //MARK: задаем оформление ячейки и создаем элементы внутри ячейки
    override init(frame: CGRect) {
        super.init(frame: frame)
        //Отредактивровать
        blurView.backgroundColor = .clear
        creatingElements([newsImage,blurView,headerNews,newsFirstText])
        blurView.createBlurEffect()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func layerSetting(){
        clipsToBounds = true
        layer.cornerRadius = 10
        newsImage.clipsToBounds = true
        newsImage.layer.masksToBounds = false        
    }
}


