import { DatePipe } from '@angular/common';
import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'changeDate',
  pure: false 
})
export class ChangeDatePipe implements PipeTransform {
  // this pipe convert date into "XX month XX day XX hour XX minute XX secound ago"
  transform(date: string, arg1: string,arg2: string): any {
    const Pdate=new Date();
    const Pastdate = new Date(date);
    const timediff = Pdate.getTime()-Pastdate.getTime();
    const Secound1 = Math.floor(timediff/1000);
    const Minute1 = Math.floor(Secound1/60);
    const Hour1 = Math.floor(Minute1/60);
    const Day1 = Math.floor(Hour1/24);
    const Month1 = Math.floor(Day1/30);
    let month,day,hour,minute,secound;

    if (arg1=='month'){
      month=Month1;
      day=Day1-Month1*30;
      hour=Hour1-Day1*24;
      minute=Minute1-Hour1*60;
      secound=Secound1-Minute1*60;
      if (arg2=='month'){
        return month + " month ago" ;
      } 
      else if (arg2=='day'){
        return month + " month " + day + " day ago" ;
      } 
      else if (arg2=='hour'){
        return month + " month " + day + " day " + hour + " hour ago" ;
      } 
      else if (arg2=='minute'){
        return month + " month " + day + " day " + hour + " hour " + minute + " minute ago" ;  
      } 
      else if (arg2=='secound'){
        return month + " month " + day + " day " + hour + " hour " + minute + " minute " + secound + " secound ago";    
      } 
    } 
    else if (arg1=='day'){
      day=Day1;
      hour=Hour1-Day1*24;
      minute=Minute1-Hour1*60;
      secound=Secound1-Minute1*60;
      if (arg2=='day'){
        return  day + " day ago" ;
      } 
      else if (arg2=='hour'){
        return  day + " day " + hour + " hour ago" ;
      } 
      else if (arg2=='minute'){
        return  day + " day " + hour + " hour " + minute + " minute ago" ;  
      } 
      else if (arg2=='secound'){
        return  day + " day " + hour + " hour " + minute + " minute " + secound + " secound ago" ;    
      }     
    } 
    else if (arg1=='hour'){
      hour=Hour1;
      minute=Minute1-Hour1*60;
      secound=Secound1-Minute1*60;
      if (arg2=='hour'){
        return   hour + " hour ago" ;
      } 
      else if (arg2=='minute'){
        return  hour + " hour " + minute + " minute ago" ;  
      } 
      else if (arg2=='secound'){
        return hour + " hour " + minute + " minute " + secound + " secound ago" ;    
      }    
    } 
    else if (arg1=='minute'){
      minute=Minute1;
      secound=Secound1-Minute1*60;
      if (arg2=='minute'){
        return  minute + " minute ago" ;  
      } 
      else if (arg2=='secound'){
        return  minute + " minute " + secound + " secound ago" ;    
      }    
    } 
    else if (arg1=='secound'){
      secound=Secound1;
      if (arg2=='secound'){
        return secound + " secound ago" ;    
      }     
    } 

    
    return "Select valid minimum and maximum argument";
  }
}
