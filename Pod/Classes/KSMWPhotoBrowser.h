//
//  KSMWPhotoBrowser.h
//
//  Created by Kevin Sum on 18/07/2018.
//  Copyright © 2018 Kevin Sum. All rights reserved.
//
//  It is an extention of MWPhotoBrowser
//  All the custom methods are defined
//  in this class.

#import "MWPhotoBrowser.h"

@class KSMWPhotoBrowser;

@protocol KSMWPhotoBrowserDelegate <MWPhotoBrowserDelegate>
@optional
- (void)ksPhotoBrowser:(KSMWPhotoBrowser *)photoBrowser trashButtonPressedForPhotoAtIndex:(NSUInteger)index;
@end

@interface KSMWPhotoBrowser : MWPhotoBrowser
@property (nonatomic) id<KSMWPhotoBrowserDelegate> _delegate;
@property (nonatomic) UIBarButtonItem *shareButton;
@property (nonatomic) UIBarButtonItem *trashButton;
@property (nonatomic) BOOL displayShareButton;
@property (nonatomic) BOOL displayTrashButton;

@end
