
Extract keywords following a pound sign in a large text file using sas streaming input with double @ sign                  
                                                                                                                           
I simplified the SA Forum solution but might not be as general.                                                            
Seems to work for missing and sigle letter keywords and keywords up to 20 characters?                                      
                                                                                                                           
github                                                                                                                     
https://tinyurl.com/y555lusj                                                                                               
https://communities.sas.com/t5/New-SAS-User/Reading-In-Obscure-Data-Only-Keep-Data-That-Follows-Specific/m-p/542638        
                                                                                                                           
PG Stats                                                                                                                   
https://communities.sas.com/t5/user/viewprofilepage/user-id/462                                                            
                                                                                                                           
                                                                                                                           
*_                   _                                                                                                     
(_)_ __  _ __  _   _| |_                                                                                                   
| | '_ \| '_ \| | | | __|                                                                                                  
| | | | | |_) | |_| | |_                                                                                                   
|_|_| |_| .__/ \__,_|\__|                                                                                                  
        |_|                                                                                                                
;                                                                 | RULES (extract keywords sfter #)                       
                                                                  |                                                        
                                                                  | Keywords                                               
                                                                  | --------                                               
 \u2600\ufe0f \ud83c\udf1e\n#Freude #FreudeCrewMember#a           | Freude                                                 
 #FreudeAmKFZ #VWJetta #mk2 #volkswagen                           | FreudeCrewMember                                       
 #AudiS3 #Audi #VWAudi #VAG #lowered #boost #orange               | a                                                      
 favourite word but at least he\u2019s throwing some colours      | FreudeAmKFZ                                            
 #red #car #tuning #summer #comingsoon #carmeet #seasoniscoming   | VWJetta                                                
 #driving #carsarelife #static @red_jetta_1.8_t"                  | ...                                                    
 taken_at_timestamp":1552422264,"dimensions"                      |                                                        
                                                                                                                           
*            _               _                                                                                             
  ___  _   _| |_ _ __  _   _| |_                                                                                           
 / _ \| | | | __| '_ \| | | | __|                                                                                          
| (_) | |_| | |_| |_) | |_| | |_                                                                                           
 \___/ \__,_|\__| .__/ \__,_|\__|                                                                                          
                |_|                                                                                                        
;                                                                                                                          
                                                                                                                           
                                                                                                                           
WORK.WANT obs=23                                                                                                           
                                                                                                                           
Obs    KEYWORD                                                                                                             
                                                                                                                           
  1    Freude                                                                                                              
  2    FreudeCrewMember#a                                                                                                  
  3    FreudeAmKFZ                                                                                                         
  4    VWJetta                                                                                                             
  5    mk2                                                                                                                 
  6    volkswagen                                                                                                          
  7    AudiS3                                                                                                              
  8    Audi                                                                                                                
  9    VWAudi                                                                                                              
 10    VAG                                                                                                                 
 11    lowered                                                                                                             
 12    boost                                                                                                               
 13    orange                                                                                                              
 14    red                                                                                                                 
 15    car                                                                                                                 
 16    tuning                                                                                                              
 17    summer                                                                                                              
 18    comingsoon                                                                                                          
 19    carmeet                                                                                                             
 20    seasoniscoming                                                                                                      
 21    driving                                                                                                             
 22    carsarelife                                                                                                         
 23    static                                                                                                              
                                                                                                                           
*          _       _   _                                                                                                   
 ___  ___ | |_   _| |_(_) ___  _ __                                                                                        
/ __|/ _ \| | | | | __| |/ _ \| '_ \                                                                                       
\__ \ (_) | | |_| | |_| | (_) | | | |                                                                                      
|___/\___/|_|\__,_|\__|_|\___/|_| |_|                                                                                      
                                                                                                                           
;                                                                                                                          
                                                                                                                           
*Solution may not work for missing keywords, but does work for                                                             
single letter keyword;                                                                                                     
                                                                                                                           
data have;                                                                                                                 
    length keyword $20;                                                                                                    
    input @"#" keyword  +(-2) @@;                                                                                          
    keyword=compress(keyword,'#');                                                                                         
    output;                                                                                                                
cards4;                                                                                                                    
\u2600\ufe0f \ud83c\udf1e\n#Freude #FreudeCrewMember#a                                                                     
#FreudeAmKFZ #VWJetta #mk2 #volkswagen                                                                                     
#AudiS3 #Audi #VWAudi #VAG #lowered #boost #orange                                                                         
favourite word but at least he\u2019s throwing some colours                                                                
#red #car #tuning #summer #comingsoon #carmeet #seasoniscoming                                                             
#driving #carsarelife #static @red_jetta_1.8_t"                                                                            
taken_at_timestamp":1552422264,"dimensions"                                                                                
;;;;                                                                                                                       
run;quit;                                                                                                                  
                                                                                                                           
