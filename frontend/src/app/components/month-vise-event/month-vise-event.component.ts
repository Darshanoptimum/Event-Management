import { Component, ElementRef } from '@angular/core';
import { FormBuilder } from '@angular/forms';
import { Router } from '@angular/router';
import { VieweventGuard } from 'src/app/Guard/viewevent.guard';
import { ApiService } from '../api.service';
import { Event } from '../event';
import { Monthdata } from '../monthdata';

@Component({
  selector: 'app-month-vise-event',
  templateUrl: './month-vise-event.component.html',
  styleUrls: ['./month-vise-event.component.css']
})
export class MonthViseEventComponent {
  constructor(private fb: FormBuilder, private apiService: ApiService, private elementRef: ElementRef, private router: Router, private viewGuard: VieweventGuard) { }
  event !: Monthdata[];
  events = new Monthdata();
  event_count:any;
  hoverMonth:any;
  flag = false;
  opendataflag=false;
  ngOnInit(): void {
    this.events.flag="Month";
    this.apiService.addPerson(this.events, "api/GetMonthViseEvent")
        .subscribe(
          data => {
            if (data.ArrayOfResponse.length > 0) {
              this.event = data.ArrayOfResponse;
            }
            console.log(this.event)
            // console.log(data.ArrayOfResponse.Startdate)
          },
          error => {
            alert("Error")
            console.log(error);
          });
  }
  Event(month:string){
    this.flag=true;
    this.event.forEach(element => {
      if(element.MONTH==month){
        this.event_count=element.Total_Event
        this.hoverMonth=month;
        this.opendataflag=true;
      }
      console.log(this.event_count);
    });
  }
  Event2(month:string){
    this.flag=false;
    this.event_count=undefined;
    this.hoverMonth=month;

  }
  clickOnmonth(month:string){
    if(this.opendataflag){
    this.apiService.selectMonth=month;
    this.router.navigate(["/monthdata"])
    }else{
      alert("There are no event in "+month)
    }
  }
}
