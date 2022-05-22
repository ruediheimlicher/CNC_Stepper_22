//
//  rElement.m
//  USB_Stepper
//
//  Created by Ruedi Heimlicher on 20.September.11.
//  Copyright 2011 Skype. All rights reserved.
//

#import "rElement.h"


@implementation rElement 

- (id)init
{
    self = [super init];
    if (self) 
    {
        // Initialization code here.
    }
    
    return self;
}

- (NSPoint)Startpunkt
{
   return Startpunkt;
}
- (NSPoint)Endpunkt
{
   return Endpunkt;
}
- (NSArray*)ElementdatenArray
{
   return ElementdatenArray;
}

- (int)ElementSichern
{
   int erfolg=0;
   NSLog(@"ElementSichern");
   BOOL ElementDa=NO;
   BOOL istOrdner;
   NSError* error=0;
   NSFileManager *Filemanager = [NSFileManager defaultManager];
   NSString* LibPfad=[NSHomeDirectory() stringByAppendingFormat:@"%@%@%@",@"/Documents",@"/CNCDaten",@"/ElementLib"];
   ElementDa= ([Filemanager fileExistsAtPath:LibPfad isDirectory:&istOrdner]&&istOrdner);
   NSLog(@"ElementSichern:    LibPfad: %@",LibPfad );	
   if (ElementDa)
   {
      ;
   }
   else
   {
      BOOL OrdnerOK=[Filemanager createDirectoryAtPath:LibPfad withIntermediateDirectories:NO  attributes:NULL error:&error];
      //Datenordner ist noch leer
      
   }

  
   return erfolg;
}

- (rElement*)ElementHolen:(NSString*)LibName
{
   int erfolg=0;
   /*
    
    NSPoint  Startpunkt;
    NSPoint  Endpunkt;
    NSArray* ElementdatenArray;
    NSString* Elementname;

    */
   rElement* LibElement = [rElement init];
   NSLog(@"ElementHolen");
   BOOL istOrdner;
   NSFileManager *Filemanager = [NSFileManager defaultManager];
   NSString* LibPfad=[NSHomeDirectory() stringByAppendingFormat:@"%@%@",@"/Documents",@"/CNCDaten",@"/ElementLib"];
   erfolg= ([Filemanager fileExistsAtPath:LibPfad isDirectory:&istOrdner]&&istOrdner);
   NSLog(@"Elementholen:   LibPfad: %@",LibPfad);	
   if (erfolg)
   {
      
      //NSLog(@"Elementholen: tempPListDic: %@",[tempPListDic description]);
      
      NSString* PListPfad;
      //NSLog(@"\n\n");
      LibPfad=[LibPfad stringByAppendingPathComponent:LibName];
      NSLog(@"Elementholen: LibPfad: %@ ",LibPfad);
      if ([Filemanager fileExistsAtPath:LibPfad])
      {
         NSDictionary* libdic = [NSDictionary dictionaryWithContentsOfFile:LibPfad];
         if (libdic)
         {
         LibElement=[NSDictionary dictionaryWithContentsOfFile:LibPfad];
         }
      }
      
   }// erfolg
  
   return LibElement;
}

/*
- (void)dealloc
{
    [super dealloc];
}
*/
@end
