import { Component } from '@angular/core';
import { ApiService } from '../api.service';
import { Router } from '@angular/router';
import { EventServiceService } from './event-service.service';

@Component({
  selector: 'app-admin-dashboard',
  templateUrl: './admin-dashboard.component.html',
  styleUrls: ['./admin-dashboard.component.css']
})
export class AdminDashboardComponent {
  
  constructor(public eventService:EventServiceService) { }

  com1=this.eventService.homeflag
  com2=this.eventService.eventflag
  com3=this.eventService.activityflag
  com4=this.eventService.priceflag
  com5=this.eventService.publishflag

  btn1(){
    this.eventService.homeflag=false;
    this.eventService.eventflag=true;
    this.eventService.activityflag=false;
    this.eventService.priceflag=false;
    this.eventService.publishflag=false;
  }
  btn2(){
    this.eventService.homeflag=false;
    this.eventService.eventflag=false;
    this.eventService.activityflag=true;
    this.eventService.priceflag=false;
    this.eventService.publishflag=false;
  }
  btn3(){
    this.eventService.homeflag=false;
    this.eventService.eventflag=false;
    this.eventService.activityflag=false;
    this.eventService.priceflag=true;
    this.eventService.publishflag=false;
  }
  btn4(){
    this.eventService.homeflag=false;
    this.eventService.eventflag=false;
    this.eventService.activityflag=false;
    this.eventService.priceflag=false;
    this.eventService.publishflag=true;
  }
}
