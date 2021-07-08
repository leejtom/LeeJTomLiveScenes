//
//  RedView.m
//  LeeJTomLiveScenes
//
//  Created by lijingtong on 2021/6/12.
//

#import "RedView.h"

@interface RedView()

@property (nonatomic, strong) UIView *menuView;
// 数据
@property (nonatomic, assign) CGSize menuSize;

@end

@implementation RedView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
//        self.userInteractionEnabled = NO;
        _menuView = [UIView new];
        _menuView.backgroundColor = [UIColor blueColor];
//        [self addSubview:_menuView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
//    CGRect frame = self.bounds;
//
//    frame.size.height -= 8;
//    frame.size.width -= 8;
//    frame.origin.y += 8;
//    frame.origin.x = 4;
//
//    self.menuSize = frame.size;
//    self.menuView.frame = frame;
//
//    frame.origin.y = 4;
//
    UIBezierPath *bezierPath = [self BezierPathWithSize:self.menuSize];
    CAShapeLayer* shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = bezierPath.CGPath;
    _menuView.layer.mask = shapeLayer;
}

//- (void)drawRect:(CGRect)rect {
//    UIColor *color = [UIColor redColor];
//    // 设置线条颜色
//    [color set];
//
//    UIBezierPath *path = [UIBezierPath bezierPath];
//
//    path.lineWidth = 5.0;
//    path.lineCapStyle = kCGLineCapRound;
//    path.lineJoinStyle = kCGLineJoinRound;
//
//    [path moveToPoint:CGPointMake(0, 150)];
//    [path addQuadCurveToPoint:CGPointMake(140, 200) controlPoint:CGPointMake(20, 40)];
//
//    [path stroke];
//}


- (UIBezierPath *)BezierPathWithSize:(CGSize)size {
    CGFloat conner = size.height / 2;
    CGFloat trangleHeight = 8.0;
    CGFloat trangleWidthForHalf = 6.0;

    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:CGPointMake(conner, trangleHeight)];
    [bezierPath addLineToPoint:CGPointMake(size.width/2. - trangleWidthForHalf, trangleHeight)];
    [bezierPath addLineToPoint:CGPointMake(size.width/2., 0)];
    [bezierPath addLineToPoint:CGPointMake(size.width/2. + trangleWidthForHalf, trangleHeight)];
    [bezierPath addLineToPoint:CGPointMake(size.width-conner, trangleHeight)];
    [bezierPath addQuadCurveToPoint:CGPointMake(size.width, conner + trangleHeight) controlPoint:CGPointMake(size.width, trangleHeight)];
    [bezierPath addLineToPoint:CGPointMake(size.width, size.height-conner)];
    [bezierPath addQuadCurveToPoint:CGPointMake(size.width-conner, size.height) controlPoint:CGPointMake(size.width, size.height)];
    [bezierPath addLineToPoint:CGPointMake(conner, size.height)];
    [bezierPath addQuadCurveToPoint:CGPointMake(0, size.height-conner) controlPoint:CGPointMake(0, size.height)];
    [bezierPath addLineToPoint:CGPointMake(0, conner + trangleHeight)];
    [bezierPath addQuadCurveToPoint:CGPointMake(conner, trangleHeight) controlPoint:CGPointMake(0, trangleHeight)];
    [bezierPath closePath];
    return bezierPath;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    
//    return self.blueView;
    UIView *view = [super hitTest:point withEvent:event];
    CGPoint tempPoint = [self convertPoint:point toView:self];
    if (tempPoint.y > 100 && tempPoint.y < 300) {
        return nil;
    } else {
        return view;
    }
//    if (self.blueView) {

//        if ([self.blueView.collectionView pointInside:tempPoint withEvent:event]) {
//            return self.blueView.collectionView;
//        }
//    }
////    if (self.linkMicAreaView.windowsView.collectionView && self.linkMicAreaView.windowsView.showLinkMicUserCount >1) {
////        CGPoint buttonPoint = [self convertPoint:point toView:self.linkMicAreaView.windowsView.collectionView];
////        if ([self.linkMicAreaView.windowsView.collectionView pointInside:buttonPoint withEvent:event]) {
////            return self.linkMicAreaView.windowsView.collectionView;
////        }
////    }
//
//    return view;
}
@end
