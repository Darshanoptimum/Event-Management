import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'afterdate',
  pure: false 
})
export class AfterdatePipe implements PipeTransform {
  // this pipe conver date into "start in XX month XX day"
  transform(date: string): any {
    const Pdate=new Date();
    const Pastdate = new Date(date);
    const timediff = Pastdate.getTime()-Pdate.getTime();
    const Secound1 = Math.floor(timediff/1000);
    const Minute1 = Math.floor(Secound1/60);
    const Hour1 = Math.floor(Minute1/60);
    const Day1 = Math.floor(Hour1/24);
    const Month1 = Math.floor(Day1/30);
    let month,day,hour,minute,secound;
      month=Month1;
      day=Day1-Month1*30;
      hour=Hour1-Day1*24;
      minute=Minute1-Hour1*60;
      secound=Secound1-Minute1*60;
    
    if(month==0){
      return day + " day "
    }else if(month<0){
      return "On going"
    }
    
    return month + " month " + day + " day "
  }

}
