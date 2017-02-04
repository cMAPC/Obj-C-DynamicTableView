//
//  TableViewController.m
//  TableViewDynamicSize
//


#import "TableViewController.h"

@interface TableViewController () {
    NSUInteger correctedHeight;
}

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initTableWithCustomCell];
    
    [self.tableView setContentInset:UIEdgeInsetsMake(44.f, 0.f, 44.f, 0.f)];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.tableView setRowHeight:UITableViewAutomaticDimension];
    [self.tableView setEstimatedRowHeight:500];
    
}


-(void)updateViewConstraints {
    [super updateViewConstraints];
       [self.prototypeCell.cellImage addConstraint:[NSLayoutConstraint constraintWithItem:self.prototypeCell.cellImage attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant: correctedHeight]];
}


-(void)initTableWithCustomCell {
    [self.tableView registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil] forCellReuseIdentifier:@"CustomCell"];
}


#pragma mark - UITableView DataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 15;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"CustomCell" ];
    
    cell.cellImage.image = [UIImage imageNamed:@"imageLeft"];
    cell.profileImageView.image = [UIImage imageNamed:@"imageRight"];
    cell.label.text = @"Sunset in Rome is Wonderful";
    
    cell.profileName.text = @"Radu Spataru";
    [cell.eventPlace setFont:[UIFont systemFontOfSize:6]];
    cell.eventPlace.text = @"Piazza del Popolo";
   
    [self getCorrectedImageHeightForCell:cell];
    
    return cell;
}

#pragma mark - UITableViewDelegate



#pragma mark - ImageConstrains

-(void)getCorrectedImageHeightForCell:(TableViewCell *) cell {
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    if(cell.cellImage.image.size.width >= width) {
        
        correctedHeight = (width - 40)/ cell.cellImage.image.size.width * cell.cellImage.image.size.height;
        self.prototypeCell = cell;
        //        [cell.cellImage removeConstraint: cell.cellImage.constraints.lastObject];
        
        [self updateViewConstraints];
    }
}


-(CGFloat)adjustFontSize:(TableViewCell *) cell {
    
    NSLog(@"Name labele = %f, EventLabel = %f", cell.profileName.frame.size.width, cell.eventPlace.frame.size.width);
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width - 206, 15)];
    label.text = @"Radu Spataru at Piazza del Popolo";
    float largestFontSize = 12;
  
    while ([label.text sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:largestFontSize]}].width > label.frame.size.width)
    {
        largestFontSize--;
        NSLog(@"%f", largestFontSize);
    }
//    label.font = [UIFont systemFontOfSize:largestFontSize];
    return largestFontSize;
}

@end
;
