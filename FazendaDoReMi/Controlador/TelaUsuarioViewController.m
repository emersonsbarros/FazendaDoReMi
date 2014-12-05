//
//  TelaUsuarioViewController.m
//  FazendaDoReMi
//
//  Created by Vinicius Resende Fialho on 30/11/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import "TelaUsuarioViewController.h"

@interface TelaUsuarioViewController ()

@end

@implementation TelaUsuarioViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)viewDidAppear:(BOOL)animated
{
     self.tableUsuarios.transform = CGAffineTransformMakeRotation(M_PI/-2);
    [self.tableUsuarios setFrame:CGRectMake(30, 30, 647, 375)];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[GerenciadorComponenteView sharedManager]addComponentesBotaoVoltar:self:0:-8];
    
    self.viewPrincipal.layer.cornerRadius = 20.0f;
    self.viewPrincipal.layer.borderWidth = 1.0f;
    self.viewPrincipal.layer.borderColor = [UIColor blackColor].CGColor;

    self.tableUsuarios.transform = CGAffineTransformMakeRotation(M_PI/-2);
    [self.tableUsuarios setFrame:CGRectMake(30, 30, 647, 375)];
    
    self.tableUsuarios.backgroundColor = [UIColor whiteColor];
    self.tableUsuarios.showsVerticalScrollIndicator = NO;
    self.tableUsuarios.delegate = self;
    self.tableUsuarios.dataSource = self;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 250;
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section{
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[GerenciadorUsuario sharedManager]retornaTodosUsuarios].count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *CellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    Usuario *user = [[[GerenciadorUsuario sharedManager]retornaTodosUsuarios] objectAtIndex:[indexPath row]];
    
    UIImageView *recipeImageView = (UIImageView *)[cell viewWithTag:100];
    recipeImageView.image = [UIImage imageNamed:@"fotoAvatar.jpg"];
    
    UILabel *recipeNameLabel = (UILabel *)[cell viewWithTag:101];
    recipeNameLabel.text = user.nome;

    UIButton *btn = (UIButton *)[cell viewWithTag:102];
    [btn addTarget:self action:@selector(chamaExercicios:) forControlEvents:UIControlEventTouchUpInside];
    
    recipeImageView.transform = CGAffineTransformMakeRotation(M_PI/2);
    recipeNameLabel.transform = CGAffineTransformMakeRotation(M_PI/2);
    btn.transform = CGAffineTransformMakeRotation(M_PI/2);
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"--------->%d",indexPath.row);
}


-(void)chamaExercicios:(id)sender{
    
    NSLog(@"action");
    
}

@end
