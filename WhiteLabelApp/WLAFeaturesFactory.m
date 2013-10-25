//
//  WLAFeaturesFactory.m
//  WhiteLabelApp
//
//  Created by Igor on 10/9/13.
//  Copyright (c) 2013 Sitecore. All rights reserved.
//

#import "WLAFeaturesFactory.h"
#import "WLAMapViewController.h"
#import "WLAContactsViewController.h"
#import "WLAImageViewController.h"
#import "WLAHardwareViewController.h"
#import "WLASwipeViewController.h"
#import "WLAAuthViewController.h"
#import "WLAAirDropViewController.h"
#import "WLASharingViewController.h"
#import "WLAQRCodeViewController.h"
#import "WLAItemsViewController.h"
#import "WLAMediaItemsViewController.h"
#import "WLAItemsTableViewController.h"

@implementation WLAFeaturesFactory
{
    NSDictionary *features;
}

-(id)init
{
    if (self = [super init])
    {
        features =
        @{
             @"Map"                         :[WLAMapViewController          class],
             @"Contacts"                    :[WLAContactsViewController     class],
             @"Image"                       :[WLAImageViewController        class],
             @"Hardware"                    :[WLAHardwareViewController     class],
             @"Swipe"                       :[WLASwipeViewController        class],
             @"Authentication"              :[WLAAuthViewController         class],
             @"AirDrop"                     :[WLAAirDropViewController      class],
             @"Sharing"                     :[WLASharingViewController      class],
             @"QRCode reader"               :[WLAQRCodeViewController       class],
             @"Items manipulation"          :[WLAItemsViewController        class],
             @"Media items manipulation"    :[WLAMediaItemsViewController   class],
             @"Hybrid model"                :[WLAItemsTableViewController   class],
        };
    }
    
    return self;
}

-(NSArray *)featuresList
{
    return [[features allKeys] sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2)
    {
        return [obj1 caseInsensitiveCompare:obj2];
    }];
}

-(UIViewController *)featureViewControllerForKey:(NSString *)key
{
    Class cls = [features objectForKey:key];

    UIViewController *featureController = [[cls  alloc] initWithNibName:nil bundle:nil];
    
    return featureController;
}

@end