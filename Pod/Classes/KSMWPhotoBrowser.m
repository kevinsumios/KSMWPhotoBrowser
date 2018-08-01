//
//  KSMWPhotoBrowser.m
//
//  Created by Kevin Sum on 18/07/2018.
//  Copyright © 2018 Kevin Sum. All rights reserved.
//

#import "KSMWPhotoBrowser.h"

@interface KSMWPhotoBrowser ()

@property (nonatomic) UIActivityViewController *activityViewController;

@end

@implementation KSMWPhotoBrowser

- (id)initWithDelegate:(id<KSMWPhotoBrowserDelegate>)delegate {
    self._delegate = delegate;
    self.displayShareButton = YES;
    self.displayTrashButton = YES;
    _shareButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(shareButtonPressed:)];
    _trashButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(trashButtonPressed:)];
    self = [super initWithDelegate:delegate];
    if (self) {
        return self;
    } else {
        return nil;
    }
}

- (void)reloadData {
    [super reloadData];
    [self customView];
}

- (void)customView {
    // Do any additional setup after loading the view.
    NSMutableArray *barItems = [[NSMutableArray alloc] initWithArray:self.toolbar.items];
    // Remove origin action button
    if (self.displayActionButton) {
        [barItems removeLastObject];
    }
    // Add share button in first place
    if (self.displayShareButton) {
        [barItems insertObject:_shareButton atIndex:0];
    }
    // Add trash button in the last place
    if (self.displayTrashButton) {
        [barItems addObject:_trashButton];
    }
    [self.toolbar setItems:[barItems copy]];
}

#pragma mark - Actions
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
- (void)trashButtonPressed:(id)sender {
    if ([self._delegate respondsToSelector:@selector(photoBrowser:trashButtonPressedForPhotoAtIndex:)]) {
        [self._delegate ksPhotoBrowser:self trashButtonPressedForPhotoAtIndex:self.currentIndex];
    }
}
#pragma clang diagnostic pop

- (void)shareButtonPressed:(id)sender {
    // Only react when image has loaded
    id <MWPhoto> photo = [self.photos objectAtIndex:self.currentIndex];
    if ([self.photos count] > 0 && [photo underlyingImage]) {
        // Show activity view controller
        NSMutableArray *items = [NSMutableArray arrayWithObject:[photo underlyingImage]];
        if (photo.caption) {
            [items addObject:photo.caption];
        }
        self.activityViewController = [[UIActivityViewController alloc] initWithActivityItems:items applicationActivities:nil];
        typeof(self) __weak weakSelf = self;
        [weakSelf setAlwaysShowControls:YES];
        [self.activityViewController setCompletionWithItemsHandler:^(NSString * __nullable activityType, BOOL completed, NSArray * __nullable returnedItems, NSError * __nullable activityError) {
            [weakSelf setAlwaysShowControls:NO];
        }];
        self.activityViewController.popoverPresentationController.barButtonItem = _shareButton;
        [self presentViewController:self.activityViewController animated:YES completion:nil];
    }
}

@end
