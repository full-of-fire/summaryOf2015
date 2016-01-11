//
//  UITableView+EmptyData.h
//  UITableView(EmptyData)
//
//  Created by  jason on 15/11/2.
//  Copyright © 2015年 renlairenwang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (EmptyData)

- (void)tableViewDisplayMessage:(NSString*)message ifNecessagryForRowCount:(NSUInteger)rowCount;

@end
