import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class EventServiceService {

  constructor() { }

  public homeflag:boolean=true;
  public eventflag:boolean=false;
  public activityflag:boolean=false;
  public priceflag:boolean=false;
  public publishflag:boolean=false;
}
