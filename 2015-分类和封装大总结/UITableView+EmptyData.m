//
//  UITableView+EmptyData.m
//  UITableView(EmptyData)
//
//  Created by  jason on 15/11/2.
//  Copyright © 2015年 renlairenwang. All rights reserved.
//

#import "UITableView+EmptyData.h"

@implementation UITableView (EmptyData)

- (void)tableViewDisplayMessage:(NSString*)message ifNecessagryForRowCount:(NSUInteger)rowCount {

    if (rowCount == 0) {
        //没有数据的时候显示
        UILabel *messageLabel = [[UILabel alloc] init];
        messageLabel.text = message;
        messageLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
        messageLabel.textColor = [UIColor lightGrayColor];
        messageLabel.textAlignment = NSTextAlignmentCenter;
        
        [messageLabel sizeToFit];
        
        self.backgroundView = messageLabel;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableHeaderView.hidden = YES;
        
    }
    else {
    
        self.backgroundView = nil;
        self.tableHeaderView.hidden = NO;
        self.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    }
}

@end
