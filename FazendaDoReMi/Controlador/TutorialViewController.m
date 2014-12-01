//
//  TutorialViewController.m
//  FazendaDoReMi
//
//  Created by Vinicius Resende Fialho on 30/11/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import "TutorialViewController.h"

@interface TutorialViewController ()

@end

@implementation TutorialViewController

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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   //[self limparDados];
    
    
    self.result = @"vini";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnTodos:(id)sender {
    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:[NSEntityDescription entityForName:@"Usuario" inManagedObjectContext:context]];
    [request setIncludesSubentities:NO]; //Omit subentities. Default is YES (i.e. include subentities)
    NSError *error;
    NSUInteger count = [context countForFetchRequest:request error:&error];
    NSLog(@"numersssos %d",count);
    
    ////////////////////////////////
    
     NSArray *entityObjects = [context executeFetchRequest:request error:&error];
    for(Usuario *object in entityObjects){
        
        NSLog(@"valor %@",[object valueForKey:@"nome"]);
    }
}

- (IBAction)btnDeletar:(id)sender {
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Usuario"];
    
    NSError *error = nil;
    NSArray *entityObjects = [context executeFetchRequest:request error:&error];
    
    for(NSManagedObject *object in entityObjects){
        if([[object valueForKey:@"nome"]isEqualToString:self.txtCampoNome.text]){
            [context deleteObject:object];
        }
    }
    
    [context save:&error];
    
    self.txtCampoNome.text = @"";
    

    
}

- (IBAction)btnAtualizar:(id)sender {
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Usuario"];
    
    NSError *error = nil;
    NSArray *entityObjects = [context executeFetchRequest:request error:&error];
    
    
    for(Usuario *user in entityObjects){
        if([[user nome] isEqualToString:self.result]){
            
            [user setNome:self.txtCampoNome.text];
            
            [context save:&error];
            
            self.txtCampoNome.text = @"";
            
        }
    }
    
    
}

- (IBAction)btnCadastrarUsuario:(id)sender {
    //NSLog(@"nn %@",self.txtCampoNome.text);
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    Usuario *novoUsuario = [NSEntityDescription insertNewObjectForEntityForName:@"Usuario" inManagedObjectContext:context];
    
    [novoUsuario setNome:self.txtCampoNome.text];
    
    NSError *error;
    [context save:&error];
    
    self.txtCampoNome.text = @"";

}

- (IBAction)btnPesquisar:(id)sender {
    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Usuario"];
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"(nome = %@)",self.txtCampoNome.text];
    [request setPredicate:pred];
    Usuario *matches = nil;
    
    NSError *error;
    NSArray *objects = [context executeFetchRequest:request error:&error];
    
    if([objects count] == 0){
        NSLog(@"sem dados");
    }else {
        matches = objects[0];
        NSLog(@"contatos encontrados");
        NSLog(@"nome %@,",matches.nome);
    
    }
}


-(void)limparDados{
    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    
    [appDelegate.managedObjectContext lock];
    NSArray *stores = [appDelegate.persistentStoreCoordinator persistentStores];
    for(NSPersistentStore *store in stores) {
        [appDelegate.persistentStoreCoordinator removePersistentStore:store error:nil];
        [[NSFileManager defaultManager] removeItemAtPath:store.URL.path error:nil];
    }
    [appDelegate.managedObjectContext unlock];

}




@end
