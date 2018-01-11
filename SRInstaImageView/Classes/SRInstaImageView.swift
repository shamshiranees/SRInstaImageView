//
//  SRInstaImageView.swift
//  Pods-SRInstaImageView_Example
//
//  Created by Shamshir on 11/01/18.
//

import UIKit


public class SRInstaImageView: UIImageView {
    
    public lazy var collectionView:UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    public lazy var tableView : UITableView = UITableView(frame: CGRect.zero)
    private lazy var BgView = UIVisualEffectView.init(effect: UIBlurEffect.init(style: .light))
    private lazy var contentView = UIView()
    private lazy var titleLabel = UILabel()
    private lazy var subTitleLabel = UILabel()
    private lazy var ImageView = UIImageView()
    private lazy var iconImageView = UIImageView()
    
    
    
    public lazy var indexPathOFCell: IndexPath = [0,0]
    public lazy var mainTitle = ""
    public lazy var subTitle = ""
    public lazy var iconImage = UIImage()
    
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        self.isUserInteractionEnabled = true
        let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(longTap(_:)))
        self.addGestureRecognizer(longGesture)
    }
    
    
    
    fileprivate func currentViewController() -> UIViewController? {
        
        var presentedWindow = UIApplication.shared.keyWindow?.rootViewController
        while let pWindow = presentedWindow?.presentedViewController
        {
            presentedWindow = pWindow
        }
        
        return presentedWindow
    }
    @objc func longTap(_ sender: UIGestureRecognizer){
        
        if sender.state == .ended {
            removeFrame()
        }
        else if sender.state == .began {
            showView()
        }
    }
    var orgin = CGPoint(x: 0, y: 0)
    private func showView(){
        
        self.BgView.frame = CGRect(x: 0, y: 0,width: (self.currentViewController()?.view.frame.width)!, height: (self.currentViewController()?.view.frame.height)!)
        
        BgView.layer.masksToBounds = true
        
        
        if collectionView.frame.height > 1 {
            
            let rect:UICollectionViewLayoutAttributes! = collectionView.layoutAttributesForItem(at: indexPathOFCell)
            let cellFrameInSuperview:CGRect!  = collectionView.convert(rect.frame, to: collectionView.superview)
            
            contentView.center = cellFrameInSuperview.origin
            orgin = CGPoint(x: cellFrameInSuperview.midX, y: cellFrameInSuperview.midY) //cellFrameInSuperview.origin
        }else if tableView.frame.height > 1{
            
            let rect = self.tableView.rectForRow(at: indexPathOFCell)
            let rectInScreen = self.tableView.convert(rect, to: tableView.superview)
            contentView.center = rectInScreen.origin
            orgin = CGPoint(x: rectInScreen.midX, y: rectInScreen.midY)
        }else{
            
            
            contentView.center = self.center
            orgin = self.center
            
        }
        
        
        
        
        
        
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
        contentView.backgroundColor = UIColor.white
        titleLabel.textAlignment = .left
        titleLabel.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 12)
        titleLabel.numberOfLines = 1
        self.titleLabel.frame = CGRect(x: 50, y: 0, width: 0, height: 0)
        
        subTitleLabel.textAlignment = .left
        subTitleLabel.font = UIFont(name: "AppleSDGothicNeo-Light", size: 11)
        subTitleLabel.numberOfLines = 1
        self.subTitleLabel.frame = CGRect(x: 50, y: 0, width: 0, height: 0)
        
        self.iconImageView.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        self.iconImageView.layer.cornerRadius = 14
        self.iconImageView.layer.masksToBounds = true
        self.iconImageView.image = iconImage
        
        ImageView.frame = CGRect(x: 0, y: 0, width: contentView.frame.width, height: contentView.frame.height)
        ImageView.image = self.image
        ImageView.layer.masksToBounds = true
        ImageView.contentMode = .scaleAspectFill
        BgView.contentView.addSubview(contentView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subTitleLabel)
        contentView.addSubview(ImageView)
        contentView.addSubview(iconImageView)
        currentViewController()?.view.addSubview(BgView)
        var height = ((self.currentViewController()?.view.frame.width)!-100)*(self.image?.size.height)!/(self.image?.size.width)!
        if (self.currentViewController()?.view.frame.height)!-(height+50) < 100 {
            
            height = (self.currentViewController()?.view.frame.height)!-200
            
        }
        UIView.animate(withDuration: 0.3, animations: {
            self.contentView.frame = CGRect(x: 0, y: 0, width: (self.currentViewController()?.view.frame.width)!-100, height: height+50)
            //CGSize(
            self.contentView.center = self.BgView.center
            self.titleLabel.frame = CGRect(x: 50, y: 14, width: self.contentView.frame.width, height: 12)
            self.subTitleLabel.frame = CGRect(x: 50, y: 26, width: self.contentView.frame.width, height: 12)
            self.ImageView.frame = CGRect(x: 0, y: 50, width: self.contentView.frame.width, height: height)
            
            self.iconImageView.frame = CGRect(x: 10, y: 11, width: 28, height: 28)
            
        }) { (true) in
            self.titleLabel.text = self.mainTitle
            self.subTitleLabel.text = self.mainTitle
            
        }
    }
    
    private func removeFrame(){
        
        
        
        UIView.animate(withDuration: 0.3, animations: {
            self.contentView.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
            self.contentView.center = self.orgin
            self.ImageView.frame = CGRect(x: 0, y: 0, width: self.contentView.frame.width, height: self.contentView.frame.height)
            
        }) { (true) in
            self.BgView.removeFromSuperview()
            
        }
        
        
    }
}
