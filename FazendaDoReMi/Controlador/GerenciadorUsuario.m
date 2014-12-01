//
//  GerenciadorUsuario.m
//  FazendaDoReMi
//
//  Created by Vinicius Resende Fialho on 30/11/14.
//  Copyright (c) 2014 EMERSON BARROS | VINICIUS RESENDE. All rights reserved.
//

#import "GerenciadorUsuario.h"

@implementation GerenciadorUsuario


////////////////////////////// SINGTON //////////////////////////////

//Singleton
+(GerenciadorUsuario*)sharedManager{
    static GerenciadorUsuario *mascote = nil;
    if(!mascote){
        mascote = [[super allocWithZone:nil] init];
    }
    return mascote;
}

-(id)init{
    self = [super init];
    if(self){
        self.usuarioLogado = [[Usuario alloc]init];
    }
    return self;
}

+(id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedManager];
}


-(void)setaUsuarioAtual:(Usuario*)usuario{
    self.usuarioLogado.nome = usuario.nome;
}


////////////////////////////// GERAL //////////////////////////////

-(void)limparDadosBanco{
    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    
    [appDelegate.managedObjectContext lock];
    NSArray *stores = [appDelegate.persistentStoreCoordinator persistentStores];
    for(NSPersistentStore *store in stores) {
        [appDelegate.persistentStoreCoordinator removePersistentStore:store error:nil];
        [[NSFileManager defaultManager] removeItemAtPath:store.URL.path error:nil];
    }
    [appDelegate.managedObjectContext unlock];
}


-(int)retornaNumeroUsuarios{
    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:[NSEntityDescription entityForName:@"Usuario" inManagedObjectContext:context]];
    [request setIncludesSubentities:NO]; //Omit subentities. Default is YES (i.e. include subentities)
    NSError *error;
    NSUInteger count = [context countForFetchRequest:request error:&error];
   
    NSLog(@"numersssos %d",count);
    
    return count;
}

-(NSArray*)retornaTodosUsuarios{
   
    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:[NSEntityDescription entityForName:@"Usuario" inManagedObjectContext:context]];
    [request setIncludesSubentities:NO]; //Omit subentities. Default is YES (i.e. include subentities)
    NSError *error;
  
    NSArray *entityObjects = [context executeFetchRequest:request error:&error];
    
    for(Usuario *object in entityObjects){
        NSLog(@"valor %@",[object valueForKey:@"nome"]);
    }
    
    return entityObjects;
    
}





/////////////////////////  USUARIO ////////////////////////////////


-(void)atualizarNomeUsuario:(NSString*)nomeAtual :(NSString*)paramentroMudar{
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Usuario"];
    
    NSError *error = nil;
    NSArray *entityObjects = [context executeFetchRequest:request error:&error];
    
    for(Usuario *user in entityObjects){
        if([[user nome] isEqualToString:nomeAtual]){
            [user setNome:paramentroMudar];
            [context save:&error];
        }
    }
}


-(void)deletarUsuario:(NSString*)nomeUsuario{
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Usuario"];
    
    NSError *error = nil;
    NSArray *entityObjects = [context executeFetchRequest:request error:&error];
    
    for(NSManagedObject *object in entityObjects){
        if([[object valueForKey:@"nome"]isEqualToString:nomeUsuario]){
            [context deleteObject:object];
        }
    }
    
    [context save:&error];
}


-(void)cadastrarUsuario:(Usuario*)usuario{
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    Usuario *novoUsuario = [NSEntityDescription insertNewObjectForEntityForName:@"Usuario" inManagedObjectContext:context];
    
    [novoUsuario setNome:usuario.nome];
}

-(Usuario*)retornaUsuario:(NSString*)nomeUsuario{
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Usuario"];
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"(nome = %@)",nomeUsuario];
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
    
    return matches;
}


@end
