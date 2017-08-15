//
//  UIScrollView+PeerRefresh.h
//  EmptyDemo
//
//  Created by Apple on 2017/8/15.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MJRefresh.h>
@interface UIScrollView (PeerRefresh)
- (void)setRefreshWithHeaderBlock:(void(^)())headerBlock
                      footerBlock:(void(^)())footerBlock;

//下拉刷新
- (void)setOnlyRefreshWithHeaderBlock:(void (^)())headerBlock;
//上拉加载更多
- (void)setRefreshWithFooterBlock:(void (^)())footerBlock;
- (void)headerBeginRefreshing;
- (void)headerEndRefreshing;
- (void)footerEndRefreshing;
- (void)footerNoMoreData;

- (void)hideHeaderRefresh;
- (void)hideFooterRefresh;
@end
