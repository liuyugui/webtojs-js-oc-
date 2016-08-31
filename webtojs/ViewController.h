//
//  ViewController.h
//  webtojs
//
//  Created by 法大大 on 16/8/23.
//  Copyright © 2016年 fadada. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>


@protocol JSObjDeletegate <JSExport>

- (void)call;
- (void)getCall:(NSString *)callString;
- (void)pushVC;

@end


@interface ViewController : UIViewController<JSObjDeletegate,UIWebViewDelegate>

/**
 描述：
 */
@property(nonatomic,strong)JSContext * jsContext;

@end

