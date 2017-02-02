//
//  TableViewController.h
//  TableViewDynamicSize
//

#import <UIKit/UIKit.h>
#import "TableViewCell.h"

@interface TableViewController : UITableViewController

@property (weak, nonatomic) TableViewCell* prototypeCell;

@end
