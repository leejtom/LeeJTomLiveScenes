//
//  BlueView.h
//  LeeJTomLiveScenes
//
//  Created by lijingtong on 2021/6/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BlueView : UIView <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UICollectionView *collectionView;

@end

NS_ASSUME_NONNULL_END
