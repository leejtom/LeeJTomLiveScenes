//
//  JTomLoginViewController.m
//  LeeJTomLiveScenes
//
//  Created by mac on 2021/3/26.
//

#import "JTomLoginViewController.h"

#import <PolyvFoundationSDK/PLVProgressHUD.h>
#import "PLVRoomLoginClient.h"
#import "PLVRoomDataManager.h"

#import "PLVLCCloudClassViewController.h"
#import "PLVECWatchRoomViewController.h"
//#import "PLVLSStreamerViewController.h"
//#import "PLVSAStreamerViewController.h"

//#import "PLVBugReporter.h"

#import "RedView.h"
#import "BlueView.h"

#import <WebViewJavascriptBridge/WebViewJavascriptBridgeBase.h>
#import <PolyvFoundationSDK/PLVFWebViewJavascriptBridgeBase.h>

#define PushOrModel 1 // 进入页面方式（1-push、0-model）

typedef void (^CloudClassSuccessBlock) (void);
typedef void (^EcommerceLiveSuccessBlock) (void);


@interface JTomLoginViewController ()<WebViewJavascriptBridgeBaseDelegate>

@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) NSString *appId;
@property (nonatomic, copy) NSString *appSecret;
@property (nonatomic, copy) NSString *channelId;
@property (nonatomic, copy) NSString *vid;
@property (nonatomic, copy) NSString *password;

@property (nonatomic, strong) RedView *redView;
@property (nonatomic, strong) BlueView *blueView;

@property (nonatomic, copy) CloudClassSuccessBlock cloudClassSuccessBlock;
@property (nonatomic, copy) EcommerceLiveSuccessBlock ecommerceLiveSuccessBlock;

@property (nonatomic, strong) WebViewJavascriptBridgeBase *wvjb;
@property (nonatomic, strong) PLVFWebViewJavascriptBridgeBase *plvwvjb;

@end

@implementation JTomLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.view.backgroundColor = [UIColor colorWithWhite:1 alpha:0.5];
    
    _blueView = [[BlueView alloc] initWithFrame:self.view.bounds];
//    [self.view addSubview:_blueView];
    
    _redView = [[RedView alloc] initWithFrame:self.view.bounds];
//    _redView = [[RedView alloc] initWithFrame:CGRectMake(100, 200,  173, 50)];
//    _redView.blueView = _blueView;
    
//    [self.view addSubview:_redView];
    
    self.userId = @"9d5931ce53";
    self.appId = @"fwztgdwydc";
    self.appSecret = @"32574c9d03df4ea481a9b1218cd3cd9a";

//    self.appId = @"ej7xw7pl1e";
//    self.userId = @"8754c4f116";
//    self.appSecret = @"78f73d576a064f91b5598ffc8d556e4c";

    
    __weak typeof(self) weakSelf = self;
    self.cloudClassSuccessBlock = ^{// 登录成功页面跳转回调
        PLVLCCloudClassViewController * cloudClassVC = [[PLVLCCloudClassViewController alloc] init];
        if (PushOrModel) {
            [weakSelf.navigationController pushViewController:cloudClassVC animated:YES];
        }else{
            cloudClassVC.modalPresentationStyle = UIModalPresentationFullScreen;
            [weakSelf presentViewController:cloudClassVC animated:YES completion:nil];
        }
        
//    #if OpenBugly
//        PLVRoomUser *roomUser = [PLVRoomDataManager sharedManager].roomData.roomUser;
//        [PLVBugReporter setUserIdentifier:roomUser.viewerId];
//    #endif
        
    };
    
    self.ecommerceLiveSuccessBlock = ^{
        PLVECWatchRoomViewController * watchLiveVC = [[PLVECWatchRoomViewController alloc] init];
        if (PushOrModel) {
            [weakSelf.navigationController pushViewController:watchLiveVC animated:YES];
        }else{
            watchLiveVC.modalPresentationStyle = UIModalPresentationFullScreen;
            [weakSelf presentViewController:watchLiveVC animated:YES completion:nil];
        }

//    #if OpenBugly
//        PLVRoomUser *roomUser = [PLVRoomDataManager sharedManager].roomData.roomUser;
//        [PLVBugReporter setUserIdentifier:roomUser.viewerId];
//    #endif
    };
    
}


//- (void)loginStreamerRoomWithCompletionHandler:(void (^)(void))completion {
//    NSString *nickName = @"LeeJTomDemo";
//
//
//    PLVProgressHUD *hud = [PLVProgressHUD showHUDAddedTo:[UIApplication sharedApplication].delegate.window animated:YES];
//    [hud.label setText:@"登录中..."];
//
//    __weak typeof(self)weakSelf = self;
//    [PLVRoomLoginClient loginStreamerRoomWithChannelType:PLVChannelTypePPT | PLVChannelTypeAlone
//                                               channelId:self.channelId
//                                                password:self.password
//                                                nickName:nickName
//                                              completion:^{
//
//        PLVRoomData *roomData = [PLVRoomDataManager sharedManager].roomData;
//
//        if (roomData.channelType == PLVChannelTypePPT) {
//            PLVLSStreamerViewController *vctrl = [[PLVLSStreamerViewController alloc] init];
//            vctrl.modalPresentationStyle = UIModalPresentationFullScreen;
//            [weakSelf presentViewController:vctrl animated:YES completion:nil];
//        } else if (roomData.channelType == PLVChannelTypeAlone) {
//            PLVSAStreamerViewController *vctrl = [[PLVSAStreamerViewController alloc] init];
//            vctrl.modalPresentationStyle = UIModalPresentationFullScreen;
//            [weakSelf presentViewController:vctrl animated:YES completion:nil];
//        }
//
//        [hud hideAnimated:YES];
//        if (completion) {
//            completion();
//        }
//    } failure:^(NSString * _Nonnull errorMessage) {
//        [hud hideAnimated:YES];
//
//        PLVProgressHUD *hud = [PLVProgressHUD showHUDAddedTo:weakSelf.view animated:YES];
//        hud.mode = PLVProgressHUDModeText;
//        hud.label.text = errorMessage;
//        hud.detailsLabel.text = nil;
//        [hud hideAnimated:YES afterDelay:2.0];
//    }];
//}


#pragma mark 纯视频开播
- (IBAction)StreamerAloneSceneACtion:(id)sender {
    self.channelId = @"2415662";
    self.password = @"nQ4KDj";
    
//    [self loginStreamerRoomWithCompletionHandler:^{
//
//    }];
}

#pragma mark 三分屏开播
- (IBAction)streamerSceneAction:(id)sender {
    self.channelId = @"2415634";
    self.password = @"errk9L";
    
//    [self loginStreamerRoomWithCompletionHandler:^{
//        
//    }];
}

//直播带货-回放
- (IBAction)EcommercePlaybackAction:(id)sender {
    self.channelId = @"2219973";//直播带货
    self.vid = @"9d5931ce53276617407d1d0f767b3f74_9";
    
    [self loginEcommercePlaybackRoomWithChannelType:PLVChannelTypeAlone successHandler:self.ecommerceLiveSuccessBlock];
}
//直播带货-直播
- (IBAction)ecommerceLiveRoomAction:(id)sender {
//    self.channelId = @"2219973";//直播带货
//    self.vid = @"9d5931ce53276617407d1d0f767b3f74_9";
    
        self.channelId = @"103117";//三分屏
        self.vid = @"e73df8530a538612f33ce76ca17cfc69_e";
    
    [self loginEcommerceLiveRoomWithChannelType:PLVChannelTypeAlone successHandler:self.ecommerceLiveSuccessBlock];
}

//云课堂场景-直播回放
- (IBAction)loginVideo:(id)sender {
    self.channelId = @"2219778";//三分屏
    self.vid = @"9d5931ce535c56555c449d197c32e32b_9";


    
    [self loginCloudClassPlaybackRoomWithChannelType:PLVChannelTypePPT|PLVChannelTypeAlone successHandler:self.cloudClassSuccessBlock];
}

//云课堂场景-直播
- (IBAction)loginLive:(id)sender {
    self.channelId = @"2415634";//三分屏
    self.vid = @"9d5931ce535c56555c449d197c32e32b_9";
//        self.channelId = @"103117";//三分屏
//        self.vid = @"e73df8530a538612f33ce76ca17cfc69_e";
    [self loginCloudClassLiveRoomWithChannelType:PLVChannelTypePPT | PLVChannelTypeAlone successHandler:self.cloudClassSuccessBlock];
}


#pragma mark - 云课堂场景-直播间  -

/// 云课堂场景-直播间
- (void)loginCloudClassLiveRoomWithChannelType:(PLVChannelType)channelType
                                successHandler:(void (^)(void))successHandler {
    PLVProgressHUD *hud = [PLVProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    [hud.label setText:@"登录中..."];
    
    __weak typeof(self)weakSelf = self;
    [PLVRoomLoginClient loginLiveRoomWithChannelType:channelType
                                           channelId:self.channelId
                                              userId:self.userId
                                               appId:self.appId
                                           appSecret:self.appSecret
                                            roomUser:^(PLVRoomUser * _Nonnull roomUser){
    } completion:^(PLVViewLogCustomParam * _Nonnull customParam) {
        [hud hideAnimated:YES];
//        [weakSelf saveParamsToFile];
        
        if (successHandler) {
            successHandler();
        }
    } failure:^(NSString * _Nonnull errorMessage) {
        [hud hideAnimated:YES];
        [weakSelf showHud:errorMessage detail:nil];
    }];
}



/// 云课堂场景-直播回放
- (void)loginCloudClassPlaybackRoomWithChannelType:(PLVChannelType)channelType
                                    successHandler:(void (^)(void))successHandler {
    PLVProgressHUD *hud = [PLVProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    [hud.label setText:@"登录中..."];
    
    __weak typeof(self)weakSelf = self;
    [PLVRoomLoginClient loginPlaybackRoomWithChannelType:channelType
                                               channelId:self.channelId
                                                     vid:self.vid
                                                  userId:self.userId
                                                   appId:self.appId
                                               appSecret:self.appSecret roomUser:^(PLVRoomUser * _Nonnull roomUser) {
        
    } completion:^(PLVViewLogCustomParam * _Nonnull customParam) {
        
    } failure:^(NSString * _Nonnull errorMessage) {
        
    }];
    
    [PLVRoomLoginClient loginPlaybackRoomWithChannelType:channelType
                                               channelId:self.channelId
                                                     vid:self.vid
                                                  userId:self.userId
                                                   appId:self.appId
                                               appSecret:self.appSecret
                                                roomUser:^(PLVRoomUser * _Nonnull roomUser){
//        PLVRoomUser *roomUser = [[PLVRoomUser alloc] initWithViewerId:nil viewerName:nil viewerAvatar:nil viewerType:PLVRoomUserTypeSlice];
//        return roomUser;
    } completion:^(PLVViewLogCustomParam * _Nonnull customParam) {
        [hud hideAnimated:YES];
//        [weakSelf saveParamsToFile];
        
        if (successHandler) {
            successHandler();
        }
    } failure:^(NSString * _Nonnull errorMessage) {
        [hud hideAnimated:YES];
        [weakSelf showHud:errorMessage detail:nil];
    }];
}


#pragma mark - 直播带货场景  -
/// 直播带货场景-直播间
- (void)loginEcommerceLiveRoomWithChannelType:(PLVChannelType)channelType
                               successHandler:(void (^)(void))successHandler {
    PLVProgressHUD *hud = [PLVProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    [hud.label setText:@"登录中..."];
    
    __weak typeof(self)weakSelf = self;
    [PLVRoomLoginClient loginLiveRoomWithChannelType:channelType
                                           channelId:self.channelId
                                              userId:self.userId
                                               appId:self.appId
                                           appSecret:self.appSecret
                                            roomUser:nil
                                          completion:^(PLVViewLogCustomParam * _Nonnull customParam) {
        [hud hideAnimated:YES];
//        [weakSelf saveParamsToFile];
        
        if (successHandler) {
            successHandler();
        }
    } failure:^(NSString * _Nonnull errorMessage) {
        [hud hideAnimated:YES];
        [weakSelf showHud:errorMessage detail:nil];
    }];
}

/// 直播带货场景-直播间
- (void)loginEcommercePlaybackRoomWithChannelType:(PLVChannelType)channelType
                                   successHandler:(void (^)(void))successHandler {
    PLVProgressHUD *hud = [PLVProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    [hud.label setText:@"登录中..."];
    
    __weak typeof(self)weakSelf = self;
    [PLVRoomLoginClient loginPlaybackRoomWithChannelType:channelType
                                               channelId:self.channelId
                                                     vid:self.vid
                                                  userId:self.userId
                                                   appId:self.appId
                                               appSecret:self.appSecret
                                                roomUser:nil
                                              completion:^(PLVViewLogCustomParam * _Nonnull customParam) {
        [hud hideAnimated:YES];
//        [weakSelf saveParamsToFile];
        
        if (successHandler) {
            successHandler();
        }
    } failure:^(NSString * _Nonnull errorMessage) {
        [hud hideAnimated:YES];
        [weakSelf showHud:errorMessage detail:nil];
    }];
}


- (void)showHud:(NSString *)message detail:(NSString *)detail {
    PLVProgressHUD *hud = [PLVProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = PLVProgressHUDModeText;
    hud.label.text = message;
    hud.detailsLabel.text = detail;
    [hud hideAnimated:YES afterDelay:3.0];
}

@end
