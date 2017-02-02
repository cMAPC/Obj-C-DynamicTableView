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
    [self.tableView setRowHeight:UITableViewAutomaticDimension];
    [self.tableView setEstimatedRowHeight:250];
    
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

    cell.cellImage.image = [UIImage imageNamed:@"image3.jpg"];
    
    correctedHeight = 375 / cell.cellImage.image.size.width * cell.cellImage.image.size.height;
    
    [cell.cellImage removeConstraint: cell.cellImage.constraints.lastObject] ;
    
    self.prototypeCell = cell;
    
    [cell updateConstraintsIfNeeded];
    [self updateViewConstraints];
    return cell;
}


#pragma mark - UITableViewDelegate


@end